<%@page import="com.agilecrm.util.DataFormate"%>
<%@page import="com.agilecrm.dto.EmployeeDto"%>

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
	
<%EmployeeDto employeeDto = (EmployeeDto) request
					.getAttribute("data");%>
					
	var flagFname = true;
	var flagLname = true;
	var flagDob = true;
	var flagEmail = true;
	var flagMobileNo = true;
	var flagCompany = true;
	var flagDesignation = true;
	var flagAddress = true;

	$(document).ready(function() {
		$("#hidden_div").hide();
		$("#update_btn1").click(function() {
			//$("#mdiv").css("display","none");
			//$("#hidden_div").css("display","displyed");
			$(".lbl_update_validation").empty();
			$("#firstName").val('<%=employeeDto.getFirstName()%>');
			$("#lastName").val('<%=employeeDto.getLastName()%>');
			$("#dob").val('<%=DataFormate.ChangeUtilDate(employeeDto.getDob())%>');
			$("#email").val('<%=employeeDto.getEmail()%>');
			$("#mobileNo").val('<%=employeeDto.getMobileNo()%>');
			$("#company").val('<%=employeeDto.getCompany()%>');
			$("#designation").val('<%=employeeDto.getDesignation()%>');
			$("#address").val('<%=employeeDto.getAddress()%>');

			$("#hidden_div").show();
			$("#mdiv").hide();
		});
						$("#cancel_btn").click(function() {
							//$("#hidden_div").css("display","none");
							//$("#mdiv").css("display","inherit");
							$("#lbl_msg").empty();
							$("#hidden_div").hide();
							$("#mdiv").show();
						});

						$("#firstName").focusout(function() {
							if ($(this).val() == '') {
								$("#lbl_fname").html('required field');
								flagFname = false;
							} else {
								$("#lbl_fname").empty();
								flagFname = true;
							}
						});

						$("#lastName").focusout(function() {
							if ($(this).val() == '') {
								$("#lbl_lname").html('required field');
								flagLname = false;
							} else {
								$("#lbl_lname").empty();
								flagLname = true;
							}
						});
						$("#dob")
								.focusout(
										function() {
											var pattern = /^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/;
											var dob = $(this).val();
											if (dob == '') {
												$("#lbl_dob").html(
														'required field');
												flagDob = false;
											}
											//else if(!dob.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/)){
											else if (!dob.match(pattern)) {
												$("#lbl_dob")
														.html(
																'insert valid date (dd/mm/yyyy)');
												flagDob = false;
											} else {
												$("#lbl_dob").empty();
												flagDob = true;
											}
										});

						$("#email")
								.focusout(
										function() {
											var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
											var email = $(this).val();
											if (email == '') {
												$("#lbl_email").html(
														'required field');
												flagEmail = false;
											} else if (!re.test(email)) {
												$("#lbl_email").html(
														'invalid email');
												flagEmail = false;
											} else {
												$("#lbl_email").empty();
												flagEmail = true;
											}
										});

						$("#mobileNo")
								.focusout(
										function() {
											var mobileNo = $(this).val();
											if (mobileNo == '') {
												$("#lbl_mobileNo").html(
														'required field');
												flagFname = false;
											} else if (isNaN(mobileNo)) {
												$("#lbl_mobileNo")
														.html(
																'invalid mobile number');
												flagFname = false;
											} else if (mobileNo.length != 10) {
												$("#lbl_mobileNo")
														.html(
																'mobile number should be 10 digit');
												flagFname = false;
											} else {
												$("#lbl_mobileNo").empty();
												flagMobileNo = true;
											}
										});

						$("#company").focusout(function() {
							if ($(this).val() == '') {
								$("#lbl_company").html('required field');
								flagCompany = false;
							} else {
								$("#lbl_company").empty();
								flagCompany = true;
							}
						});

						$("#designation").focusout(function() {
							if ($(this).val() == '') {
								$("#lbl_designation").html('required field');
								flagDesignation = false;
							} else {
								$("#lbl_designation").empty();
								flagDesignation = true;
							}
						});

						$("#address")
								.focusout(
										function() {
											var addr = $(this).val();
											if (addr == '') {
												$("#lbl_address")
														.html(
																'field should not be empty');
												flagAddress = false;
											} else if (addr.length < 10) {
												$("#lbl_address")
														.html(
																'Address must be more than 10 character');
												flagAddress = false;
											} else {
												$("#lbl_address").empty();
												flagAddress = true;
											}
										});

						$("form").on('submit',function() {
									if (flagFname == false || flagLname == false || flagDob == false || flagEmail == false	|| flagMobileNo == false || flagCompany == false || flagDesignation == false || flagAddress == false) {
								        
										return false;
									}
								});

					})
