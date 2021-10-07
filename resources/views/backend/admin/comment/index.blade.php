@extends('backend.layouts.admin')
@section('title','Comment')

@section('js')
    <script src="{{ asset('backend/vendors/sweetAlert2/sweetalert2@11.js')}}"></script>
    <script type="text/javascript" src="{{ asset('backend/admins/main.js')}}"></script>
@endsection

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Comment','key' => 'Danh sách'])

    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
{{--                    <div class="col-md-12">--}}
{{--                        <a href="" class="btn btn-success float-right m-2">Thêm</a>--}}
{{--                    </div>--}}
                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Bình luận</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($comments as $comment)
                                <tr>
                                    <th scope="row">{{ $comment->id }}</th>

                                    <td>{{ $comment->name }}</td>

                                    <td>{{ $comment->email }}</td>
                                    <td>{{ $comment->content }}</td>
                                    <td>{{ $comment->product->name }}</td>
                                    <td>
                                        <a href="{{ route('comment.delete',['id'=>$comment->id]) }}" class="btn btn-danger action_delete" data-url="{{ route('comment.delete',['id'=>$comment->id]) }}">Xóa</a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12">
                        {{ $comments->links() }}
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection
