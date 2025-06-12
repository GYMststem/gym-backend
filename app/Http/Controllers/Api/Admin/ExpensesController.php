<?php


namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Expenses;
use App\Models\Center;
use Validator;
use DB;

use Illuminate\Http\Request;

class ExpensesController extends Controller
{
    public function GetExpenses(Request $request)
    {   
         
        $expense = Expenses::where('expenses.id', $request->id)
        // ->join('centers', 'centers.id', '=', 'expenses.center_id')
        ->select('expenses.*')
        ->first();
         
         if(!$expense && $request->id !== null)
         {
            return response()->json([
                'status' => 0,
                'message' =>  'Expenses Id Not Found', 
            ], 404);
         }
         elseif($expense && $request->id)
         { 
             $formattedDate = \Carbon\Carbon::parse($expense->created_at)->format('Y-m-d H:i:s');
                
                $expense->c_date = $formattedDate;
            return response()->json([
                'status' => 1,
                'message' =>  'Expenses Get Successfully',
                'data' => $expense
            ], 200);
         }
         else
         { 
            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 10; // Items per page  

             // $expenses = Expenses::paginate($limit, ['*'], 'page', $page);
            $startDate = $request->filter_startdate;
            $endDate = $request->filter_enddate;
            
            $search = $request->search; 

            $ExpSearch = Expenses::where('type_of_expenses','LIKE',"%$search%")
            ->Orwhere('amount','LIKE',"%$search%")
            ->Orwhere('remark','LIKE',"%$search%")
            ->get();

            if($ExpSearch->isEmpty())
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'No Data Found', 
                ],200);
            }
            
            foreach($ExpSearch as $expense)
            {
                $formattedDate = \Carbon\Carbon::parse($expense->created_at)->format('Y-m-d H:i:s');
                
                // dd($formattedDate);
                
                $expense->c_date = $formattedDate;
            }
            
        
            
            if($startDate == null && $endDate == null)
            {
                $expenses = Expenses::paginate($limit, ['*'], 'page', $page); 
            }
            else
            {
                $expenses = Expenses::whereBetween('expense_date', [$startDate, $endDate])
                ->paginate($limit, ['*'], 'page', $page);
            }
                  
            foreach($expenses as $expense)
            {
                $formattedDate = \Carbon\Carbon::parse($expense->created_at)->format('Y-m-d H:i:s');
                
                // dd($formattedDate);
                
                $expense->c_date = $formattedDate;
            }
                 

            // Extract the query string part for pagination URLs
            $firstPageUrl = parse_url($expenses->url(1), PHP_URL_QUERY) ? '/?' . parse_url($expenses->url(1), PHP_URL_QUERY) : null;
            $nextPageUrl = $expenses->nextPageUrl() ? '/?' . parse_url($expenses->nextPageUrl(), PHP_URL_QUERY) : null;
            $prevPageUrl = $expenses->previousPageUrl() ? '/?' . parse_url($expenses->previousPageUrl(), PHP_URL_QUERY) : null;

            // Prepare the pagination links in the specified format
            $formattedLinks = [];

            foreach ($expenses->linkCollection() as $link) {
                // Extract the page number from the URL if it exists
                $url = $link['url'] ? '/?' . parse_url($link['url'], PHP_URL_QUERY) : null;
                $queryParams = [];
                
                if ($url) {
                    parse_str(parse_url($url, PHP_URL_QUERY), $queryParams);
                }
            
                // Cast the page number to an integer, or use null if it's not set
                $pageNumber = isset($queryParams['page']) ? (int) $queryParams['page'] : null;
            
                // Special handling for "Previous" and "Next" links
                if ($link['label'] === '&laquo; Previous' || $link['label'] === 'Next &raquo;') {
                    $formattedLinks[] = [
                        'url' => $url === $prevPageUrl || $url === $nextPageUrl ? $url : $pageNumber,
                        'label' => $link['label'],
                        'active' => $link['active'],
                        'page' => $link['active'] ? $pageNumber : $pageNumber,
                    ];
                } 
                else {
                    $formattedLinks[] = [
                        'url' => $url,
                        'label' => $link['label'],
                        'active' => $link['active'],
                        'page' => $pageNumber,
                    ];
                }
            }

            // Prepare the pagination array
            $pagination = [
                'first_page_url' => $firstPageUrl,
                'from' => $expenses->firstItem(),
                'to' => $expenses->lastItem(),
                'items_per_page' => $limit,
                'last_page' => $expenses->lastPage(),
                'links' => $formattedLinks, // Use the formatted links
                'next_page_url' => $nextPageUrl,
                'page' => (int) $page, // Ensure the page number is sent as an integer
                'prev_page_url' => $prevPageUrl,
                'total' => $expenses->total(), // Get the total number of items
            ];


            return response()->json([
                'status' => 1,
                'message' =>  'Expenses Get Successfully',
                'data' => $request->search == null ? $expenses->items() : $ExpSearch,
                'payload' => [
                    'pagination' => $pagination
                ]
            ], 200);
         }

         
    }

    public function AddUpdateExpense(Request $request)
    {
        // Define the validation rules
        $validator = Validator::make($request->all(), [
             'type_of_expenses' => 'required|string|max:255',
            'amount' => 'required|numeric',
            // 'center_id' => 'required|integer|exists:centers,id', 
            'expense_date' => 'required|date',
            // 'payment_mode' => 'required|string',
            'remark' => 'nullable|string'
        ]);  
        
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
    
        // Check if an expense with the same title already exists for the same center 
        $expense = Expenses::where('id', $request->input('id'))
                        //    ->where('center_id', $request->input('center_id'))
                           ->first();
    
          if ($expense) {
               // If the expense exists and the $id is null or matches the existing expense ID, update it
              if (!$request->id || $request->id == $expense->id) {
                  //  Update the expense
                  $expense->title = $request->input('title') ?? null;
                  $expense->amount = $request->input('amount');
                  $expense->type_of_expenses = $request->input('type_of_expenses');
                  $expense->expense_date = $request->input('expense_date');
                    $expense->payment_mode = $request->input('payment_mode');
                  $expense->remark = $request->input('remark');
                  $expense->save();
    
                  return response()->json([
                      'status' => 1,
                      'message' => 'Expense updated successfully',
                      'data' => $expense
                  ], 200);
              }
          } else {
            // If no expense with the same title exists, create a new one
            $expense = new Expenses;
            $expense->title = $request->input('title') ?? null;
            $expense->amount = $request->input('amount');
            // $expense->center_id = $request->input('center_id');
            $expense->type_of_expenses = $request->input('type_of_expenses');
            $expense->expense_date = $request->input('expense_date');
            // $expense->payment_mode = $request->input('payment_mode');
            $expense->remark = $request->input('remark');
            $expense->created_by = \Auth::user()->id ?? 1; 
            $expense->save();
    
            return response()->json([
                'status' => 1,
                'message' => 'Expense created successfully',
                'data' => $expense
            ], 200);
          }
    
        // If $id doesn't match and expense title already exists, throw an error
        return response()->json([
            'status' => 0,
            'message' => 'Expense title already exists in another record.'
        ], 422);
    }

    public function DeleteExpenses(Request $request,$expense_id)
    {
        $expense = Expenses::where('id', $expense_id)->first();

        if(!$expense)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Expenses not found',
            ],404);
        }
        else
        {
            $expense->delete(); 
            return response()->json([
                'status' => 1,
                'message' => 'Expenses Delete Successful',
            ],200);
        }
    }
}
