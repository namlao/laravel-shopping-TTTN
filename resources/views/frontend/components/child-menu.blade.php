@if($categoryParent->categoryChild->count())
    <ul class="dropdown-menu custom-dropmenu" aria-labelledby="navbarDropdownMenuLink">
        @foreach($categoryParent->categoryChild as $categoryChild)
            <a class="dropdown-item" href="{{$categoryChild->slug}}">{{$categoryChild->name}}</a>
        @endforeach
    </ul>
@endif
