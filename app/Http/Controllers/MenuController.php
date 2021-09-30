<?php

namespace App\Http\Controllers;

use App\Components\MenuRecusive;
use App\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class MenuController extends Controller
{
    private $menuRecusive;
    private $menu;
    public function __construct(MenuRecusive $menuRecusive, Menu $menu)
    {
        $this->menuRecusive = $menuRecusive;
        $this->menu = $menu;
    }

    public function index(){
        $menus = $this->menu->paginate(10);
       return view('backend.admin.menus.index',compact('menus'));
    }
    public function create(){
        $optionSelect = $this->menuRecusive->menuRecusiveAdd();
        return view('backend.admin.menus.add',compact('optionSelect'));
    }
    public function store(Request $request){
        $data = [
            'name' => $request->name,
            'parent_id' => $request->parent_id,
        ];
        if (empty($request->slug)){
            $data['slug'] = str_slug($request->name);
        }else{
            $data['slug'] = $request->slug;
        }
        $this->menu->create($data);

        return redirect()->route('menus.index');
    }
    public function edit($id){
        $menuFollowIdEdit = $this->menu->find($id);
        $optionSelect = $this->menuRecusive->menuRecusiveEdit($menuFollowIdEdit->parent_id);
        return view('backend.admin.menus.edit',compact('optionSelect','menuFollowIdEdit'));
    }
    public function update(Request $request,$id){
        $data = [
            'name' => $request->name,
            'parent_id' => $request->parent_id,
        ];
        if (empty($request->slug)){
            $data['slug'] = str_slug($request->name);
        }else{
            $data['slug'] = $request->slug;
        }
        $this->menu->find($id)->update($data);
        return redirect()->route('menus.index');
    }

    public function delete($id){
        try {
            $this->menu->find($id)->delete();
            return redirect()->route('menus.index');
        }catch (\Exception $e){
            Log::error('Error: '.$e->getMessage().' Line:'.$e->getLine());
        }

    }


}
