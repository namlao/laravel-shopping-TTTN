<?php

namespace App\Http\Controllers;

use App\Category;
use App\Comment;
use App\Menu;
use App\Pages;
use App\Product;
use App\Setting;
use App\Slider;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    //
    private $menu;
    private $setting;
    private $category;
    private $slider;
    private $product;
    private $page;
    private $comment;

    public function __construct(Menu $menu, Setting $setting, Category $category, Product $product, Pages $page,Comment $comment)
    {
        $this->menu = $menu;
        $this->setting = $setting;
        $this->category = $category;
        $this->product = $product;
        $this->page = $page;
        $this->comment = $comment;
    }

    // hiển thị toàn bộ sản phẩm
    public function getShopIndex(Request $request)
    {
        $menus = $this->menu->get();
        $pages = $this->page->latest()->get();
        $categories = $this->category->where('parent_id', '0')->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();

        // sort
        if (!empty($request->sortTime) || !empty($request->sortCharacter) ){
            if ($request->sortCharacter == 'desc'){
                $products = $this->product->orderBy('name','desc')->paginate(12);
            }else{
                $products = $this->product->orderBy('name','asc')->paginate(12);
            }
            if ($request->sortTime == 'new'){
                $products = $this->product->orderBy('created_at','desc')->paginate(12);
            }else{
                $products = $this->product->orderBy('created_at','asc')->paginate(12);
            }
        } else{
            $products = $this->product->paginate(12);
        }

        //filter
        if (!empty($request->price)){
            $products = $this->getPrice($request->price);
        }

        return view('frontend.shop', compact('pages', 'categories', 'products','pagesPages','pagesDV','pagesLH','menus'));
    }

    // trang chi tiết sản phẩm
    public function getProductItem($id)
    {
        $menus = $this->menu->get();
        $productItem = $this->product->find($id);
        $pages = $this->page->latest()->get();
        $categories = $this->category->where('parent_id', '0')->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        return view('frontend.single-product', compact('pages', 'categories', 'productItem','pagesPages','pagesDV','pagesLH','menus'));
    }
    public function postComment(Request $request,$slug){
        $data= [

            'email' => $request->email,
            'content' =>$request->review,
            'product_id' => $slug
            ];
        if (auth()->check()){
            $data['name'] = auth()->user()->name;
        }else{
            $data['name'] = $request->name;
        }
//        dd($data);
        $this->comment->insert($data);
        return back();
    }


    // Hiển thị category ở sidebar
    public function categorySlug(Request $request){ //$parent_id,$slug
        $menus = $this->menu->get();
        $products = $this->product->latest()->paginate(12);
        $pages = $this->page->latest()->get();
        $categories = $this->category->where('parent_id', 0)->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        // $product -> categoryChild(category_id) -> CategoryParent()
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        foreach ($categories as $category){
            foreach ($category->categoryChild as $categoryChild){
                if ($request->slug ==  $categoryChild->slug && $request->parent_id == $categoryChild->parent_id){
                    $products = $this->product->where('category_id',$categoryChild->id)->paginate(15);
                    if (!empty($request->price)){
                        $products = $this->getPrice($request->price);
                    }
                }
            }


        }

        return view('frontend.shop', compact('menus','pagesLH','pages', 'categories','products','pagesPages','pagesDV'));
    }

    public function getPrice($prices){
        $price = explode('-',$prices);
        if (count($price)==1){
            list($min) = explode("-", $prices);
            return $this->product->where('price','>',intval($min))->paginate(12);
        }
        list($min,$max) = explode("-", $prices);
        return $this->product->where('price','>',intval($min))->where('price','<',intval($max))->paginate(12);



    }


}
