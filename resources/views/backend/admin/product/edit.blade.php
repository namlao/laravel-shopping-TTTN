@extends('backend.layouts.admin')
@section('title','Sửa sản phẩm')

@section('css')
    <link href="{{ asset('backend/vendors/select2/select2.min.css') }}" rel="stylesheet"/>
    <link href="{{ asset('backend/admins/product/add/add.css') }}" rel="stylesheet"/>
@endsection

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Product','key' => 'Sửa'])
    <!-- Main content -->
        <form action="{{ route('product.update',['id'=>$product->id]) }}" method="post" enctype="multipart/form-data">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">

                            @csrf
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Tên sản phẩm"
                                       name="name"
                                       value="{{$product->name }}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Giá sản phẩm</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Nhập giá sản phẩm"
                                       name="price"
                                       value="{{$product->price }}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Ảnh đại diện</label>
                                <input type="file"
                                       class="form-control-file"
                                       name="feature_image_path">
                                <div class="col-md-4 container_feature_image">
                                    <div class="row">
                                        <img class="feature_image" src="{{ $product->feature_image_path }}" alt="">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Ảnh chi tiết</label>
                                <input type="file"
                                       multiple
                                       class="form-control-file"
                                       name="image_path[]">
                                <div class="col-md-12 container_image_detail">
                                    <div class="row">
                                        @foreach($product->productImages as $productImageItem)
                                        <div class="col-md-3">
                                            <img class="image_detail" src="{{ $productImageItem->image_path }}" alt="">
                                        </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Chọn danh mục</label>
                                <select class="form-control select2_init" name="category_id">
                                    <option value="">Chọn danh mục</option>
                                    {!!  $htmlOption !!}
                                </select>
                            </div>
                            <div class="form-groups">
                                <label>Tags</label>
                                <select name="tags[]" class="form-control tags_select_choose" multiple="multiple">
                                    @foreach($product->tags as $tagItem)
                                        <option value="{{ $tagItem->name }}" selected>{{$tagItem->name}}</option>
                                    @endforeach
                                </select>
                            </div>

                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Nội dung</label>
                                <textarea name="contents" class="form-control tinymce_editor_init" rows="15">
                                    {{ $product->content }}
                                </textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
        </form>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

@section('js')

    <script src="{{ asset('backend/vendors/select2/select2.min.js') }}"></script>
    <script src="{{asset('backend/vendors/tinymce/js/tinymce.min.js')}}"></script>
    <script src="{{ asset('backend/admins/product/add/add.js') }}"></script>
@endsection