</script>





</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.html">Agile CRM</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="https://www.agilecrm.com/sales">Sales</a></li>
					<li><a href="https://www.agilecrm.com/marketing">Marketing</a>
					</li>
					<li><a href="https://www.agilecrm.com/helpdesk">Services</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav" style="float: right;">
					<li><a href="logoutAction">Logout</a></li>
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
				<div align="center" class="welcome">
					Welcome
					<%=employeeDto.getFirstName()%></div>
			</div>
		</div>
	</header>
	<!-- Page Content -->
	<div class="container">
		<div class="mdiv" id="mdiv">
			<%
				if (request.getParameter("MSG") != null) {
			%>
			<label class="ll" id="lbl_msg"><%=request.getParameter("MSG")%></label><br>
			<%
				}
			%>
			<button type="button" class="btn btn-info col-sm-2" id="update_btn1">Update
				Record</button>
			<br> <br>

			<table class="table" id="data_tbl">
				<tbody>
					<tr>
						<td>First Name:</td>
						<td><%=employeeDto.getFirstName()%></td>
					</tr>
					<tr>
						<td>Last Name:</td>
						<td><%=employeeDto.getLastName()%></td>
					</tr>
					<tr>
						<td>Dob:</td>

						<td><%=DataFormate.ChangeUtilDate(employeeDto.getDob())%></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><%=employeeDto.getEmail()%></td>
					</tr>
					<tr>
						<td>Mobile No:</td>
						<td><%=employeeDto.getMobileNo()%></td>
					</tr>
					<tr>
						<td>Company</td>
						<td><%=employeeDto.getCompany()%></td>
					</tr>
					<tr>
						<td>Designation</td>
						<td><%=employeeDto.getDesignation()%></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><%=employeeDto.getAddress()%></td>
					</tr>

				</tbody>
			</table>


		</div>

		<div id="hidden_div">
			<form action="updateEmployeeAction" method="post">
				<table class="table" id="data_tbl">
					<tbody>
						<tr>
							<td>First Name:</td>
							<td><input type="text" id="firstName" name="firstName">
								<label class="lbl_update_validation" id="lbl_fname"></label></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input type="text" id="lastName" name="lastName">
								<label class="lbl_update_validation" id="lbl_lname"></label></td>
						</tr>
						<tr>
							<td>Dob:</td>
							<td><input type="text" id="dob" name="dob" placeholder="DD/MM/YYYY" > <label
								class="lbl_update_validation" id="lbl_dob"></label></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><input type="text" id="email" name="email"> <label
								class="lbl_update_validation" id="lbl_email"></label></td>
						</tr>
						<tr>
							<td>Mobile No:</td>
							<td><input type="text" id="mobileNo" name="mobileNo">
								<label class="lbl_update_validation" id="lbl_mobileNo"></label></td>
						</tr>
						<tr>
							<td>Company</td>
							<td><input type="text" id="company" name="company">
								<label class="lbl_update_validation" id="lbl_company"></label></td>
						</tr>
						<tr>
							<td>Designation</td>
							<td><input type="text" id="designation" name="designation">
								<label class="lbl_update_validation" id="lbl_designation"></label></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" id="address" name="address">
								<label class="lbl_update_validation" id="lbl_address"></label></td>
						</tr>

					</tbody>
				</table>
				<button type="submit" class="btn btn-info col-sm-4" id="update_btn2">Update
					Record</button>
				<button type="button" class="btn btn-info col-sm-4" id="cancel_btn"
					style="margin-left: 5px;">cancel</button>
			</form>
			<br> <br> <br>
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