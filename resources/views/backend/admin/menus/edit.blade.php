@extends('backend.layouts.admin')
@section('title','Trang chủ')
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Menus','key' => 'Sửa'])
    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <form action="{{ route('menus.update',['id'=>$menuFollowIdEdit->id]) }}" method="post">
                            @csrf
                            <div class="form-group">
                                <label>Tên Menu</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Nhập tên menu"
                                       name="name"
                                       value="{{ $menuFollowIdEdit->name }}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Slug</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Tùy chỉnh slug"
                                       name="slug"
                                       value="{{$menuFollowIdEdit->slug}}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Danh mục cha</label>
                                <select class="form-control" name="parent_id">
                                    <option value="0">Menu cha</option>
                                    {!! $optionSelect !!}
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
