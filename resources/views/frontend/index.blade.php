@extends('frontend.layouts.master')
@section('title','Trang chủ')

@section('css')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('frontend/components/index/css/index.css') }}">
@endsection

@section('js')

    <!-- Slider -->
    <script type="text/javascript" src="{{ asset('frontend/js/bxslider.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('frontend/js/script.slider.js') }}"></script>


@endsection

@section('content')
    @include('frontend.components.home.slider')

    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="single-promo promo1">
                        <i class="fas fa-sync"></i>
                        <p>30 Ngày đổi trả</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="single-promo promo2">
                        <i class="fas fa-truck"></i>
                        <p>Miễn phí vận chuyển</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="single-promo promo4">
                        <i class="fas fa-gift"></i>
                        <p>Sản phẩm mới nhất</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->

    <!-- maincontent-area area -->
    @include('frontend.components.home.maincontent-area')
    <!-- End maincontent-area area -->

    <!-- brands area -->
    @include('frontend.components.home.brands')
    <!-- End brands area -->

    <!-- Feature product item -->
    @include('frontend.components.home.feature-product')
    <!-- End Feature product item -->

    <!-- Recommend product item -->
    @include('frontend.components.home.recommend-product')
    <!-- End Recommend product -->
@endsection
