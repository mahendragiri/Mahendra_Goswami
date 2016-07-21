<%@page import="com.agilecrm.delegate.EmployeeDelegate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
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
    <script type="text/javascript" src="js/jquery-ui-1.11.4.min.js"></script>
    <!--handlebar library-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0/handlebars.js"></script>
    
    <script type="text/javascript">
    function deleteFun(id){
    	var id_id="#"+id;
    	$(id_id).remove();
    	 $.ajax({
             url : 'deleteEmployeeAction',
             type: "POST",
             dataType: "json",
             data:	{userId:id.toString()},
             success : function(){
            	 alert('record deleted');
             }
         });
    }
        
    
    $(document).ready(function() {
    	
    	/*
        $('#search_btn1').on('click',function() {
        	$("#search_btn2").val(0);
            $.ajax({
                url : 'getAllEmployeeAction',
                type: "POST",
                dataType: 'json',
                success : function(result) {
                	$("#tbl").empty();
                	$("#tbl").append('<tr><td>FIRST NAME</td><td>LAST NAME</td><td>USERID</td><td>DOB</td><td>EMAIL</td><td>MOBILE NO</td><td>COMPANY</td><td>DESIGNATION</td><td>ADDRESS</td><td></td></tr>');
                    $.each(result,function(index,value){
                    	var usrId = value.userId;
                    	var arr=(value.dob).split(' ');
                    	var dob_date=arr[1]+''+arr[0]+','+arr[2];
                    	
                    	
                    	var table="<tr id="+value.userId+">";
                    	table += "<td>"+value.firstName+"</td>";
                    	table += "<td>"+value.lastName+"</td>";
                    	table += "<td>"+value.userId+"</td>";
                    	table += "<td>"+dob_date+"</td>";
                    	table += "<td>"+value.email+"</td>";
                    	table += "<td>"+value.mobileNo+"</td>";
                    	table += "<td>"+value.company+"</td>";
                    	table += "<td>"+value.designation+"</td>";
                    	table += "<td>"+value.address+"</td>";
                    	table += '<td><button type="button" class="delete_btn" onclick="deleteFun(';
                    	table += "'"+usrId+"')";  
                    	table += '">Delete</button></td></tr>';
                    	$("#tbl").append(table);
                    	//$("#tbl").append('<tr id='+value.userId+'><td>'+value.firstName+'</td><td>'+value.lastName+'</td><td>'+value.userId+'</td><td>'+value.dob+'</td><td>'+value.email+'</td><td>'+value.mobileNo+'</td><td>'+value.company+'</td><td>'+value.designation+'</td><td>'+value.address+'</td><td><button type="button" class="delete_btn" onclick="deleteFun('+usrId+')">Delete</button></td></tr>');
                    	
                    });
                }
            });
        });
    	   	
    	
    	*/
        
    	
    	var  htmcontent=$("#context-template").html();
		var htmfunction =  Handlebars.compile(htmcontent);
		var res;
		 $('#search_btn1').on('click',function() {
	        	$("#search_btn2").val(0);
	            $.ajax({
	                url : 'getAllEmployeeAction',
	                type: "POST",
	                dataType: 'json',
	                success : function(result) {
	                	$.each(result,function(index,value){
	                		var name = value.name;
	                		var
	                	});
	                }
	            });
		 });
		
		
	var htmcont1=htmfunc(res);
	$("#tbl").html(htmcont1);
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
        
        $("#search_btn2").on('change',function(){
        	var select_box_value= $("#search_btn2").val();
        	if(select_box_value==0){
        		$("#tbl").empty();
        	}
        	$.ajax({
                url : 'getEmployeeAction',
                type: "POST",
                data:{userId:select_box_value},
                dataType: 'json',
                success : function(result) {
                	$("#tbl").empty();
                	var table='<tbody>'
                	$.each(result,function(index,value){
                		table += '<tr><td>'+index+'</td><td>'+value+'</td><td></tr>';
                	});
                	table +='<tbody>';
                	$("#tbl").append(table);
                }
        	});
        });
    });
    
    
    
    
    
    
    
    </script>
    
    
    <script id="context-template" type="text/x-handlebars-template">


        <tr><td>FIRST NAME</td><td>LAST NAME</td><td>USERID</td><td>DOB</td><td>EMAIL</td><td>MOBILE NO</td><td>COMPANY</td><td>DESIGNATION</td><td>ADDRESS</td><td></td></tr>
                   
		{{#each res,function(index,value)}}
			<tr><td>{{value.firstName}}</td><td>{{value.lastName}}</td><td>{{value.dob}}</td><td>{{value.email}}</td><td>{{value.mobileNo}}</td><td>{{value.userId}}</td><td>{{value.dob}}</td><td>{{value.company}}</td><td>{{value.designation}}</td><td></td></tr>
		{{/each}}
		

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
                <a class="navbar-brand" href="agileHome.html">Agile CRM</a>
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
                        <a href="logoutAction">Logout</a>
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
                    <div align="center" class="welcome">Welcome Admin</div>
            </div>
        </div>
    </header>
    <!-- Page Content -->
    <div class="container">
     	
    	<div class="mdiv" class="mclass">
    	
    		<button type="button" class="btn btn-success col-sm-4" id="search_btn1">Search All Employee</button>
    		 <select name="Select Employee" class="btn btn-info col-sm-4" id="search_btn2">
  				<option value="0" selected="selected">Search Employee</option>
  				<%EmployeeDelegate delegate=new EmployeeDelegate();
  				  Map map=delegate.searchUser();
  				  Set set=map.keySet();
  				  for(Object obj:set){
  					  %>
  					  <option value="<%=(String)obj%>"><%=map.get(obj) %></option>
  				<%} %>  				
			</select><br>
    		<div id="emptable"><table id="tbl"  class="table"></table></div>
    	
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