<?php

namespace App\Http\Controllers;

use App\Category;
use App\Menu;
use App\Pages;
use App\Product;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Mail;

class CartController extends Controller
{

    private $menu;
    private $category;
    private $product;
    private $page;
    public function __construct(Menu $menu,Category $category,Product $product,Pages $page)
    {
        $this->menu = $menu;
        $this->category = $category;
        $this->product = $product;
        $this->product = $product;
        $this->page = $page;
    }

    public function index(){
        $menus = $this->menu->get();
        $categories = $this->category->where('parent_id','0')->get();
        $categoriesLimit = $this->category->where('parent_id','0')->get();
        $pages = $this->page->all();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        $cartData = Cart::content();
        $cartTotal = Cart::total();

        return view('frontend.cart',compact( 'categoriesLimit','categories','pages','cartData','cartTotal','pagesPages','pagesDV','pagesLH','menus'));
    }

    public function add($id){
        $productItem = $this->product->find($id);
        Cart::add(['id' => $id, 'name' => $productItem->name, 'qty' => 1, 'price' => $productItem->price,'weight' => 550, 'options' => ['img' => $productItem->feature_image_path,'user'=>auth()->id()]]);



        return back();
    }

    public function postAdd($id,Request $request){
        $productItem = $this->product->find($id);
        Cart::add(['id' => $id, 'name' => $productItem->name, 'qty' => $request->qty, 'price' => $productItem->price,'weight' => 550, 'options' => ['img' => $productItem->feature_image_path,'user'=>auth()->id()]]);
        return back();
    }

    public function delete($rowId){

         if ($rowId == 'all'){
             Cart::destroy();
         }else{
            Cart::remove($rowId);
         }
         return back();
    }

    public function update(Request $request){
        Cart::update($request->rowId,$request->qty);
    }

    public function postIndex(Request $request){
        $data['info'] = $request->all();
        $email = $request->email;
        $data['cart'] = Cart::content();
        $data['total'] = Cart::total();
        Mail::send('frontend.layouts.email',$data,function ($message) use ($email){
            $message->from('maianhnamdev@gmail.com','Mai Anh Nam');
            $message->to($email,$email);
            $message->cc('canmotcaiten.tn95@gmail.com','Cũng là Nam');
            $message->subject('Xác nhận đơn hàng');
        });
        Cart::destroy();
        return redirect()->route('complete');
    }
    public function getComplete(){
        $menus = $this->menu->get();
        $categoriesLimit = $this->category->where('parent_id','0')->get();
        $pages = $this->page->all();
        $categories = $this->category->where('parent_id','0')->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        return view('frontend.layouts.complele',compact('categoriesLimit','pages','categories','pagesPages','pagesDV','pagesLH','menus'));
    }
    public function addQty($id,Request $request){
        dd($request->all());
    }

}
