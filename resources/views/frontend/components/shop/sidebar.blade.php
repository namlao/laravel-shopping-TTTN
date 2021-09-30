<div class="col-md-4">
    <div class="single-sidebar">
        <h2 class="sidebar-title">Tìm sản phẩm</h2>
        {{--        <form action="{{route('shop.searchAjax')}}" class="form-group form-search">--}}
        {{--            <input type="text" placeholder="Tìm sản phẩm..." name="keywordAjax" id="searchAjax">--}}
        {{--            <input type="submit" value="Tìm kiếm" class="btn btn-primary">--}}
        {{--        </form>--}}

        <form action="{{asset('search')}}" class="form-group form-search">
            <input type="text" placeholder="Tìm sản phẩm..." name="keyword">
            <input type="submit" value="Tìm kiếm" class="btn btn-primary">
        </form>
    </div>

    <div class="single-sidebar">
        <h2 class="sidebar-title">Chuyên mục</h2>
        <nav class="vertical">
            <ul>
                @foreach($categories as $categoryParent)
{{--                    {{route('shop.categorySlug',['parent_id'=>0,'slug'=>$categoryParent->slug]) }}--}}
                    <li><a href="#">{{$categoryParent->name}}</a>
                        <ul>
                            @foreach($categoryParent->categoryChild as $categoryChild)
                                <li>
                                    <a href="{{route('shop.categorySlug',['parent_id'=>$categoryChild->parent_id,'slug'=>$categoryChild->slug]) }}">{{$categoryChild->name}}</a>
                                </li>
                            @endforeach
                        </ul>
                    </li>
                @endforeach
            </ul>
        </nav>
    </div>

    <div class="single-sidebar">
        <h2 class="sidebar-title">Sắp xếp</h2>
        <form class="form-group" action="" method="get">
            <div>
                <h4 class="custom-title">Sắp xếp theo thời gian</h4>
                <div class="sortCustom">
                    <input type="radio" name="sortTime" id="inlineRadio1" value="new" @if(request()->sortTime == 'new') checked @endif>
                    <label for="inlineRadio1">Mới nhất</label>
                </div>
                <div class="sortCustom">
                    <input type="radio" name="sortTime" id="inlineRadio2" value="old" @if(request()->sortTime == 'old') checked @endif>
                    <label for="inlineRadio2">Cũ nhất</label>
                </div>
            </div>
            <div>
                <h4 class="custom-title">Sắp xếp theo chữ cái</h4>
                <div class="sortCustom">
                    <input type="radio" name="sortCharacter" id="inlineRadio1" value="desc" @if(request()->sortCharacter == 'desc') checked @endif>
                    <label for="inlineRadio1">Giảm dần</label>
                </div>
                <div class="sortCustom">
                    <input type="radio" name="sortCharacter" id="inlineRadio2" value="asc" @if(request()->sortCharacter == 'asc') checked @endif>
                    <label for="inlineRadio2">Tăng dần</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Ok</button>
        </form>
    </div>

    <div class="single-sidebar">
        <h2 class="sidebar-title">Lọc</h2>
        <form action="" method="get" class="form-group">
            <h4 class="custom-title">Khoảng giá</h4>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="price" id="exampleRadios2" value="1000000-5000000" @if(request()->price == '1000000-5000000') checked @endif>
                <label class="form-check-label" for="exampleRadios2">
                    {{number_format(1000000),0,',','.'}} - {{number_format(5000000),0,',','.'}}
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="price" id="value1" value="5000000-10000000" @if(request()->price == '5000000-10000000') checked @endif>
                <label class="form-check-label" for="value1">
                    {{number_format(5000000),0,',','.'}} - {{number_format(10000000),0,',','.'}}
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="price" id="value2" value="10000000-15000000" @if(request()->price == '10000000-15000000') checked @endif>
                <label class="form-check-label" for="value2">
                    {{number_format(10000000),0,',','.'}} - {{number_format(15000000),0,',','.'}}
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="price" id="value3" value="15000000-20000000" @if(request()->price == '15000000-20000000') checked @endif>
                <label class="form-check-label" for="value3">
                    {{number_format(15000000),0,',','.'}} - {{number_format(20000000),0,',','.'}}
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="price" id="value4" value="20000000" @if(request()->price == '20000000') checked @endif>
                <label class="form-check-label" for="value4">
                    {{number_format(20000000),0,',','.'}} trở lên
                </label>
            </div>
            <button type="submit" class="btn btn-primary">Ok</button>
        </form>
    </div>
</div>
