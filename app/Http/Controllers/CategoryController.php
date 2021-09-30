<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\Components\Recusive;

class CategoryController extends Controller
{
    //
    private $category;
    public function __construct(Category $category)
    {
        $this -> category = $category;
    }

    public function create()
    {
        $htmlOption = $this->getCategory($parent_id='');
        return view('backend.admin.category.add',compact('htmlOption'));
    }

    public function index()
    {
        # code...
        $categories = $this->category->latest()->paginate(5);
        return view('backend.admin.category.index',compact('categories'));
    }

    public function store(Request $request){
        $this->category->create([
            'name' => $request->name,
            'parent_id' => $request->parent_id,
            'slug' => str_slug($request->name)
        ]);
        return redirect()->route('categories.index');
    }
    public function getCategory($parent_id){
        $data = $this->category->all();
        $recusive = new Recusive($data);
        $htmlOption = $recusive->categoryRecusive($parent_id);
        return $htmlOption;
    }
    public function edit($id){
        $category = $this->category->find($id);
        $htmlOption = $this->getCategory($category->parent_id);
        return view('backend.admin.category.edit',compact('category','htmlOption'));
    }
    public function update(Request $request,$id){
        $this->category->find($id)->update([
            'name' => $request->name,
            'parent_id' => $request->parent_id,
            'slug' => str_slug($request->name)
        ]);
        return redirect()->route('categories.index');
    }

    public function delete($id){
        $this->category->find($id)->delete();
        return redirect()->route('categories.index');
    }
}
