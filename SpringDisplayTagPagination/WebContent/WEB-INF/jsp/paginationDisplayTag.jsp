<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="//code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/result-light.css">
<style type="text/css">
@import
	url('//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css');
.date-form {
	margin: 10px;
}

.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.clsDatePicker {
	z-index: 100000;
}

label.control-label span {
	cursor: pointer;
}
</style>
<title>DatePicker</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class='col-sm-4'>
				<div class="form-group">
					<div class="date-form">
						<div class="form-horizontal">
							<div class="control-group">
								<div class="controls">
									<div class="input-group">
										<input id="date-picker-2" type="text"
											class="date-picker form-control" /> <label
											for="date-picker-2" class="input-group-addon btn"><span
											class="glyphicon glyphicon-calendar"></span> </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>

			<!-- Button to trigger modal -->
			<a href="#TaskListDialog" role="button" class="btn"
				data-toggle="modal">Launch demo modal</a>

			<div id="TaskListDialog" class="modal hide fade" tabindex="-1"
				role="dialog" aria-labelledby="windowTitleLabel">
				<div class="modal-header">
					<h3>Task List</h3>
				</div>
				<div class="modal-body">
					<div class="tabbable">
						<!-- Only required for left/right tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Section
									1</a></li>
							<li><a href="#tab2" data-toggle="tab">Section 2</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">Data 1</div>
							<div class="tab-pane" id="tab2">
								<p>Data 2.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-primary" onclick="CloseTaskList();">Close</a>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog"
				aria-labelledby="windowTitleLabel" tabindex="-1">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-lock"></span> Login
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<div class="tabbable">
								<!-- Only required for left/right tabs -->
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab">Section
											1</a></li>
									<li><a href="#tab2" data-toggle="tab">Section 2</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab1">Data 1</div>
									<div class="tab-pane" id="tab2">
										<p>Data 2.</p>
									</div>
								</div>
							</div>
							<form role="form">
								<div class="form-group">
									<label for="usrname"><span
										class="glyphicon glyphicon-user"></span> Username</label> <input
										type="text" class="form-control" id="usrname"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> Password</label> <input
										type="text" class="form-control" id="psw"
										placeholder="Enter password">
								</div>
								<div class='col-sm-4'>
									<div class="form-group">
										<div class="date-form">
											<div class="form-horizontal">
												<div class="control-group">
													<div class="controls">
														<div class="input-group">
															<input id="date-picker-3" type="text"
																style="z-index: 10510" class="date-picker form-control" />
															<label for="date-picker-3" class="input-group-addon btn"><span
																class="glyphicon glyphicon-calendar"></span> </label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="checkbox">
									<label><input type="checkbox" value="" checked>Remember
										me</label>
								</div>
								<button type="submit" class="btn btn-success btn-block">
									<span class="glyphicon glyphicon-off"></span> Login
								</button>
							</form>
						</div>
						<div class="modal-footer">
							<button type="submit"
								class="btn btn-danger btn-default pull-left"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> Cancel
							</button>
							<p>
								Not a member? <a href="#">Sign Up</a>
							</p>
							<p>
								Forgot <a href="#">Password?</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type='text/javascript'>
	$(window).load(function() {
		$(".date-picker").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'dd/mm/yy'
		//showButtonPanel : true
		});
		$(".date-picker").datepicker().datepicker("setDate", new Date());
		$(".date-picker").on("change", function() {
			var id = $(this).attr("id");
			var val = $("label[for='" + id + "']").text();
			//$("#msg").text(val + " changed");
		});
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>
</html>