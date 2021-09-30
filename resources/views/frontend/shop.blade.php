@extends('frontend.layouts.master')
@section('title','Shop')

@section('css')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('frontend/components/shop/css/shop.css')}}">
@endsection

@section('js')
{{--    <script>--}}
{{--        $(document).ready(function(){--}}

{{--            fetch_customer_data();--}}

{{--            function fetch_customer_data(query = '')--}}
{{--            {--}}
{{--                $.ajax({--}}
{{--                    url:"{{ route('shop.searchAjax') }}",--}}
{{--                    method:'GET',--}}
{{--                    data:{query:query},--}}
{{--                    dataType:'json',--}}
{{--                    success:function(data)--}}
{{--                    {--}}
{{--                        $('productItem').html(data.query);--}}
{{--                    }--}}
{{--                })--}}
{{--            }--}}

{{--            $(document).on('keyup', '#searchAjax', function(){--}}
{{--                var query = $(this).val();--}}
{{--                fetch_customer_data(query);--}}
{{--            });--}}
{{--        });--}}
{{--    </script>--}}
@endsection

@section('content')



    @include('frontend.components.product.title-area',['name' => 'Shop']))


    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                @include('frontend.components.shop.sidebar')
                <div class="col-md-8">
                    <div class="row" id="">
                        @foreach($products as $product)
                            <div class="col-md-4 col-sm-6">
                                <div class="single-shop-product">
                                    <div class="product-upper">
                                        <img class="img-product-150-350" src="{{$product->feature_image_path}}" alt="">
                                    </div>
                                    <h2>
                                        <a href="{{route('shop.product',['id'=>$product->id,'slug'=>str_slug($product->name)])}}">{{ $product->name }}</a>
                                    </h2>
                                    <div class="product-carousel-price">
                                        <ins>{{ number_format($product->price,0,',','.') }}</ins>
                                    </div>

                                    <div class="product-option-shop">
                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku=""
                                           data-product_id="70"
                                           rel="nofollow" href="{{route('cart.add',['id'=>$product->id])}}">Thêm vào
                                            giỏ</a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        {{ $products->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>



@endsection


