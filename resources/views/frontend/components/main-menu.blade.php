<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="nav-item">
                        <a href="{{route('home')}}" class="navbar-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('shop.index')}}" class="navbar-link">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('shop.index')}}" class="navbar-link">Tin tức</a>
                    </li>
{{--                    @foreach($categoriesLimit as $categoryParent)--}}
{{--                        <li class="nav-item dropdown">--}}
{{--                            <a class="nav-link dropdown-toggle" href="{{$categoryParent->slug}}"--}}
{{--                               id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"--}}
{{--                               aria-expanded="false">--}}
{{--                                {{$categoryParent->name}}--}}
{{--                            </a>--}}
{{--                            @include('frontend.components.child-menu',['categoryParent'=>$categoryParent])--}}
{{--                        </li>--}}
{{--                    @endforeach--}}
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href=""
                           id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">
                            Dịch vụ
                        </a>
                        <ul class="dropdown-menu custom-dropmenu" aria-labelledby="navbarDropdownMenuLink">
                            @foreach($pagesDV as $pagesDVitem)
                                <a class="dropdown-item" href="{{'/dich-vu/'.$pagesDVitem->slug.'.html'}}">{{$pagesDVitem->title}}</a>
                            @endforeach
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="{{'/lien-he/'.$pagesLH->slug.'.html'}}" class="navbar-link">Liên hệ</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>
