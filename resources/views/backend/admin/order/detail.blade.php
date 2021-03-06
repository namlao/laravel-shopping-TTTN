@extends('backend.layouts.admin')
@section('title','Chi tiết đơn hàng')

@section('js')
    <script src="{{ asset('backend/vendors/sweetAlert2/sweetalert2@11.js')}}"></script>
    <script type="text/javascript" src="{{ asset('backend/admins/main.js')}}"></script>
@endsection

@section('css')
    <style>
        .style-detail-status{
            margin-bottom: 15px;
        }
    </style>
@endsection

@section('content')

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Đơn hàng','key' => 'Chi tiết'])

    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="col-md-4">Thông tin khách hàng</th>
                                <th class="col-md-6"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Thông tin người đặt hàng</td>
                                <td>{{ $customerInfo->name }}</td>
                            </tr>
                            <tr>
                                <td>Ngày đặt hàng</td>
                                <td>{{ $customerInfo->created_at }}</td>
                            </tr>
                            <tr>
                                <td>Số điện thoại</td>
                                <td>{{ $customerInfo->phone_number }}</td>
                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td>{{ $customerInfo->address }}</td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>{{ $customerInfo->email }}</td>
                            </tr>
                            <tr>
                                <td>Ghi chú</td>
                                <td>{{ $customer->note }}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <table id="myTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                        <thead>
                        <tr role="row">
                            <th class="sorting col-md-1" >STT</th>
                            <th class="sorting_asc col-md-4">Tên sản phẩm</th>
                            <th class="sorting col-md-2">Số lượng</th>
                            <th class="sorting col-md-2">Giá tiền</th>
                        </thead>
                        <tbody>
                        @foreach($billInfo as $key => $bill)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ $bill->product_name }}</td>
                                <td>{{ $bill->quantily }}</td>
                                <td>{{ number_format($bill->price) }} VNĐ</td>
                            </tr>
                        @endforeach
                        <tr>
                            <td colspan="3"><b>Tổng tiền</b></td>
                            <td colspan="1"><b class="text-red">{{ number_format($customerInfo->bill_total) }} VNĐ</b></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="col-md-12 style-detail-status">
                        <form action="{{ route('order.updateStatus',['id'=>$customerInfo->bill_id]) }}" method="POST">
                            {{ csrf_field() }}
                            <div class="row">
                                <div class="col-md-8"></div>
                                <div class="col-md-4">
                                    <div class="form-inline">
                                        <label>Trạng thái giao hàng: </label>
                                        <select name="status" class="form-control input-inline" style="width: 200px">
                                            <option value="dang-xu-ly">Đang xử lý</option>
                                            <option value="dang-giao">Đang giao</option>
                                            <option value="da-giao">Đã giao</option>
                                        </select>

                                        <input type="submit" value="Xử lý" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection
