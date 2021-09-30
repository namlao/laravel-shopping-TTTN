@extends('backend.layouts.admin')
@section('title','Thêm phân quyền')

@section('css')
    <link rel="stylesheet" href="{{ asset('backend/admins/roles/add/add.css') }}">
@endsection

@section('js')
    <script src="{{ asset('backend/admins/roles/add/add.js') }}"></script>
@endsection

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Phần quyền','key' => 'Thêm'])
    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <form action="{{ route('roles.store') }}" method="post" enctype="multipart/form-data" style="width: 100%">
                        <div class="col-md-12">
                            @csrf
                            <div class="form-group">
                                <label>Tên vai trò</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Nhập tên vai trò"
                                       name="name"
                                       value="{{ old('name') }}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Mô tả vai trò</label>
                                <textarea name="display_name" cols="30" rows="4"
                                          class="form-control">{{ old('display_name') }}</textarea>
                            </div>


                        </div>
                        <div class="col-md-12">
                            <div class="row">
                            <div class="col-md-12">
                                <label for="">
                                    <input type="checkbox" class="checkall">
                                    Checkall
                                </label>
                            </div>
                            @foreach($permissionsParent as $permissionsParentItem)
                                <div class="card border-primary mb-3 col-md-12">
                                    <div class="card-header">
                                        <label>
                                            <input type="checkbox" class="checkbox_wrapper" value="">
                                        </label>
                                        Module {{ $permissionsParentItem->name }}
                                    </div>
                                    <div class="row">
                                        @foreach($permissionsParentItem->permissionChildrent as $permissionChildrentItem)
                                            <div class="card-body text-primary col-md-3">
                                                <h5 class="card-title">
                                                    <label>
                                                        <input type="checkbox" class="checkbox_childrent" name="permission_id[]" value="{{ $permissionChildrentItem->id }}">
                                                    </label>
                                                    {{ $permissionChildrentItem->name }}
                                                </h5>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection
