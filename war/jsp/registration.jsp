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
    
     <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
          
    <script src="js/jquery-2.2.2min.js"></script>
    
    <script type="text/javascript">
    var flagFname=false;
    var flagLname=false;
    var flagDob=false;
    var flagEmail=false;
    var flagMobileNo=false;
    var flagCompany=false;
    var flagDesignation=false;
    var flagAddress=false;
    var flagUserId=false;
    var flagPassword=false;
    
    
    
    $(document).ready(function(){
    	$("#firstName").focusout(function(){
        	if($(this).val()==''){
        		$("#lbl_fname").html('required field');
        		flagFname=false;
        	}
        	else{
        		$("#lbl_fname").empty();
        		flagFname=true;
        	}
        });
    	
    	$("#lastName").focusout(function(){
        	if($(this).val()==''){
        		$("#lbl_lname").html('required field');
        		flagLname=false;
        	}
        	else{
        		$("#lbl_lname").empty();
        		flagLname=true;
        	}
        });
    	$("#dob").focusout(function(){
    		var pattern= /^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/ ;    		
    		var dob=$(this).val();
        	if(dob==''){
        		$("#lbl_dob").html('required field');
        		flagDob=false;
        	}
        	//else if(!dob.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)){
        	else if(!dob.match(pattern)){
        		$("#lbl_dob").html('insert valid date (dd/mm/yyyy)');
        		flagDob=false;
        	}
        	else{
        		$("#lbl_dob").empty();
        		flagDob=true;
        	}
        });
    	
    	$("#email").focusout(function(){
    		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    		var email=$(this).val();
        	if(email==''){
        		$("#lbl_email").html('required field');
        		flagEmail=false;
        	}
        	else if(!re.test(email)){
        		$("#lbl_email").html('invalid email');
        		flagEmail=false;
        	}
        	else{
        		$("#lbl_email").empty();
        		flagEmail=true;
        	}
        });
    	
    	$("#mobileNo").focusout(function(){
    		var mobileNo=$(this).val();
        	if(mobileNo==''){
        		$("#lbl_mobileNo").html('required field');
        		flagFname=false;
        	}
        	else if(isNaN(mobileNo)){
        		$("#lbl_mobileNo").html('invalid mobile number');
        		flagFname=false;
        	}
        	else if(mobileNo.length!=10){
        		$("#lbl_mobileNo").html('mobile number should be 10 digit');
        		flagFname=false;
        	}
        	else{
        		$("#lbl_mobileNo").empty();
        		flagMobileNo=true;
        	}
        });
    	
    	
    	$("#company").focusout(function(){
        	if($(this).val()==''){
        		$("#lbl_company").html('required field');
        		flagCompany=false;
        	}
        	else{
        		$("#lbl_company").empty();
        		flagCompany=true;
        	}
        });
    	
    	$("#designation").focusout(function(){
        	if($(this).val()==''){
        		$("#lbl_designation").html('required field');
        		flagDesignation=false;
        	}
        	else{
        		$("#lbl_designation").empty();
        		flagDesignation=true;
        	}
        });
    	
    	$("#address").focusout(function(){
    		var addr=$(this).val();
        	if(addr==''){
        		$("#lbl_address").html('field should not be empty');
        		flagAddress=false;
        	}
        	else if(addr.length<10){
        		$("#lbl_address").html('Address must be more than 10 character');
        		flagAddress=false;
        	}
        	else{
        		$("#lbl_address").empty();
        		flagAddress=true;
        	}
        });
    	
    	
    	$("#userId").focusout(function(){
    		var userId=$(this).val();
        	if(userId==''){
        		$("#lbl_userId").html('required field');
        		flagUserId=false;
        	}
        	else{        		
        		 $.ajax({
                     url : 'searchUserAction',
                     type: "POST",
                     dataType: 'json',
                     success : function(result) {
                    	 $.each(result,function(key,value){
                    		 if(key==userId){
                    			 $("#lbl_userId").html('userId already exist');
                    			 flagUserId=false;
                    			 return false;
                    		 }
                    	 });
                     }
        		});
        		
        		$("#lbl_userId").empty();
        		flagUserId=true;
        	}
        });
    	
    	
    	$("#password").focusout(function(){
        	if($(this).val()==''){
        		$("#lbl_password").html('required field');
        		flagPassword=false;
        	}
        	else{
        		$("#lbl_password").empty();
        		flagPassword=true;
        	}
        });
    	
    	
    	$("form").on('submit',function(){
    		if(flagFname==false ||flagLname==false || flagDob==false || flagEmail==false|| flagMobileNo==false|| flagCompany==false|| flagDesignation==false|| flagAddress==false|| flagUserId==false|| flagPassword==false ){
    			return false;
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
    		<%if(request.getParameter("MSG")!=null){%>
    			<label class="ll"><%=request.getParameter("MSG")%></label>
    			<%}%>
    		<form class="form-inline" role="form" method="post" action="registerEmployeeAction">
    		
    			<div class="form-group col-sm-4">
    				<div class="lbl_validation"><label id="lbl_fname"></label></div>
      				<label  class="col-sm-4">First Name:</label>
      				<input type="text" class="form-control" id="firstName" placeholder="Enter first name" name="firstName">
    			</div>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_lname"></label></div>
      				<label class="col-sm-4">Last Name:</label>
      				<input type="text" class="form-control" id="lastName" placeholder="Enter last name" name="lastName">
    			</div><br><br><br>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_dob"></label></div>
      				<label  class="col-sm-4">DOB:</label>
      				<input type="text" class="form-control" id="dob" placeholder="DD/MM/YYYY" name="dob">
    			</div>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_email"></label></div>
      				<label  class="col-sm-4">Email:</label>
      				<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    			</div><br><br><br>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_mobileNo"></label></div>
      				<label  class="col-sm-4">Mobile No:</label>
      				<input type="text" class="form-control" id="mobileNo" placeholder="Enter mobile no" name="mobileNo">
    			</div>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_company"></label></div>
      				<label  class="col-sm-4">Company:</label>
      				<input type="text" class="form-control" id="company" placeholder="Enter company" name="company">
    			</div><br><br><br>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_designation"></label></div>
      				<label  class="col-sm-4">Designation:</label>
      				<input type="text" class="form-control" id="designation" placeholder="Enter designation" name="designation">
    			</div>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_address"></label></div>
      				<label  class="col-sm-4">Address:</label>
      				<textarea type="text" class="form-control" id="address" placeholder="Enter address" name="address"></textarea>
    			</div><br><br><br><br><br>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_userId"></label></div>
      				<label  class="col-sm-4">UserId:</label>
      				<input type="text" class="form-control" id="userId" placeholder="Enter userId" name="userId">
    			</div><br><br><br>
    			<div class="form-group col-sm-4">
    			<div class="lbl_validation"><label id="lbl_password"></label></div>
      				<label  class="col-sm-4">Password:</label>
      				<input type="text" class="form-control" id="password" placeholder="Enter password" name="password">
    			</div><br><br><br><br>
    			
    			<button type="submit" class="btn btn-success col-sm-2" id="btn" style="margin-left: 32px">Submit</button>
  			</form>
    		
    	</div>
    
        <br><br><br>
        <!-- /.row -->
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
   
    
</body>


</html>