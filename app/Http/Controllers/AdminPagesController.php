<?php

namespace App\Http\Controllers;

use App\Pages;
use App\Traits\DeleteModelTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminPagesController extends Controller
{
    //
    use DeleteModelTrait;
    private $page;
    public function __construct(Pages $page)
    {
        $this->page = $page;
    }

    public function index(){
        $pages = $this->page->latest()->paginate(5);
        return view('backend.admin.page.index',compact('pages'));
    }
    public function add(){
        return view('backend.admin.page.add');
    }

    public function store(Request $request){
        $data = [
            'title' => $request->title,
            'slug' => str_slug($request->title),
            'slug_parent' => $request->slug_parent,
            'content' => $request->contents,
            'user_id' => Auth::user()->id,
        ];
        $this->page->create($data);
        return redirect()->route('pages.index');
    }

    public function edit($id){
        $pageItem = $this->page->find($id);
        return view('backend.admin.page.edit',compact('pageItem'));
    }
    public function update(Request $request,$id){
        $data = [
            'title' => $request->title,
            'slug' => str_slug($request->title),
            'slug_parent' => $request->slug_parent,
            'content' => $request->contents,
            'user_id' => Auth::user()->id,
        ];

        $pageItem = $this->page->find($id)->update($data);
        return redirect()->route('pages.index');
    }

    public function delete($id){
        return $this->deleteModelTrait($id,$this->page);
    }

}
