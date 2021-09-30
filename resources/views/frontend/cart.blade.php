@extends('frontend.layouts.master')
@section('title','Trang chủ')

@section('css')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('frontend/components/cart/css/cart.css')}}"/>
@endsection

@section('js')
    <script>
        function updateCart(qty,rowId){
            $.get(
                '{{route('cart.update')}}',
                {qty:qty,rowId:rowId},
                function (){
                    location.reload()
                }

            );
        }
    </script>
@endsection

@section('content')


    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            @if(Cart::count() >= 1)
                            <form method="post" action="#">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                    <tr>
                                        <th class="product-remove">&nbsp;</th>
                                        <th class="product-thumbnail">&nbsp;</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($cartData as $item)
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove"
                                                   href="{{route('cart.delete',[$item->rowId])}}">×</a>
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="{{route('shop.product',['id'=>$item->id,'slug'=>str_slug($item->name)])}}"><img width="145" height="145"
                                                                                   alt="poster_1_up"
                                                                                   class="shop_thumbnail"
                                                                                   src="{{ asset($item->options->img)  }}"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="{{route('shop.product',['id'=>$item->id,'slug'=>str_slug($item->name)])}}">{{ $item->name }}</a>
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">{{ number_format($item->price,0,',','.') }} </span>
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added number-input">
                                                    <input class="quantity" min="0" name="quantity"
                                                           value="{{ $item->qty }}" type="number" onchange="updateCart(this.value,'{{$item->rowId}}')">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span
                                                    class="amount">{{ number_format($item->price*$item->qty,0,',','.') }}</span>
                                            </td>
                                        </tr>
                                    @endforeach
                                    <tr>
                                        <td class="actions" colspan="6">
                                            {{--                                        <div class="coupon">--}}
                                            {{--                                            <label for="coupon_code">Coupon:</label>--}}
                                            {{--                                            <input type="text" placeholder="Coupon code" value="" id="coupon_code" class="input-text" name="coupon_code">--}}
                                            {{--                                            <input type="submit" value="Apply Coupon" name="apply_coupon" class="button">--}}
                                            {{--                                        </div>--}}

{{--                                            <input type="submit" value="Checkout" name="proceed"--}}
{{--                                                   class="btn btn-success">--}}
                                            <a href="{{route('cart.delete',['id'=>'all'])}}" class="btn btn-danger">Xóa
                                                giỏ hàng</a>
{{--                                            {{route('cart.update',['id'=>'all'])}}--}}
                                            <a href="" class="btn btn-warning">Cập nhật
                                                giỏ hàng</a>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>

                            <div class="cart-collaterals">
                                <div class="cross-sells">
                                    <h2>Điền thông tin thanh toán</h2>
                                    <form method="post" action="{{route('cart.postIndex')}}">
                                        <div class="form-group">
                                            <label for="email">Email address</label>
                                            <input type="email" class="form-control" id="email"
                                                   aria-describedby="emailHelp" name="email" placeholder="Nhập email">
                                        </div>
                                        <div class="form-group">
                                            <label for="hoten">Họ và tên</label>
                                            <input type="text" class="form-control" name="name" id="hoten" placeholder="Họ tên">
                                        </div>
                                        <div class="form-group">
                                            <label for="sdt">Số điện thoại</label>
                                            <input type="text" class="form-control" name="phone" id="sdt"
                                                   placeholder="Số điện thoại">
                                        </div>
                                        <div class="form-group">
                                            <label for="diachi">Địa chỉ</label>
                                            <input type="text" class="form-control" name="address" id="diachi" placeholder="Địa chỉ">
                                        </div>

                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        {{csrf_field()}}
                                    </form>

                                </div>


                                <div class="cart_totals ">
                                    <h2>Tổng thanh toán</h2>

                                    <table cellspacing="0">
                                        <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Tổng tiền</th>
                                            <td><span class="amount">{{ $cartTotal }}</span></td>
                                        </tr>

                                        <tr class="shipping">
                                            <th>Vận chuyển</th>
                                            <td>Miễn phí vận chuyển</td>
                                        </tr>

                                        <tr class="order-total">
                                            <th>Tổng đơn đặt hàng</th>
                                            <td><strong><span class="amount">{{ $cartTotal }} VND</span></strong></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            @else
                                <h2>Giỏ hàng trống</h2>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
