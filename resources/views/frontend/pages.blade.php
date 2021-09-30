@extends('frontend.layouts.master')
@section('title',$pageItem->title)

@section('css')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <style>
        .page-block{
            margin-top: 15px;
        }
    </style>
@endsection

@section('js')

@endsection

@section('content')
    <div class="container page-block">
        <div class="row">
            <div class="col-md-8">
                <h2 class="product-wid-title">{{$pageItem->title}}</h2>
                {!! $pageItem->content !!}
            </div>

        </div>
    </div>



@endsection
