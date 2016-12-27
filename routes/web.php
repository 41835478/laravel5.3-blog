<?php

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | This file is where you may define all of the routes that are handled
  | by your application. Just tell Laravel the URIs it should respond
  | to using a Closure or controller method. Build something great!
  |
 */

Route::get('/', function () {
    return view('frontend.home');
});
Route::get('/about', function () {
    return view('frontend.about');
});


// Blog routes
Route::get('/blog', 'BlogController@index');
Route::get('/post', 'BlogController@getPost');


//Contact routes
Route::get('/contact', 'ContactController@index');
Route::post('/contact', 'ContactController@store');


Route::group(['middleware' => 'auth'], function () {
    
    //Profile routes
    Route::get('/profile', 'ProfileController@showProfileForm');
    Route::post('/profile', 'ProfileController@updateProfile');
    Route::get('/change_password', 'ProfileController@showPasswordForm');
    Route::post('/change_password', 'ProfileController@updatePassword');
    
    
    
});


/*
  |--------------------------------------------------------------------------
  | Auth routes
  |--------------------------------------------------------------------------
  |
 */

Auth::routes();
Route::get('/logout', 'Auth\LoginController@logout');
Route::get('/register/confirm', function () {
    return view('frontend.auth.confirm');
});


/*
  |--------------------------------------------------------------------------
  | Scial routes
  |--------------------------------------------------------------------------
  |
 */
//Facebook routes
Route::get('auth/facebook', 'Auth\RegisterController@redirectToProvider');
Route::get('auth/facebook/callback', 'Auth\RegisterController@handleProviderCallback');

//Google routes
Route::get('auth/google', 'Auth\RegisterController@redirectToGoogle'); 
Route::get('auth/google/callback', 'Auth\RegisterController@handleGoogleCallback');

//Twitter routes
Route::get('auth/twitter', 'Auth\RegisterController@redirectToTwitter');
Route::get('auth/twitter/callback', 'Auth\RegisterController@handleTwitterCallback');


/*
  |--------------------------------------------------------------------------
  | Admin routes
  |--------------------------------------------------------------------------
  |
 */

Route::group(['namespace' => 'Admin', 'prefix' => 'admin', 'middleware' => ['auth', 'admin']], function() {
     
    //Dashboard routes
    Route::get('/', 'AdminController@index');

    
    //Comments routes
    Route::get('/comments', function () {
        return view('backend.comments.list');
    });
    

    //Post routes
    Route::get('/post', 'PostController@index');
    
    Route::get('/post/create', 'PostController@create');
    Route::post('/post', 'PostController@store');
    //Route::post('/post/create', 'PostController@store');
    
    Route::get('/post/{id}', 'PostController@show');
    
    Route::get('/post/{id}/edit', 'PostController@edit');
    Route::patch('/post/{id}', 'PostController@update');
    
    Route::delete('/post/{id}', 'PostController@destroy');
    
    
    //Message routes
    Route::get('/messages', 'ContactController@index');
    Route::get('/messages/getdata', 'ContactController@getMessage');
    Route::get('/messages/{id}', 'ContactController@show');
    
    //Survey routes
    Route::get('/survey', 'SurveyController@index');
    Route::get('/survey/getdata', 'SurveyController@getSurvey');
    Route::get('/survey/add', 'SurveyController@create');
    Route::post('/survey/add', 'SurveyController@store');
    Route::get('/survey/edit/{id}', 'SurveyController@edit');
    Route::post('/survey/edit/{id}', 'SurveyController@update');
    Route::delete('/survey/{id}', 'SurveyController@destroy');
    Route::get('/survey/stat/{id}', 'SurveyController@getStat');
    
    //Tag routes
    Route::get('/tags', 'TagsController@index');
    Route::get('tags/getdata', 'TagsController@getTags');
    Route::post('/tags', 'TagsController@addTag');
    Route::get('/tags/{id}', 'TagsController@showEditTag');
    Route::post('/tags/{id}', 'TagsController@update');
    Route::delete('/tags/{id}', 'TagsController@destroy');
    
    //User routes
    Route::get('/users', 'UsersController@index');
    Route::get('users/getdata', 'UsersController@getUsers');
    Route::get('users/add', 'UsersController@ShowAddUserForm');
    Route::post('users/add', 'UsersController@addUser');
    Route::get('users/edit/{id}', 'UsersController@ShowEditUserForm');
    Route::post('users/edit/{id}', 'UsersController@EditUser');
    Route::delete('users/{id}', 'UsersController@deleteUser');
    
    //Profile & password routes
    Route::get('/profile',   'ProfileController@index');
    Route::post('/profile',  'ProfileController@updateProfile');
    Route::get('/password',  'ProfileController@showPasswordForm');
    Route::post('/password', 'ProfileController@updatePassword');
    
    
    //Other routes
    Route::get('/parameters', function () {
        return view('backend.settings.parameters');
    });
    
});





