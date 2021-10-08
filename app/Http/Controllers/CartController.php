<?php

namespace App\Http\Controllers;

use App\Bill;
use App\BillDetail;
use App\Category;
use App\Customer;
use App\Menu;
use App\Pages;
use App\Product;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use DB;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{

    private $menu;
    private $category;
    private $product;
    private $page;
    private $customer;
    private $bill;
    private $billDetail;

    public function __construct(Menu $menu, Category $category, Product $product, Pages $page, Customer $customer, Bill $bill, BillDetail $billDetail)
    {
        $this->menu = $menu;
        $this->category = $category;
        $this->product = $product;
        $this->product = $product;
        $this->page = $page;
        $this->customer = $customer;
        $this->bill = $bill;
        $this->billDetail = $billDetail;
    }

    public function index()
    {
        $menus = $this->menu->get();
        $categories = $this->category->where('parent_id', '0')->get();
        $categoriesLimit = $this->category->where('parent_id', '0')->get();
        $pages = $this->page->all();
        $pagesPages = $this->page->where('slug_parent', 'pages')->get();
        $pagesDV = $this->page->where('slug_parent', 'dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent', 'lien-he')->first();
        $cartData = Cart::content();
        $cartTotal = Cart::total();

        return view('frontend.cart', compact('categoriesLimit', 'categories', 'pages', 'cartData', 'cartTotal', 'pagesPages', 'pagesDV', 'pagesLH', 'menus'));
    }

    public function add($id)
    {
        $productItem = $this->product->find($id);
        Cart::add(['id' => $id, 'name' => $productItem->name, 'qty' => 1, 'price' => $productItem->price, 'weight' => 550, 'options' => ['img' => $productItem->feature_image_path, 'user' => auth()->id()]]);
//        ->associate('App\Product')
//        foreach(Cart::content() as $row) {
//            echo 'You have ' . $row->qty . ' items of ' . $row->model->name . ' with description: "' . $row->model->description . '" in your cart.';
//        }
        return back();
    }

    public function postAdd($id, Request $request)
    {
        $productItem = $this->product->find($id);
        Cart::add(
            [
                'id' => $id,
                'name' => $productItem->name,
                'qty' => $request->qty,
                'price' => $productItem->price,
                'weight' => 550,
                'options' => ['img' => $productItem->feature_image_path, 'user' => auth()->id()]]
        );


        return back();
    }

    public function delete($rowId)
    {

        if ($rowId == 'all') {
            Cart::destroy();
        } else {
            Cart::remove($rowId);
        }
        return back();
    }

    public function update(Request $request)
    {
        Cart::update($request->rowId, $request->qty);
    }

    public function postIndex(Request $request)
    {
        $data['info'] = $request->all();


        $email = $request->email;
        $data['cart'] = Cart::content();
        $data['total'] = Cart::total();

        //lưu database
        $validate = Validator::make($request->all(), [
            'email' => 'required|email',
            'name' => 'required',
            'phone' => 'required|digits_between:10,12',
            'address' => 'required'
        ]);
        if ($validate->fails()) {
            return redirect()->back()
                ->withErrors($validate)
                ->withInput();
        }
        try {
            DB::beginTransaction();
            $customer_id = $this->customer->create([
                'name' => $request->name,
                'email' => $request->email,
                'phone_number' => $request->phone,
                'address' => $request->address,
                'note' => $request->note

            ]);


            $customer_id = $this->customer->latest()->first();
            $this->bill->create([
                'customer_id' => $customer_id->id,
                'date_order' => date('Y-m-d H:i:s'),
                'total' => str_replace(',', '', Cart::total()),

            ]);
            $bill_id = $this->bill->latest()->first();
            if (count($data['cart']) > 0) {
                foreach ($data['cart'] as $key => $item) {
                    $this->billDetail->create([
                        'bill_id' => $bill_id->id,
                        'product_id' => $item->id,
                        'quantily' => $item->qty,
                        'price' => $item->price,
                    ]);
                }
            }
            //send email
            Mail::send('frontend.layouts.email', $data, function ($message) use ($email) {
                $message->from('maianhnamdev@gmail.com', 'Mai Anh Nam');
                $message->to($email, $email);
                $message->cc('canmotcaiten.tn95@gmail.com', 'Cũng là Nam');
                $message->subject('Xác nhận đơn hàng');
            });
            DB::commit();
            Cart::destroy();
            return redirect()->route('complete');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('message' . $e->getMessage() . ' Line: ' . $e->getLine());
        }

    }

    public function getComplete()
    {
        $menus = $this->menu->get();
        $categoriesLimit = $this->category->where('parent_id', '0')->get();
        $pages = $this->page->all();
        $categories = $this->category->where('parent_id', '0')->get();
        $pagesPages = $this->page->where('slug_parent', 'pages')->get();
        $pagesDV = $this->page->where('slug_parent', 'dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent', 'lien-he')->first();
        return view('frontend.layouts.complele', compact('categoriesLimit', 'pages', 'categories', 'pagesPages', 'pagesDV', 'pagesLH', 'menus'));
    }
//    public function addQty($id,Request $request){
//        dd($request->all());
//    }

}
