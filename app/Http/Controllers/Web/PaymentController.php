<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
// use Intervention\Image\Facades\Image;
use Image;

class PaymentController extends Controller
{
    public function stripe(Request $request)
    {
     
        $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));

        $responce = $stripe->checkout->sessions->create([
        'line_items' => [
            [
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => $request->product_name,
                    ],
                    'unit_amount' => $request->price * 100,
                    // 'tax_behavior' => 'exclusive',
                ],
                'quantity' => $request->quantity,
            ],
        ],
        // 'automatic_tax' => ['enabled' => true],
            'mode' => 'payment',
            'success_url' => route('success').'?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('cancel'),
        ]);
 
        if(isset($responce->id) && $responce->id != '')
        {
            session()->put('product_name', $request->product_name);
            session()->put('quantity', $request->quantity);
            session()->put('price', $request->price);
            return redirect($responce->url);
        }
        else
        {
            return redirect(route('cancel'));
        }
    }

    public function success(Request $request)
    {
        if($request->session_id)
        {
            $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));
            $responce = $stripe->checkout->sessions->retrieve($request->session_id);

            $Payments  = DB::table('payments')->insert([
                'payment_id' => $responce->id,
                'product_name' => session()->get('product_name'),
                'quantity' => session()->get('quantity'),
                'amount' => session()->get('price'),
                'currency' => $responce->currency,
                'customer_name' => $responce->customer_details->name,
                'customer_email' => $responce->customer_details->email,
                'payment_status' => $responce->status,
                'payment_method' => "Stripe",
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
 
            return redirect(route('home'))->with('status','Payment sucessfully done');
 
            session()->forget('product_name');
            session()->forget('quantity');
            session()->forget('price');

        }
        else
        {
            return redirect(route('cancel'));
        }
    }

    public function cancel(Request $request)
    {
        return "Payment is canceled";
    }

    public function compressImage($source, $destination, $quality)
    {
        // Get image info
        $imgInfo = getimagesize($source);
        $mime = $imgInfo['mime'];
    
        // Determine the image creation and save functions based on MIME type
        $createImageFunction = null;
        $saveImageFunction = null;
    
        switch ($mime) {
            case 'image/jpeg':
            case 'image/jpg':
                $createImageFunction = 'imagecreatefromjpeg';
                $saveImageFunction = 'imagejpeg';
                break;
    
            case 'image/png':
                $createImageFunction = 'imagecreatefrompng';
                $saveImageFunction = 'imagepng';
                break;
    
            case 'image/gif':
                $createImageFunction = 'imagecreatefromgif';
                $saveImageFunction = 'imagegif';
                break;
    
            case 'image/webp':
                $createImageFunction = 'imagecreatefromwebp';
                $saveImageFunction = 'imagewebp';
                break;
    
            default:
                throw new \Exception('Unsupported image type');
        }
    
        // Check if the create image function exists
        if (!function_exists($createImageFunction) || !function_exists($saveImageFunction)) {
            throw new \Exception('GD library function not available');
        }
    
        // Create a new image from file
        $image = $createImageFunction($source);
    
        // Save image
        if ($mime === 'image/jpeg' || $mime === 'image/jpg') {
            $saveImageFunction($image, $destination, $quality);
        } elseif ($mime === 'image/webp') {
            $saveImageFunction($image, $destination, $quality);
        } else {
            $saveImageFunction($image, $destination);
        }
    
        // Free up memory
        imagedestroy($image);
    }
    

    
    public function ImageCompressor(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:10240',
        ]);

        $image = $request->file('image');
        $destinationPath = public_path('/compressed_images');
        $destination = $destinationPath . '/' . $image->getClientOriginalName();
        
        // Ensure the destination directory exists
        if (!file_exists($destinationPath)) {
            mkdir($destinationPath, 0755, true);
        }
 
        // Compress and save the image
        $this->compressImage($image->getPathName(), $destination, 40);
        
        return redirect(route('home'))->with('success', 'Image compressed successfully');
    }


    // all existing Image Compressor 
//     public function compressAllImagess()
//     {
//         $directory = public_path('uploads');
//         $quality = 75; // Compression quality percentage

//         // Get all image files from the directory
//         $images = \File::allFiles($directory);

//         foreach ($images as $image) {
//             $sourcePath = $image->getRealPath();
//             $destinationPath = $image->getPathname();

//             // Compress image and overwrite the original
//             $this->compressImage($sourcePath, $destinationPath, $quality);
//         }

//         return response()->json(['message' => 'All images have been compressed.']);
//     }

//     private function compressImages($source, $destination, $quality)
//     {
//         // Get image info
//         $info = getimagesize($source);

//         // If getimagesize() fails, skip the file
//         if ($info === false) {
//             return;
//         }

//         if ($info['mime'] == 'image/jpeg') {
//             $image = imagecreatefromjpeg($source);
//         } elseif ($info['mime'] == 'image/gif') {
//             $image = imagecreatefromgif($source);
//         } elseif ($info['mime'] == 'image/png') {
//             $image = imagecreatefrompng($source);
//         } else {
//             // If the image type is not supported, skip compression
//             return;
//         }

//         // Save compressed image
//         imagejpeg($image, $destination, $quality);

//         // Clean up memory
//         imagedestroy($image);
//     }
//  // all existing Image Compressor 
}
