<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="homepage for AgileCRM">
    <meta name="author" content="mahendra">

    <title>Agile CRM</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-frontpage.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-2.2.2min.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function(){
    	var flagUserId=false;
    	var flagPassword=false;
    	
    	$("#login_userId").focusout(function(){
    		var userId=$(this).val();
        	if(userId==''){
        		$("#lbl_msg").html('userId or password should not be empty');
        		flagUserId=false;
        	}
        	else{        		        		
        		$("#lbl_msg").empty();
        		flagUserId=true;
        	}
        });
    	
    	
    	$("#login_password").focusout(function(){
        	if($(this).val()==''){
        		$("#lbl_msg").html('userId or password should not be empty');
        		flagPassword=false;
        	}
        	else{
        		$("#lbl_msg").empty();
        		flagPassword=true;
        	}
        });
    	
    	
    	$("form").on('submit',function(){
    		if(flagUserId==false|| flagPassword==false ){
        		$("#lbl_msg").html('userId or password should not be empty');
    			return false;
    		}
    		else{
    			$("#lbl_msg").empty();
    		}
    		
    	});
    });
    
    
    </script>

</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.html">Agile CRM</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav" style="float: right;">
                    <li>
                        <a href="registrationFormAction">Registration</a>
                    </li>
                    <li>
                        <a href="loginFormAction">login</a>
                    </li>
                </ul>                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Image Background Page Header -->
    <!-- Note: The background image is set within the business-casual.css file. -->
    <header class="header">
        <div class="container">
            <div class="row">                
                    <h1 class="tagline">
                    	<span class="glyphicon glyphicon-cloud"></span>Agile CRM
                    </h1>
            </div>
        </div>
    </header>
    <!-- Page Content -->
    <div class="container"> 
    	<div class="mdiv" class="mclass">
    	<label class="lbl" id="lbl_msg">
    	<%if(request.getParameter("MSG")!=null){%>
    			<%=request.getParameter("MSG")%>
    			<%}%>
    			</label>
    	
    	<form role="form" method="post" action="loginEmployeeAction">
  			<div class="form-group">
    			<label >UserId:</label>
    			<input type="text" class="form-control" id="login_userId" name="userId">
  			</div>
  			<div class="form-group">
    			<label>Password:</label>
    			<input type="password" class="form-control" id="login_password" name="password">
  			</div>
  			<div class="checkbox">
    			<label><input type="checkbox"> Remember me</label>
  			</div>
  			<button type="submit" class="btn btn-success col-sm-2" id="logIn_btn">Submit</button>
		</form>
    	
    	</div>
    
        
        <!-- /.row -->
        <hr>
        <!-- Footer -->
        <footer style="margin: 30px;">
            <div class="row">
                <div class="col-lg-8">
                    <p>Copyright &copy; www.agilecrm.com 2016</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
    </div>
    <!-- /.container -->
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>


</html>