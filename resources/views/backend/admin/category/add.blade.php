@extends('backend.layouts.admin')
@section('title','Trang chủ')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
@include('backend.partials.content-header',['name' => 'Category','key' => 'Thêm'])
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <form action="{{ route('categories.store') }}" method="post">
                    @csrf
                    <div class="form-group">
                      <label>Tên danh mục</label>
                      <input type="text"
                             class="form-control"
                             placeholder="Tên danh mục"
                             name="name"
                      >
                    </div>
                    <div class="form-group">
                        <label>Danh mục cha</label>
                        <select class="form-control" name="parent_id">
                          <option value="0">Danh mục cha</option>
                          {!!  $htmlOption !!}
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
