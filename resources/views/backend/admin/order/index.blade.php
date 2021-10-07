@extends('backend.layouts.admin')
@section('title','Đơn hàng')

@section('js')
    <script src="{{ asset('backend/vendors/sweetAlert2/sweetalert2@11.js')}}"></script>
    <script type="text/javascript" src="{{ asset('backend/admins/main.js')}}"></script>
@endsection

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Đơn hàng','key' => 'Danh sách'])

    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên người order</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Ngày đặt</th>
                                <th scope="col">Email</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($customers as $customer)
                                <tr>
                                    <th scope="row">{{ $customer->id }}</th>

                                    <td>{{ $customer->name }}</td>

                                    <td>{{ $customer->address }}</td>
                                    <td>{{ $customer->created_at }}</td>
                                    <td>{{ $customer->email }}</td>
                                    <td>@if($customer->bill->status == 'da-giao') {{'Đã giao'}} @elseif($customer->bill->status == 'chua-giao') {{ 'Chưa giao' }} @else {{ 'Đang giao' }} @endif</td>
                                    <td>
{{--                                        {{ route('comment.delete',['id'=>$comment->id]) }}--}}
                                        <a href="{{route('order.detail',['id'=>$customer->id])}}" class="btn btn-primary" data-url="">Xem chi tiết</a>
                                        <a href="{{route('order.delete',['id'=>$customer->bill->id])}}" class="btn btn-danger action_delete" data-url="{{route('order.delete',['id'=>$customer->bill->id])}}">Xóa</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12">
{{--                        {{ $comments->links() }}--}}
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection
