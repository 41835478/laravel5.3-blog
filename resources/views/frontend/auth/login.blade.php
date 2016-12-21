@extends('frontend.layouts.master')

@section('content')
<div id="page-content" class="container" style="border: 0px solid red;">
    <div class="row">
        <div class="col-lg-12 left-content" style="padding-bottom: 60px;">

            <div class="col-lg-6 col-lg-offset-3 auth_form" style="height: 400px; border: 0px solid silver">

                <form role="form" method="POST" action="{{ url('/login') }}">
                    {{ csrf_field() }}    
                    <h3 class="auth_title">Login or <a href="{{ url('register') }}">Sign up</a></h3>
                    <div class="row">
                        <div class="col-lg-4 social_btn">
                            <a href="#" class="btn btn-block btn-facebook" role="button">Facebook</a>
                        </div>
                        <div class="col-lg-4 social_btn">
                            <a href="#" class="btn btn-block btn-twitter" role="button">Twitter</a>
                        </div>	
                        <div class="col-lg-4 social_btn">
                            <a href="#" class="btn  btn-block btn-google" role="button">Google+</a>
                        </div>	
                    </div>

                    <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or">or</span>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">	
                            <div class="input-group" style="margin-top: 20px;">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="email" class="form-control" name="email" id="email" placeholder="email address">
                            </div>
                            <span class="help-block"></span>
                            <div class="input-group" style="margin-top: 20px;">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input  type="password" class="form-control" name="password" id="password" placeholder="Password">
                            </div>
                            <div class="" style="margin-top: 20px;">
                                <button class="btn btn-primary btn-block" type="submit">Login</button>
                            </div>
                            <div class="row" style="margin-top:8px;">
                                <div class="col-lg-6">
                                    <label>
                                        <input type="checkbox" value="remember-me" class=""> Remember Me
                                    </label>
                                </div>
                                <div class="col-lg-6">
                                    <p class="pull-right"><a href="{{ url('password/reset') }}">Forgot password?</a></p>
                                </div>
                            </div>	  
                        </div>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>
@endsection
