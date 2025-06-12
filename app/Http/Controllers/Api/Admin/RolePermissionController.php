<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Response;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolePermissionController extends Controller
{
    //
    public function GetRole(Request $request)
    {

        // $validator = Validator::make($request->all(), [
        //     'api_key' => 'required| in:1'
        // ]); 
         
        // if ($validator->fails()) {
        //     return response()->json([
        //         'status' => 0,
        //         'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
        //     ], 422);
        // } 
        
        if($request->role_id)
        {
            
            $GetRole = Role::where('id', $request->role_id)->first();
            $GetRole->load('permissions');
            if($GetRole) 
            return Response::json([
                'status' => 1,
                'message' => 'Get Role Successfully', 
                'data' => [
                    'center' => $GetRole
                ]
            ]);
            else
            return Response::json([
                'status' => 0,
                'message' => 'No Role Available', 
            ]);
        }
        else {
            

            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 150; // Items per page 
            

            $GetRole = Role::paginate($limit, ['*'], 'page', $page);

            // Extract pagination data
            $pagination = [
                'current_page' => $GetRole->currentPage(),
                'first_page_url' => $GetRole->url(1),
                'from' => $GetRole->firstItem(),
                'last_page' => $GetRole->lastPage(),
                'last_page_url' => $GetRole->url($GetRole->lastPage()),
                'next_page_url' => $GetRole->nextPageUrl(),
                'path' => $GetRole->path(),
                'per_page' => $GetRole->perPage(),
                'prev_page_url' => $GetRole->previousPageUrl(),
                'to' => $GetRole->lastItem(),
                'total' => $GetRole->total(),
            ];
            // Load the permissions relationship
            $GetRole->load('permissions');
            
            if(!$GetRole->isEmpty()) 
            return Response::json([
                'status' => 1,
                'message' => 'Get Role Successfully', 
                'data' => $GetRole->items(),
                'payload' => [
                    'pagination' => $pagination
                ]
            ]);
            else
            return Response::json([
                'status' => 0,
                'message' => 'No Role Available', 
            ]);
        } 

    }

    public function AddUpdateRole(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'select_all_permissions' => 'required|boolean',
        //'api_key' => 'required| in:1',
        'permission_ids' => 'required_if:select_all_permissions,0|json', // Ensure permission_ids is a JSON string
    ]); 

    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    $role = $request->id ? Role::findOrFail($request->id) : new Role;
    $role->name = $request->input('name');
    $role->description = $request->input('description');
    $role->guard_name = 'web';

    // Save the role
    $role->save();

    // Determine permissions to be assigned
    $permissions = [];
    if ($request->input('select_all_permissions') == 1) {
        // Select all permissions
        $permissions = Permission::all();
    } else {
        // Remove spaces from permission_ids string
        $permissionIdsString = str_replace(' ', '', $request->input('permission_ids'));
        
        // Decode the cleaned permission_ids JSON string to an array
        $permissionIds = json_decode($permissionIdsString, true);

        if ($permissionIds) {
            $permissions = Permission::whereIn('id', $permissionIds)->get();
        }
    }

    // Sync the permissions with the role
    $role->syncPermissions($permissions);

    // Load the permissions relationship
    $role->load('permissions');

    // Return a successful response
    return response()->json([
        'status' => 1,
        'message' => $request->id ? 'Update role successfully' : 'Role created successfully',
        'data' => [
            'role' => $role,
        ]
    ], 200);
}

    

    
    


    public function GetPermission(Request $request)
    {

        // $validator = Validator::make($request->all(), [
        //     'api_key' => 'required| in:1'
        // ]); 
         
        // if ($validator->fails()) {
        //     return response()->json([
        //         'status' => 0,
        //         'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
        //     ], 422);
        // } 
        
        if($request->permission_id)
        {
            $GetPermission = Permission::where('id', $request->permission_id)->first();
            $GetPermission->load('roles');
            if($GetPermission) 
            return Response::json([
                'status' => 1,
                'message' => 'Get Permission Successfully', 
                'data' => [
                    'permission' => $GetPermission
                ]
            ]);
            else
            return Response::json([
                'status' => 0,
                'message' => 'No Permission Available', 
            ]);
        }
        else { 
            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 10; // Items per page 
            

            $GetPermission = Permission::paginate($limit, ['*'], 'page', $page);; 

             // Extract pagination data
             $pagination = [
                'current_page' => $GetPermission->currentPage(),
                'first_page_url' => $GetPermission->url(1),
                'from' => $GetPermission->firstItem(),
                'last_page' => $GetPermission->lastPage(),
                'last_page_url' => $GetPermission->url($GetPermission->lastPage()),
                'next_page_url' => $GetPermission->nextPageUrl(),
                'path' => $GetPermission->path(),
                'per_page' => $GetPermission->perPage(),
                'prev_page_url' => $GetPermission->previousPageUrl(),
                'to' => $GetPermission->lastItem(),
                'total' => $GetPermission->total(),
            ];

            $GetPermission->load('roles');
            if(!$GetPermission->isEmpty()) 
            return Response::json([
                'status' => 1,
                'message' => 'Get Permission Successfully', 
                'data' => $GetPermission->items(),
                'payload' => [
                    'pagination' => $pagination
                ]
            ]);
            else
            return Response::json([
                'status' => 0,
                'message' => 'No Permission Available', 
            ]);
        } 

    }

    public function AddUpdatePermissions(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255', 
            //'api_key' => 'required| in:1'
        ]);
 
        // if ($validator->fails()) {
        //     return response()->json([
        //         'status' => 0,
        //         'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
        //     ], 422);
        // } 

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        } 

        $Permissions = $request->id ? Permission::findOrFail($request->id) : new Permission;

        $Permissions->name = $request->input('name');
        $Permissions->guard_name = 'web';

        // Save the package
        $Permissions->save();
    
        // Return a successful response
        return response()->json([
            'status' => 1,
            'message' => $request->id ? 'Update Permission successfully' : 'Permission Create successfully', 
            'data' => [
                'permission' => $Permissions
            ]
        ],200);
    }
    public function GetRolePermission(Request $request)
    {
        if ($request->permission_id) {
            $GetPermission = Permission::where('id', $request->permission_id)->first();
            $GetPermission->load('roles');
    
            if ($GetPermission) {
                $label = $this->extractLabel($GetPermission->name);
                $GetPermission->label = $label;
    
                return Response::json([
                    'status' => 1,
                    'message' => 'Get Permission Successfully',
                    'data' => [
                        'permission' => [
                            $this->extractKey($GetPermission->name) => [$GetPermission]
                        ]
                    ]
                ]);
            } else {
                return Response::json([
                    'status' => 0,
                    'message' => 'No Permission Available',
                ]);
            }
        } else {
            $page = $request->page ?? 1;
            $limit = $request->items_per_page ?? 50;
    
            $GetPermission = Permission::paginate($limit, ['*'], 'page', $page);
    
            // Extract the query string part for pagination URLs
            $firstPageUrl = parse_url($GetPermission->url(1), PHP_URL_QUERY) ? '/?' . parse_url($GetPermission->url(1), PHP_URL_QUERY) : null;
            $nextPageUrl = $GetPermission->nextPageUrl() ? '/?' . parse_url($GetPermission->nextPageUrl(), PHP_URL_QUERY) : null;
            $prevPageUrl = $GetPermission->previousPageUrl() ? '/?' . parse_url($GetPermission->previousPageUrl(), PHP_URL_QUERY) : null;
    
            $formattedLinks = [];
    
            foreach ($GetPermission->linkCollection() as $link) {
                $url = $link['url'] ? '/?' . parse_url($link['url'], PHP_URL_QUERY) : null;
                $queryParams = [];
    
                if ($url) {
                    parse_str(parse_url($url, PHP_URL_QUERY), $queryParams);
                }
    
                $pageNumber = isset($queryParams['page']) ? (int) $queryParams['page'] : null;
    
                if ($link['label'] === '&laquo; Previous' || $link['label'] === 'Next &raquo;') {
                    $formattedLinks[] = [
                        'url' => $url === $prevPageUrl || $url === $nextPageUrl ? $url : null,
                        'label' => $link['label'],
                        'active' => $link['active'],
                        'page' => $link['active'] ? $pageNumber : $pageNumber,
                    ];
                } else {
                    $formattedLinks[] = [
                        'url' => $url,
                        'label' => $link['label'],
                        'active' => $link['active'],
                        'page' => $pageNumber,
                    ];
                }
            }
    
            $pagination = [
                'first_page_url' => $firstPageUrl,
                'from' => $GetPermission->firstItem(),
                'to' => $GetPermission->lastItem(),
                'items_per_page' => $limit,
                'last_page' => $GetPermission->lastPage(),
                'links' => $formattedLinks,
                'next_page_url' => $nextPageUrl,
                'page' => (int) $page,
                'prev_page_url' => $prevPageUrl,
                'total' => $GetPermission->total(),
            ];
    
            $groupedPermissions = [];
    
            $GetPermission->transform(function ($permission) use (&$groupedPermissions) {
                $label = $this->extractLabel($permission->name);
                $key = $this->extractKey($permission->name);
    
                $permission->label = $label;
    
                if (!isset($groupedPermissions[$key])) {
                    $groupedPermissions[$key] = [];
                }
    
                $groupedPermissions[$key][] = $permission;
    
                return $permission;
            });
    
            if (!$GetPermission->isEmpty()) {
                return Response::json([
                    'status' => 1,
                    'message' => 'Get Permissions Successfully',
                    'data' => $groupedPermissions,
                    'payload' => [
                        'pagination' => $pagination
                    ]
                ]);
            } else {
                return Response::json([
                    'status' => 0,
                    'message' => 'No Permissions Available',
                ]);
            }
        }
    }
    
    // Helper functions to extract key and label
    private function extractKey($permissionName)
    {
        return substr($permissionName, 0, strrpos($permissionName, '_'));
    }
    
    private function extractLabel($permissionName)
    {
        return substr($permissionName, strrpos($permissionName, '_') + 1);
    }
    
     public function GetUserRolePermission($user_id)
    {
        $user = User::where('id', $user_id)->first();

        if (!$user) {
            return Response::json([
                'status' => 0,
                'message' => 'No User Available',
            ],404);
        };

        $role = Role::where('id', $user->role)->first();
        $role->load('permissions');
        return Response::json([
            'status' => 1,
            'message' => 'User Role And Permission Get Successfully',
            'data' => $role,
        ],200);
    }
}
