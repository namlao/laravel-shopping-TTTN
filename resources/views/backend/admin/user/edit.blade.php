@extends('backend.layouts.admin')
@section('title','Sửa User')

@section('css')
    <link href="{{ asset('backend/vendors/select2/select2.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('backend/admins/user/add/add.css') }}" rel="stylesheet"/>

@endsection

@section('js')

    <script src="{{ asset('backend/vendors/select2/select2.min.js') }}"></script>
    <script src="https://cdn.tiny.cloud/1/uivd8lgrage14jk07ze4g7hozay7dj5z7m7imtltjhwnf681/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="{{ asset('backend/admins/user/add/add.js') }}"></script>
@endsection

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'User','key' => 'Sửa'])
    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <form action="{{ route('users.update',['id' => $user->id]) }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label>Tên</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Nhập tên menu"
                                       name="name"
                                       value="{{ $user->name }}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Nhập Email"
                                       name="email"
                                       value="{{ $user->email }}"
                                >
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input type="password"
                                       class="form-control"
                                       placeholder="Nhập password"
                                       name="password"
                                       value=""
                                >
                            </div>

                            <div class="form-group">
                                <label>Chọn vai trò</label>
                                <select name="role_id[]" id="" class="form-control select2_init" multiple>
                                    <option value=""></option>
                                    @foreach($roles as $role)

                                        <option
                                            {{ $rolesOfUser->contains('id',$role -> id) ? 'selected' : '' }}
                                            value="{{ $role -> id }}"
                                        >
                                            {{ $role -> name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
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
