<?php

namespace App\Http\Controllers;

use App\Role;
use App\Traits\DeleteModelTrait;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class AdminUserController extends Controller
{
    //
    use DeleteModelTrait;
    private $user;
    private $role;
    public function __construct(User $user,Role $role)
    {
        $this->user = $user;
        $this->role = $role;
    }

    public function index(){
        $users = $this->user->paginate(5);
        return view('backend.admin.user.index',compact('users'));
    }

    public function create(){

        $roles = $this->role->all();
        return view('backend.admin.user.add',compact('roles'));
    }

    public function store(Request $request){
        $validate = Validator::make($request->all(),[
            'name' =>  'required',
            'email' => 'required|email',
            'password' => 'required|min:8|max:20'
        ],[
            'name.required' => 'Tên thành viên là bắt buộc',
            'email.required' => 'Email là bắt buộc',
            'email.email' => 'Email không đúng định dạng',
            'password.required' => 'Password là bắt buộc',
            'password.min' => 'Password không được dưới 8 ký tự',
            'password.max' => 'Password không vượt quá 20 ký tự',
        ]);
        if ($validate->fails()){
            return redirect()->back()
                ->withErrors($validate)
                ->withInput();
        }
        try {
            DB::beginTransaction();
            $user = $this->user->create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);
            $user->roles()->attach($request->role_id);
            DB::commit();
            return redirect()->route('users.index');
        }catch (\Exception $e){
            DB::rollBack();
            Log::error('Message: '.$e->getMessage().' Line: '.$e->getLine());
        }

    }
    public function edit($id){
        $roles = $this->role->all();
        $user = $this->user->find($id);
        $rolesOfUser = $user->roles;
        return view('backend.admin.user.edit',compact('roles','user','rolesOfUser'));
    }
    public function update(Request $request,$id){

        try {
            DB::beginTransaction();
            $this->user->find($id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);
            $user = $this->user->find($id);
            $user->roles()->sync($request->role_id);
            DB::commit();
            return redirect()->route('users.index');
        }catch (\Exception $e){
            DB::rollBack();
            Log::error('Message: '.$e->getMessage().' Line: '.$e->getLine());
        }
    }

    public function delete($id){
        return $this->deleteModelTrait($id,$this->user);

    }
}
