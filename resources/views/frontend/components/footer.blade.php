<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2 class="footer-wid-title">Máy tính đây</h2>
                    <p>{{\App\Helper\getConfigValue::getConfigValue('gioi-thieu')}}</p>
                    <p>Số điện thoại: {{\App\Helper\getConfigValue::getConfigValue('phone_contact')}}</p>
                    <p>Email: {{\App\Helper\getConfigValue::getConfigValue('email')}}</p>
                    <p>Địa chỉ: {{\App\Helper\getConfigValue::getConfigValue('dia-chi')}}</p>
                    <div class="footer-social">
                        <a href="{{\App\Helper\getConfigValue::getConfigValue('facekbook_link')}}" target="_blank"><i
                                class="fab fa-facebook"></i></a>
                        <a href="{{\App\Helper\getConfigValue::getConfigValue('facekbook_link')}}" target="_blank"><i
                                class="fab fa-twitter"></i></a>
                        <a href="{{\App\Helper\getConfigValue::getConfigValue('facekbook_link')}}" target="_blank"><i
                                class="fab fa-youtube"></i></a>
                        <a href="{{\App\Helper\getConfigValue::getConfigValue('facekbook_link')}}" target="_blank"><i
                                class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">HỖ TRỢ KHÁCH HÀNG</h2>
                    <ul>
                        @foreach($pagesPages as $pagesPageItem)
                            <li><a href="{{ url('page/'.$pagesPageItem->slug.'.html') }}">{{$pagesPageItem->title}}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">User Navigation </h2>
                    <ul>
                        <li><a href="{{ route('admin.home') }}">Tài khoản</a></li>
                        <li><a href="{{route('cart.index')}}">Giỏ hàng</a></li>
                        <li><a href="{{'/lien-he/'.$pagesLH->slug.'.html'}}">Liên hệ</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Chuyên mục</h2>
                    <ul>
                        @foreach($categories as $category)
                            <li><a href="{{ url($category->slug) }}">{{ $category->name }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>


        </div>
    </div>
</div> <!-- End footer top area -->

<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2021 Demo bởi <a href="http://www.freshdesignweb.com" target="_blank">Mai Anh Nam</a></p>
                </div>
            </div>

        </div>
    </div>
</div> <!-- End footer bottom area -->
