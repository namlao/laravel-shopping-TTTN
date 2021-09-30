<?php

namespace App\Http\Controllers;

use App\Permission;
use App\Role;
use App\Traits\DeleteModelTrait;
use Illuminate\Http\Request;

class AdminRoleController extends Controller
{
    //
    use DeleteModelTrait;
    private $role;
    private $permission;
    public function __construct(Role $role,Permission $permission)
    {
        $this->role = $role;
        $this->permission = $permission;
    }

    public function index(){
        $roles = $this->role->paginate(10);
        return view('backend.admin.role.index',compact('roles'));

    }
    public function create(){
        $permissionsParent = $this->permission->where('parent_id',0)->get();
        return view('backend.admin.role.add',compact('permissionsParent'));
    }
    public function store(Request $request){
        $role = $this->role->create([
            'name' => $request->name,
            'display_name' => $request->display_name
        ]);
        $role->permissions()->attach($request->permission_id);
        return redirect()->route('roles.index');
    }

    public function edit($id){

        $permissionsParent = $this->permission->where('parent_id',0)->get();
        $role = $this->role->find($id);
        $permissionsCheckend = $role->permissions;
        return view('backend.admin.role.edit',compact('permissionsParent','role','permissionsCheckend'));
    }

    public function update(Request $request,$id){

        $role = $this->role->find($id);
            $role->update([
            'name' => $request->name,
            'display_name' => $request->display_name
        ]);
        $role->permissions()->sync($request->permission_id);
        return redirect()->route('roles.index');
    }

    public function delete($id){
        return $this->deleteModelTrait($id,$this->role);
    }


}
