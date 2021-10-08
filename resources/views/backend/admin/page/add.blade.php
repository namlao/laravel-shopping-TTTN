@extends('backend.layouts.admin')
@section('title','Thêm Trang')
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    @include('backend.partials.content-header',['name' => 'Page','key' => 'Thêm'])
    <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <form action="{{ route('pages.store') }}" method="post">
                            @csrf
                            <div class="form-group">
                                <label>Tên Trang</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Tên trang"
                                       name="title"
                                       value="{{old('title')}}"
                                >
                            </div>
                            <div class="form-group">
                                <label>Slug cha</label>
                                <input type="text"
                                       class="form-control"
                                       placeholder="Slug cha"
                                       name="slug_parent"
                                       value="{{old('slug_parent')}}"
                                >
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Nội dung</label>
                                    <textarea name="contents" class="form-control tinymce_editor_init @error('contents') is-invalid @enderror" rows="15">{{ old('contents') }}</textarea>
                                    @error('contents')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
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


@section('js')

    <script src="{{asset('backend/vendors/tinymce/js/tinymce.min.js')}}"></script>
    <script>
        let editor_config = {
            path_absolute : "/",
            selector: 'textarea.tinymce_editor_init',
            relative_urls: false,
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table directionality",
                "emoticons template paste textpattern"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
            file_picker_callback : function(callback, value, meta) {
                let x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
                let y = window.innerHeight|| document.documentElement.clientHeight|| document.getElementsByTagName('body')[0].clientHeight;

                let cmsURL = editor_config.path_absolute + 'filemanager?editor=' + meta.fieldname;
                if (meta.filetype == 'image') {
                    cmsURL = cmsURL + "&type=Images";
                } else {
                    cmsURL = cmsURL + "&type=Files";
                }

                tinyMCE.activeEditor.windowManager.openUrl({
                    url : cmsURL,
                    title : 'Filemanager',
                    width : x * 0.8,
                    height : y * 0.8,
                    resizable : "yes",
                    close_previous : "no",
                    onMessage: (api, message) => {
                        callback(message.content);
                    }
                });
            }
        };

        tinymce.init(editor_config);
    </script>
@endsection

@section('css')
    <link href="{{ asset('backend/admins/product/add/add.css') }}" rel="stylesheet"/>
@endsection
