@extends('frontend.layouts.master')
@section('title','Shop')

@section('css')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <style>
        .img-product-150-350 {
            min-width: 250px;
            min-height: 350px;
            object-fit: contain;
        }
    </style>
@endsection

@section('js')

@endsection

@section('content')



    @include('frontend.components.product.title-area',['name' => 'Tìm kiếm'])


    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <h3>Tìm kiếm với từ khóa: {{$searchKey}}</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        @if(count($itemSearchs) > 0)
                            @foreach($itemSearchs as $itemSearch)
                                <div class="col-md-3 col-sm-6">
                                    <div class="single-shop-product">
                                        <div class="product-upper">
                                            <img class="img-product-150-350" src="{{ $itemSearch->feature_image_path }}"
                                                 alt="">
                                        </div>
                                        <h2>
                                            <a href="{{route('shop.product',['id'=>$itemSearch->id,'slug'=>str_slug($itemSearch->name)])}}">{{ $itemSearch->name }}</a>
                                        </h2>
                                        <div class="product-carousel-price">
                                            <ins>{{ number_format($itemSearch->price,0,',','.') }} VND</ins>
                                        </div>

                                        <div class="product-option-shop">
                                            <a class="add_to_cart_button" data-quantity="1" data-product_sku=""
                                               data-product_id="70"
                                               rel="nofollow" href="{{route('cart.add',['id'=>$itemSearch->id])}}">Thêm
                                                vào
                                                giỏ</a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @else
                            <h2>Không có sản phầm nào</h2>
                        @endif
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        {{$itemSearchs->links()}}
                    </div>
                </div>
            </div>
        </div>
    </div>



@endsection


