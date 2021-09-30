<div class="product-widget-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="single-product-widget">
                    <h2 class="product-wid-title">Gợi ý cho bạn</h2>
{{--                    <a href="" class="wid-view-more">View All</a>--}}
                    <div class="row">
                        @foreach($productsRecommend as $productsRecommendItem)
                            <div class="col-md-3">
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img class="img-product-350" src="{{ $productsRecommendItem->feature_image_path }}" alt="">
                                        <div class="product-hover">
                                            <a href="{{ route('cart.add',[$productsRecommendItem->id])}}" class="add-to-cart-link"><i class="fas fa-shopping-cart"></i> Thêm vào giỏ</a>
                                            <a href="{{route('shop.product',['id'=>$productsRecommendItem->id,'slug'=>str_slug($productsRecommendItem->name)])}}" class="view-details-link"><i
                                                    class="fas fa-link"></i>Xem chi tiết</a>
                                        </div>
                                    </div>

                                    <h2><a href="{{route('shop.product',['id'=>$productsRecommendItem->id,'slug'=>str_slug($productsRecommendItem->name)])}}">{{ $productsRecommendItem->name }}</a></h2>

                                    <div class="product-carousel-price">
                                        <ins>{{ number_format($productsRecommendItem->price,0,'.',',') }} VND</ins>
                                        {{--                                    <del>$100.00</del>--}}
                                    </div>
                                </div>
                            </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
