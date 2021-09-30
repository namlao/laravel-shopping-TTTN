<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <h2 class="section-title">Sản phẩm mới nhất</h2>
                    <div class="product-carousel">
                        @foreach($productSlide as $productSlideItem)
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img class="img-product" src="{{$productSlideItem->feature_image_path}}" alt="">
                                    <div class="product-hover">
                                        <a href="{{ route('cart.add',[$productSlideItem->id]) }}" class="add-to-cart-link"><i class="fas fa-shopping-cart"></i> Thêm vào giỏ</a>
                                        <a href="{{route('shop.product',['id'=>$productSlideItem->id,'slug'=>str_slug($productSlideItem->name)])}}" class="view-details-link"><i
                                                class="fas fa-link"></i> Xem chi tiết</a>
                                    </div>
                                </div>

                                <h2><a href="{{route('shop.product',['id'=>$productSlideItem->id,'slug'=>str_slug($productSlideItem->name)])}}">{{$productSlideItem->name}}</a></h2>

                                <div class="product-carousel-price">
                                    <ins>{{ number_format($productSlideItem->price,0,'.',',') }} VND</ins>
                                    {{--                                    <del>$100.00</del>--}}
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
