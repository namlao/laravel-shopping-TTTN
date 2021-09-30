<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Product;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    //
    private $product;
    private $comment;
    public function __construct(Product $product,Comment $comment)
    {
        $this->product = $product;
        $this->comment = $comment;
    }

    public function home(){
        $products = $this->product->latest()->paginate(5);
        $comments = $this->comment->latest()->paginate(5);
        return view('backend.home',compact('products','comments'));
    }
    public function loginAdmin(){
        if (auth()->check()){
            return redirect()->to('admin');
        }
        return view('backend.login');
    }

    public function postLoginAdmin(Request $request){
        $remember = $request -> has('remember-me') ? true: false;
        if (auth()->attempt([
            'email' => $request->email,
            'password' => $request->password
        ],$remember)){
            return redirect()->to('admin');
        }
//        else{
//            return redirect()->to('admin');
//        }
    }

    public function logoutAdmin(){
        if (auth()->check()){
            auth()->logout();
            return redirect()->to('login');
        }
    }
}
