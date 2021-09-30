<?php

namespace App\Http\Controllers;

use App\Category;
use App\Menu;
use App\Pages;
use App\Product;
use App\Setting;
use App\Slider;
use Illuminate\Http\Request;

class PageController extends Controller
{
    //
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
    public function getPage($slug){
        $categoriesLimit = $this->category->where('parent_id','0')->get();
        $pageItem = $this->page->where('slug',$slug)->first();
        $pages = $this->page->latest()->get();
        $categories = $this->category->where('parent_id','0')->get();
        $pagesPages = $this->page->where('slug_parent','pages')->get();
        $pagesDV = $this->page->where('slug_parent','dich-vu')->get();
        $pagesLH = $this->page->where('slug_parent','lien-he')->first();
        $menus=$this->menu->get();
        return view('frontend.pages',compact('categoriesLimit','pageItem','pages','categories','pagesPages','pagesDV','pagesLH','menus'));
    }
}
