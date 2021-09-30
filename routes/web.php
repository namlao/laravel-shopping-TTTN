<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;


Route::group(['prefix'=>'login','middleware'=>'CheckLogedIn'],function (){
    Route::get('/',[
        'as' => 'login',
        'uses' =>'AdminController@loginAdmin'
    ]);
    Route::post('/',[
        'as' => 'post-login',
        'uses' =>'AdminController@postLoginAdmin'
    ]);
});

Route::get('/logout',[
    'as' => 'logout',
    'uses' =>'AdminController@logoutAdmin'
]);

Route::group(['prefix'=>'admin','middleware'=>'CheckLogedOut'],function (){

    //Home
    Route::get('/', [
        'as' => 'admin.home',
        'uses' =>'AdminController@home'
    ]);

    //category
    Route::prefix('categories')->group(function(){
        Route::get('/',[
            'as' =>'categories.index',
            'uses' => 'CategoryController@index',
            'middleware' => 'can:category-list'
        ]);
        Route::get('/create',[
            'as' =>'categories.create',
            'uses' => 'CategoryController@create',
            'middleware' => 'can:category-add'
        ]);
        Route::post('/store',[
            'as' =>'categories.store',
            'uses' => 'CategoryController@store'
        ]);
        Route::get('/edit/{id}',[
            'as' =>'categories.edit',
            'uses' => 'CategoryController@edit',
            'middleware' => 'can:category-edit'
        ]);

        Route::post('/update/{id}',[
            'as' =>'categories.update',
            'uses' => 'CategoryController@update'
        ]);
        Route::get('/delete/{id}',[
            'as' =>'categories.delete',
            'uses' => 'CategoryController@delete',
            'middleware' => 'can:category-delete'
        ]);
    });

    //menus
    Route::prefix('menus')->group(function(){
        Route::get('/',[
            'as' =>'menus.index',
            'uses' => 'MenuController@index',
            'middleware' => 'can:menu-list'
        ]);
        Route::get('/create',[
            'as' =>'menus.create',
            'uses' => 'MenuController@create',
            'middleware' => 'can:menu-add'
        ]);
        Route::post('/store',[
            'as' =>'menus.store',
            'uses' => 'MenuController@store'
        ]);
        Route::get('/edit/{id}',[
            'as' =>'menus.edit',
            'uses' => 'MenuController@edit',
            'middleware' => 'can:menu-edit'
        ]);

        Route::post('/update/{id}',[
            'as' =>'menus.update',
            'uses' => 'MenuController@update'
        ]);
        Route::get('/delete/{id}',[
            'as' =>'menus.delete',
            'uses' => 'MenuController@delete',
            'middleware' => 'can:menu-delete'
        ]);
    });

    //product
    Route::prefix('product')->group(function(){
        Route::get('/',[
            'as' =>'product.index',
            'uses' => 'AdminProductController@index',
            'middleware' => 'can:product-list'
        ]);
        Route::get('/create',[
            'as' =>'product.create',
            'uses' => 'AdminProductController@create',
            'middleware' => 'can:product-add'
        ]);
        Route::post('/store',[
            'as' =>'product.store',
            'uses' => 'AdminProductController@store'
        ]);

        Route::get('/edit/{id}',[
            'as' =>'product.edit',
            'uses' => 'AdminProductController@edit',
            'middleware' => 'can:product-edit'
        ]);
        Route::post('/update/{id}',[
            'as' =>'product.update',
            'uses' => 'AdminProductController@update'
        ]);
        Route::get('/delete/{id}',[
            'as' =>'product.delete',
            'uses' => 'AdminProductController@delete',
            'middleware' => 'can:product-delete'
        ]);
    });

    //Slider
    Route::prefix('slider')->group(function(){
        Route::get('/',[
            'as' =>'slider.index',
            'uses' => 'SliderAdminController@index',
            'middleware' => 'can:slider-list'
        ]);
        Route::get('/create',[
            'as' =>'slider.create',
            'uses' => 'SliderAdminController@create',
            'middleware' => 'can:slider-add'
        ]);
        Route::post('/store',[
            'as' =>'slider.store',
            'uses' => 'SliderAdminController@store'
        ]);

        Route::get('/edit/{id}',[
            'as' =>'slider.edit',
            'uses' => 'SliderAdminController@edit',
            'middleware' => 'can:slider-edit'
        ]);
        Route::post('/update/{id}',[
            'as' =>'slider.update',
            'uses' => 'SliderAdminController@update'
        ]);

        Route::get('/delete/{id}',[
            'as' =>'slider.delete',
            'uses' => 'SliderAdminController@delete',
            'middleware' => 'can:slider-delete'
        ]);
    });

    //Setting
    Route::prefix('settings')->group(function(){
        Route::get('/',[
            'as' =>'settings.index',
            'uses' => 'AdminSettingController@index',
            'middleware' => 'can:setting-list'
        ]);

        Route::get('/create',[
            'as' =>'settings.create',
            'uses' => 'AdminSettingController@create',
            'middleware' => 'can:setting-add'
        ]);
        Route::post('/store',[
            'as' =>'settings.store',
            'uses' => 'AdminSettingController@store'
        ]);

        Route::get('/edit/{id}',[
            'as' =>'settings.edit',
            'uses' => 'AdminSettingController@edit',
            'middleware' => 'can:setting-edit'
        ]);
        Route::post('/update/{id}',[
            'as' =>'settings.update',
            'uses' => 'AdminSettingController@update'
        ]);

        Route::get('/delete/{id}',[
            'as' =>'settings.delete',
            'uses' => 'AdminSettingController@delete',
            'middleware' => 'can:setting-delete'
        ]);
    });

    //User
    Route::prefix('users')->group(function(){
        Route::get('/',[
            'as' =>'users.index',
            'uses' => 'AdminUserController@index',
            'middleware' => 'can:user-list'
        ]);
        Route::get('/create',[
            'as' =>'users.create',
            'uses' => 'AdminUserController@create',
            'middleware' => 'can:user-add'
        ]);

        Route::post('/store',[
            'as' =>'users.store',
            'uses' => 'AdminUserController@store'
        ]);
        Route::get('/edit/{id}',[
            'as' =>'users.edit',
            'uses' => 'AdminUserController@edit',
            'middleware' => 'can:user-edit'
        ]);
        Route::post('/update/{id}',[
            'as' =>'users.update',
            'uses' => 'AdminUserController@update'
        ]);

        Route::get('/delete/{id}',[
            'as' =>'users.delete',
            'uses' => 'AdminUserController@delete',
            'middleware' => 'can:user-delete'
        ]);
    });

    //Role
    Route::prefix('roles')->group(function(){
        Route::get('/',[
            'as' =>'roles.index',
            'uses' => 'AdminRoleController@index',
            'middleware' => 'can:role-list'
        ]);

        Route::get('/create',[
            'as' =>'roles.create',
            'uses' => 'AdminRoleController@create'
        ]);
        Route::post('/store',[
            'as' =>'roles.store',
            'uses' => 'AdminRoleController@store'
        ]);
        Route::get('/edit/{id}',[
            'as' =>'roles.edit',
            'uses' => 'AdminRoleController@edit'
        ]);
        Route::post('/update/{id}',[
            'as' =>'roles.update',
            'uses' => 'AdminRoleController@update'
        ]);
        Route::get('/delete/{id}',[
            'as' =>'roles.delete',
            'uses' => 'AdminRoleController@delete'
        ]);
    });

    //pages
    Route::prefix('pages')->group(function(){
        Route::get('/',[
            'as' =>'pages.index',
            'uses' => 'AdminPagesController@index',
            'middleware' => 'can:page-list'
        ]);

        Route::get('/add',[
            'as' =>'pages.create',
            'uses' => 'AdminPagesController@add',
            'middleware' => 'can:page-add'
        ]);

        Route::post('/store',[
            'as' =>'pages.store',
            'uses' => 'AdminPagesController@store',
        ]);

        Route::get('/edit/{id}',[
            'as' =>'pages.edit',
            'uses' => 'AdminPagesController@edit',
            'middleware' => 'can:page-edit'
        ]);

        Route::post('/update/{id}',[
            'as' =>'pages.update',
            'uses' => 'AdminPagesController@update',
        ]);

        Route::get('/delete/{id}',[
            'as' =>'pages.delete',
            'uses' => 'AdminPagesController@delete',
            'middleware' => 'can:page-delete'
        ]);


    });

    //comment
    Route::prefix('comment')->group(function(){
        Route::get('/',[
            'as' =>'comment.index',
            'uses' => 'CommentController@index',
            'middleware' => 'can:comment_list'
        ]);


    });


    Route::prefix('permissions')->group(function(){
        Route::get('/create',[
            'as' =>'permissions.create',
            'uses' => 'AdminPermissionController@createPermission'
        ]);

        Route::post('/store',[
            'as' =>'permissions.store',
            'uses' => 'AdminPermissionController@store'
        ]);

    });



});

