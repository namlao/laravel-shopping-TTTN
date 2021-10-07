<?php

namespace App\Http\Controllers;

use App\Bill;
use App\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Traits\DeleteModelTrait;
class AdminOrderController extends Controller
{
    //
    private $customer;
    private $bill;

    use DeleteModelTrait;
    public function __construct(Customer $customer,Bill $bill)
    {
        $this->customer = $customer;
        $this->bill = $bill;
    }

    public function index(){

        $customers = $this->customer->latest()->get();

        return view('backend.admin.order.index',compact('customers'));
    }
    public function detail($id){
        $customer = $this->customer->find($id);
        $customerInfo = DB::table('customers')
            ->join('bills', 'customers.id', '=', 'bills.customer_id')
            ->select('customers.*', 'bills.id as bill_id', 'bills.total as bill_total', 'bills.status as bill_status')
            ->where('customers.id', '=', $id)
            ->first();

        $billInfo = DB::table('bills')
            ->join('bill_details', 'bills.id', '=', 'bill_details.bill_id')
            ->leftjoin('products', 'bill_details.product_id', '=', 'products.id')
            ->where('bills.customer_id', '=', $id)
            ->select('bills.*', 'bill_details.*', 'products.name as product_name')
            ->get();

        return view('backend.admin.order.detail',compact('customerInfo','billInfo','customer'));
    }

    public function updateStatus(Request $request, $id)
    {
        $bill = Bill::find($id);
        $bill->status = $request->input('status');
        $bill->save();
        Session::flash('message', "Successfully updated");

        return back();
    }

    public function delete($id){
        return $this->deleteModelTrait($id,$this->bill);
    }
}
