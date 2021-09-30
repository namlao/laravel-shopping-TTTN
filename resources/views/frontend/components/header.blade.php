<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="user-menu">
                    <ul>
                        @if(auth()->check())
                            <li><a href="{{route('admin.home')}}"><i class="fa fa-user"></i> {{ auth()->user()->name}}
                                </a></li>
                        @endif
                        <li><a href="{{route('cart.index')}}"><i class="fa fa-user"></i>Giỏ hàng </a></li>
{{--                        <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>--}}
                        @if(!auth()->check())
                            <li><a href="{{route('login')}}"><i class="fa fa-user"></i> Đăng nhập</a></li>
                        @endif

                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="user-menu floatright">
                    <ul>
                        <li><a href="tel:{{\App\Helper\getConfigValue::getConfigValue('phone_contact')}}"><i
                                    class="fa fa-phone"></i>{{\App\Helper\getConfigValue::getConfigValue('phone_contact')}}
                            </a></li>
                        <li><a href="mailto:{{\App\Helper\getConfigValue::getConfigValue('email')}}"><i
                                    class="fa fa-envelope"></i> {{\App\Helper\getConfigValue::getConfigValue('email')}}
                            </a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo">
                    <h1><a href="{{url('')}}">Máy tính đây</a></h1>
                </div>
            </div>
            <div class="col-md-6">
                <form action="{{asset('search')}}" class="form-group form-search">
                    <input type="text" placeholder="Tìm sản phẩm..." name="keyword">
                    <input type="submit" value="Tìm kiếm" class="btn btn-primary">
                </form>
            </div>
            <div class="col-sm-3">
                <div class="shopping-item">
                    <a href="{{route('cart.index')}}">Giỏ - <span class="cart-amunt">{{Cart::total()}}</span> <i
                            class="fa fa-shopping-cart"></i>
                        <span class="product-count">{{Cart::count()}}</span></a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->

@include('frontend.components.main-menu')
 <!-- End mainmenu area -->
