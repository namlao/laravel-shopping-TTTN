<div class="slider-area">
    <!-- Slider -->
    <div class="block-slider block-slider4">
        <ul class="" id="bxslider-home4">
            @foreach($sliders as $slider)
                <li>
                    <img class="slide-img" src="{{$slider->image_path}}" alt="Slide">
                    <div class="caption-group">
                        <h2 class="caption title">
                            {{ $slider->name }}
                        </h2>
                        <h4 class="caption subtitle">{{ $slider->description }}</h4>
                        {{--							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>--}}
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
    <!-- ./Slider -->
</div> <!-- End slider area -->
