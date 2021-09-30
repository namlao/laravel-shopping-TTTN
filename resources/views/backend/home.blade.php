@extends('backend.layouts.admin')
@section('title','Trang chủ')

@section('css')
    <style>
        .cmt-style {
            display: flex;
        }

        .cmt-style h3, .cmt-style p {
            width: 50%
        }

        .cmt-style p {
            text-align: end;
        }
    </style>

@endsection
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Home','key' => 'Home'])

    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <div class="cmt-style">
                                <h3>Sản phẩm</h3>
                                <p>Tổng: {{$products->count()}} sản phẩm</p>
                            </div>
                            <div class="">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($products as $product)
                                        <tr>
                                            <th scope="row">{{$product->id}}</th>
                                            <td>{{$product->name}}</td>
                                            <td>{{$product->price}}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                {{$products->links()}}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-body">
                            <div class="cmt-style">
                                <h3>Bình luận</h3>
                                <p>Tổng: {{$comments->count()}} Bình luận</p>
                            </div>
                            <div class="">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Bình luận</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($comments as $comment)
                                        <tr>
                                            <th scope="row">{{$comment->id}}</th>
                                            <td>{{$comment->name}}</td>
                                            <td>{{$comment->content}}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                {{$comments->links()}}
                            </div>
                        </div>

                    </div>
{{--                    <div class="col-md-6">--}}
{{--                        <div class="card card-body">--}}
{{--                            <div>--}}
{{--                                <h3>Số lần order</h3>--}}
{{--                            </div>--}}
{{--                            <div>--}}
{{--                                <p>{{ Cart::content()->count() }}</p>--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                    </div>--}}
{{--                    <div class="col-md-6">--}}
{{--                        <div class="card card-body">--}}
{{--                            <div>--}}
{{--                                <h3>Thu nhập</h3>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </div>--}}
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection
