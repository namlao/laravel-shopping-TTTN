@extends('backend.layouts.admin')
@section('title','Danh sách page')
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Page','key' => 'Danh sách'])

    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">

                        <a href="{{ route('pages.create') }}" class="btn btn-success float-right m-2">Thêm</a>
                    </div>
                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên trang</th>
                                <th scope="col">Slug cha</th>
                                <th scope="col">Slug</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($pages as $page)
                                <tr>
                                    <th scope="row">{{$page->id}}</th>
                                    <td>{{$page->title}}</td>
                                    <td>{{$page->slug_parent}}</td>
                                    <td>{{$page->slug}}</td>
                                    <td>
                                        <a href="{{ route('pages.edit',['id' => $page->id]) }}" class="btn btn-default">Edit</a>
                                        <a href=""
                                           data-url="{{ route('pages.delete',['id'=>$page->id]) }}"
                                           class="btn btn-danger action_delete">Xóa</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12">
                        {{ $pages->links() }}
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

@section('js')
    <script src="{{ asset('backend/vendors/sweetAlert2/sweetalert2@11.js')}}"></script>
    <script type="text/javascript" src="{{ asset('backend/admins/main.js')}}"></script>
@endsection
