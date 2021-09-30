@extends('frontend.layouts.master')
@section('title','Shop')

@section('css')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('frontend/components/single-product/css/star-rating-svg.css')}}">
    <link rel="stylesheet" href="{{asset('frontend/components/single-product/css/single-product.css')}}">
@endsection

@section('js')
    <script src="{{asset('frontend/components/single-product/js/jquery.star-rating-svg.js')}}"></script>
    <script >
        {{--$(".my-rating").starRating({--}}
        {{--    starSize: 25,--}}
        {{--    callback: function(currentRating, $el){--}}
        {{--        // make a server call here--}}
        {{--        $.get(--}}
        {{--            '{{route('shop.postComment',['id'=>$productItem->id,'slug'=>str_slug($productItem->name)])}}',--}}
        {{--            {star:currentRating},--}}
        {{--            --}}
        {{--        )--}}

        {{--    }--}}
        {{--});--}}
    </script>
@endsection

@section('content')



    @include('frontend.components.product.title-area',['name' => $productItem->category->name])

    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="product-breadcroumb">
                            <a href="{{route('home')}}">Home</a>
                            <a href="{{url('shop/category\\'.$productItem->category->parent_id.'\\'.$productItem->category->slug)}}">{{ $productItem->category->name }}</a>
                            <a href="">{{ $productItem->name }}</a>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="product-images">
                                    <div class="product-main-img">
                                        <img src="{{ $productItem->feature_image_path }}" alt="">
                                    </div>

                                    <div class="product-gallery">
                                        @foreach($productItem->productImages as $productPic)
                                            <img src="{{ $productPic->image_path }}" alt="">
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name">{{$productItem->name}}</h2>
                                    <div class="product-inner-price">
                                        <ins>{{number_format($productItem->price,0,',','.')}} VND</ins>
                                    </div>
                                    <form class="form-group" method="post"  action="{{route('cart.postAdd',['id'=>$productItem->id])}}">
                                        @csrf

                                        <div class="quantity">
                                            <input type="number" size="4" class="input-text qty text" title="Qty"
                                            value="1" name="qty" min="1" step="1">
{{--                                            <a class="btn btn-primary" href="">Thêm vào giỏ</a>--}}
                                            <button type="submit" class="btn btn-primary">Thêm vào giỏ</button>
                                        </div>
                                    </form>

                                    <div class="product-inner-category">
                                        <p>Category: <a href="{{url('shop/category\\'.$productItem->category->parent_id.'\\'.$productItem->category->slug)}}">{{$productItem->category->name}}</a>. </p>
{{--                                        <p>Tags:--}}
{{--                                            @foreach($productItem->tags as $tag)--}}
{{--                                                <a href="{{str_slug($tag->name)}}">{{$tag->name}}</a>--}}
{{--                                            @endforeach--}}
{{--                                        </p>--}}
                                    </div>



                                </div>
                            </div>
                            <div class="col-md-12">
                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home"
                                                                                  role="tab" data-toggle="tab">Mô tả</a>
                                        </li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile"
                                                                   role="tab" data-toggle="tab">Đánh giá</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>Mô tả sản phẩm</h2>
                                            {!! $productItem->content !!}
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="profile">
                                            <h2>Đánh giá</h2>
                                            <form action="{{ route('shop.postComment',['id'=>$productItem->id,'slug'=>str_slug($productItem->name)]) }}" method="post">
                                                @csrf
                                                <div class="submit-review">
                                                    <p><label for="name">Tên</label> <input name="name" type="text">
                                                    </p>
                                                    <p><label for="email">Email</label> <input name="email"
                                                                                               type="email"></p>
{{--                                                    <div class="rating-chooser" >--}}
{{--                                                        <p>Your rating</p>--}}

{{--                                                        <div class="my-rating"></div>--}}


{{--                                                    </div>--}}
                                                    <p><label for="review">Đánh giá</label> <textarea name="review"
                                                                                                         id="" cols="30"
                                                                                                         rows="10"></textarea>
                                                    </p>
                                                    <p><input type="submit" value="Gửi"></p>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


{{--                        <div class="related-products-wrapper">--}}
{{--                            <h2 class="related-products-title">Related Products</h2>--}}
{{--                            <div class="related-products-carousel">--}}
{{--                                <div class="single-product">--}}
{{--                                    <div class="product-f-image">--}}
{{--                                        <img src="img/product-1.jpg" alt="">--}}
{{--                                        <div class="product-hover">--}}
{{--                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add--}}
{{--                                                to cart</a>--}}
{{--                                            <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <h2><a href="">Sony Smart TV - 2015</a></h2>--}}

{{--                                    <div class="product-carousel-price">--}}
{{--                                        <ins>$700.00</ins>--}}
{{--                                        <del>$100.00</del>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="single-product">--}}
{{--                                    <div class="product-f-image">--}}
{{--                                        <img src="img/product-2.jpg" alt="">--}}
{{--                                        <div class="product-hover">--}}
{{--                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add--}}
{{--                                                to cart</a>--}}
{{--                                            <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <h2><a href="">Apple new mac book 2015 March :P</a></h2>--}}
{{--                                    <div class="product-carousel-price">--}}
{{--                                        <ins>$899.00</ins>--}}
{{--                                        <del>$999.00</del>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="single-product">--}}
{{--                                    <div class="product-f-image">--}}
{{--                                        <img src="img/product-3.jpg" alt="">--}}
{{--                                        <div class="product-hover">--}}
{{--                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add--}}
{{--                                                to cart</a>--}}
{{--                                            <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <h2><a href="">Apple new i phone 6</a></h2>--}}

{{--                                    <div class="product-carousel-price">--}}
{{--                                        <ins>$400.00</ins>--}}
{{--                                        <del>$425.00</del>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="single-product">--}}
{{--                                    <div class="product-f-image">--}}
{{--                                        <img src="img/product-4.jpg" alt="">--}}
{{--                                        <div class="product-hover">--}}
{{--                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add--}}
{{--                                                to cart</a>--}}
{{--                                            <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <h2><a href="">Sony playstation microsoft</a></h2>--}}

{{--                                    <div class="product-carousel-price">--}}
{{--                                        <ins>$200.00</ins>--}}
{{--                                        <del>$225.00</del>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="single-product">--}}
{{--                                    <div class="product-f-image">--}}
{{--                                        <img src="img/product-5.jpg" alt="">--}}
{{--                                        <div class="product-hover">--}}
{{--                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add--}}
{{--                                                to cart</a>--}}
{{--                                            <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <h2><a href="">Sony Smart Air Condtion</a></h2>--}}

{{--                                    <div class="product-carousel-price">--}}
{{--                                        <ins>$1200.00</ins>--}}
{{--                                        <del>$1355.00</del>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="single-product">--}}
{{--                                    <div class="product-f-image">--}}
{{--                                        <img src="img/product-6.jpg" alt="">--}}
{{--                                        <div class="product-hover">--}}
{{--                                            <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add--}}
{{--                                                to cart</a>--}}
{{--                                            <a href="" class="view-details-link"><i class="fa fa-link"></i> See details</a>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}

{{--                                    <h2><a href="">Samsung gallaxy note 4</a></h2>--}}

{{--                                    <div class="product-carousel-price">--}}
{{--                                        <ins>$400.00</ins>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                    </div>
                </div>
            </div>
        </div>
    </div>



@endsection