//Trang chủ
Route::get('/','FrontendHomeController@index')->name('home');

Route::get('search','FrontendHomeController@getSearch');


//Cart
Route::group(['prefix'=>'cart'],function (){
    Route::get('/',[
        'as'=>'cart.index',
        'uses' => 'CartController@index'
    ]);

    Route::get('/add/{id}',[
        'as'=>'cart.add',
        'uses' => 'CartController@add'
    ]);
    Route::post('/add/{id}',[
        'as'=>'cart.postAdd',
        'uses' => 'CartController@postAdd'
    ]);


    Route::get('/delete/{rowId}',[
        'as'=>'cart.delete',
        'uses' => 'CartController@delete'
    ]);
    Route::get('update',[
        'as'=>'cart.update',
        'uses' => 'CartController@update'
    ]);

    Route::post('/',[
        'as'=>'cart.postIndex',
        'uses' => 'CartController@postIndex'
    ]);
});
Route::get('cart/complete','CartController@getComplete')->name('complete');


//Page
Route::get('page/{slug}.html','PageController@getPage');
Route::get('dich-vu/{slug}.html','PageController@getPage');
Route::get('lien-he/{slug}.html','PageController@getPage');

//Shop
Route::group(['prefix'=>'shop'],function (){
    Route::get('/',[
        'as' => 'shop.index',
        'uses' => 'ShopController@getShopIndex'
    ]);

    // hiển thị chi tiết sản phẩm trong shop
    Route::get('product/{id}/{slug}',[
        'as' => 'shop.product',
        'uses' => 'ShopController@getProductItem'
    ]);
    Route::post('product/{id}/{slug}',[
        'as' => 'shop.postComment',
        'uses' => 'ShopController@postComment'
    ]);

    //hiển thị sản phẩm theo category
    Route::get('category/{parent_id}/{slug}',[
        'as' => 'shop.categorySlug',
        'uses' => 'ShopController@categorySlug'
    ]);
});

//tin tức

Route::get('test-git-2',function (){
    echo 'hello git 2';
});

