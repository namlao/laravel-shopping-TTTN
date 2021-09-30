<?php

namespace App\Http\Controllers;

use App\Category;
use App\Menu;
use App\Pages;
use App\Product;
use App\Setting;
use App\Slider;
use Illuminate\Http\Request;

class FrontendHomeController extends Controller
{

    private $menu;
    private $setting;
    private $category;
    private $slider;
    private $product;
    private $page;

    public function __construct(Menu $menu,Setting $setting,Category $category,Slider $slider,Product $product,Pages $page)
    {
        $this->menu = $menu;
        $this->setting = $setting;
        $this->category = $category;
        $this->slider = $slider;
        $this->product = $product;
        $this->page = $page;
    }

    public function index(){
//        $menus = $this->menu->where('parent_id',0)->get();
        $categories = $this->category->where('parent_id','0')->get();
        $categoriesLimit = $this->category->where('parent_id','0')->get();
        $sliders = $this->slider->take(5)->get();
        $productSlide = $this->product->latest()->take(10)->get();
        $productsFeature = $this->product->latest('like_count','desc')->take(4)->get();
        $productsRecommend = $this->product->latest('view_count','desc')->take(4)->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        $menus = $this->menu->get();
        return view('frontend.index',compact('categoriesLimit','categories','sliders','productSlide','productsFeature','productsRecommend','pagesPages','pagesDV','pagesLH','menus'));
    }

    public function getSearch(Request $request){
        $pages = $this->page->latest()->get();
        $categories = $this->category->where('parent_id','0')->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $search = $request->keyword;
        $searchKey = $search;
        $search = str_replace(' ','%',$search);
        $itemSearchs = $this->product->where('name','like','%'.$search.'%')->paginate(15);
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        $menus = $this->menu->get();
        return view('frontend.search',compact('itemSearchs','pages','categories','searchKey','pagesPages','pagesDV','pagesLH','menus'));
    }




}
