<nav class="navbar navbar-default navbar-fixed-top navbar-custom" role="navigation">
    <div class="container" style="border: 0px solid red">
       
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!--<a class="navbar-brand" href="#" >Start Bootstrap</a>-->
        <a class="navbar-brand" href="{{ url('/')}}" style="padding-left:0px;">
            <img src="/images/logox.jpg" alt="" style="height: 44px; margin-top: -8px; border: 0px solid red;">
        </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="{{ url('/blog')}}">Blog</a></li>
            <li><a href="{{ url('/about')}}">About</a></li>
            <li><a href="{{ url('/contact')}}">Contact</a></li>
            <li><a href="{{ url('/admin')}}">Admin</a></li>
        </ul>
        <div class="col-sm-4 col-md-4" style="border: 1px solid red--">
            <form class="navbar-form" role="search">
                <div class="input-group col-md-12" style="border: 1px solid black-">
                    <input type="text" class="form-control" placeholder="Search" name="search" id="search">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="{{ url('/register')}}">Register</a></li>
            <li><a href="{{ url('/login')}}">Sign In</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
   
    </div>
</nav>
