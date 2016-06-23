<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	margin-top: 40px;
}

.stepwizard-step p {
	margin-top: 10px;
}

.stepwizard-row {
	display: table-row;
}

.stepwizard {
	display: table;
	width: 50%;
	position: relative;
}

.stepwizard-step button[disabled] {
	opacity: 1 !important;
	filter: alpha(opacity = 100) !important;
}

.stepwizard-row:before {
	top: 14px;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 100%;
	height: 1px;
	background-color: #ccc;
	z-order: 0;
}

.stepwizard-step {
	display: table-cell;
	text-align: center;
	position: relative;
}

.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 12px;
	line-height: 1.428571429;
	border-radius: 15px;
}

/* Multistep */
/* See below for SASS (allows you easily set dot radius and progress bar thickness and adjusts everything else! */
.multistep .multistep-step {
	padding: 0;
	position: relative;
	margin-bottom: 10px;
}

.multistep .multistep-step .multistep-stepname {
	margin-bottom: 16px;
	color: #595959;
	font-size: 1.6rem;
	white-space: nowrap;
}

.multistep .multistep-step .multistep-dot {
	position: absolute;
	right: 50%;
	left: 50%;
	width: 32px;
	height: 32px;
	display: block;
	margin-top: -16px;
	margin-left: -15.5px;
	border-radius: 50%;
	background: #f5f5f5;
	/* Inner Dot */
}

.multistep .multistep-step .multistep-dot:after {
	content: ' ';
	border-radius: 50px;
	position: absolute;
	top: 8px;
	bottom: 8px;
	left: 8px;
	right: 8px;
	background: #e0e0e0;
}

.multistep .multistep-step .progress {
	position: absolute;
	width: 100%;
	height: 10.56px;
	margin-top: -5.28px;
	box-shadow: none;
	border-radius: 0;
}

.multistep .multistep-step .progress .progress-bar {
	width: 0px;
	box-shadow: none;
	background: #fbe8aa;
}

.multistep .multistep-step:first-child>.progress {
	left: 50%;
	width: 50%;
}

.multistep .multistep-step:last-child>.progress {
	width: 50%;
}

.multistep .multistep-step.complete .multistep-dot {
	background: #fbe8aa;
}

.multistep .multistep-step.complete .multistep-dot:after {
	background: #fbbd19;
}

.multistep .multistep-step.complete .progress>.progress-bar {
	width: 100%;
}

.multistep .multistep-step.next:hover .multistep-dot {
	background: #fbe8aa;
}

.multistep .multistep-step.next:hover .multistep-dot:after {
	background: #fbbd19;
}

.multistep .multistep-step.current .multistep-dot {
	background: #fbe8aa;
}

.multistep .multistep-step.current .multistep-dot:after {
	background: #fbbd19;
}

.multistep .multistep-step.current .progress>.progress-bar {
	width: 50%;
}

.multistep .multistep-step.current:first-child>.progress>.progress-bar {
	width: 0%;
}

.multistep .multistep-step.current:last-child>.progress>.progress-bar {
	width: 100%;
}

.multistep .multistep-step a.multistep-dot {
	pointer-events: none;
}

.multistep .multistep-step.next a.multistep-dot {
	pointer-events: all;
}
</style>
</head>
<body>
	<div class="container" style="width: 75%; margin: 10px auto;">
		<div class="row multistep stepwizard-row setup-panel">
			<div class="col-xs-3 multistep-step complete next">
				<div class="text-center multistep-stepname">Step 1</div>
				<div class="progress stepwizard-step">
					<div class="progress-bar"></div>
				</div>
				<a href="#step-1" class="multistep-dot"></a>
			</div>

			<div class="col-xs-3 multistep-step current next">
				<div class="text-center multistep-stepname">Step 2</div>
				<div class="progress stepwizard-step">
					<div class="progress-bar"></div>
				</div>
				<a href="#step-2" class="multistep-dot"></a>
			</div>

			<div class="col-xs-3 multistep-step next">
				<div class="text-center multistep-stepname">Step 3</div>
				<div class="progress stepwizard-step">
					<div class="progress-bar"></div>
				</div>
				<a href="#step-3" class="multistep-dot"></a>
			</div>

			<div class="col-xs-3 multistep-step disabled">
				<div class="text-center multistep-stepname">Step 4</div>
				<div class="progress stepwizard-step">
					<div class="progress-bar"></div>
				</div>
				<a href="#step-4" class="multistep-dot"></a>
			</div>
		</div>
	</div>
	<!-- 		<div class="container"><div class="stepwizard col-md-offset-3">
			<div class="stepwizard-row setup-panel">
				<div class="stepwizard-step">
					<a href="#step-1" type="button" class="btn btn-primary btn-circle ">1</a>
					<p>Step 1</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
					<p>Step 2</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle">3</a>
					<p>Step 3</p>
				</div>
				<div class="stepwizard-step">
					<a href="#step-4" type="button" class="btn btn-default btn-circle">4</a>
					<p>Step 4</p>
				</div>
			</div>
		</div>
 -->
	<form role="form" action="" method="post">
		<div class="row setup-content" id="step-1">
			<div class="col-xs-6 col-md-offset-3">
				<div class="col-md-12">
					<h3>Step 1</h3>
					<div class="form-group">
						<label class="control-label">First Name</label> <input
							maxlength="100" type="text" required="required"
							class="form-control" placeholder="Enter First Name" />
					</div>
					<div class="form-group">
						<label class="control-label">Last Name</label> <input
							maxlength="100" type="text" required="required"
							class="form-control" placeholder="Enter Last Name" />
					</div>
					<div class="form-group">
						<label class="control-label">Address</label>
						<textarea required="required" class="form-control"
							placeholder="Enter your address"></textarea>
					</div>
					<button class="btn btn-primary nextBtn btn-lg pull-right"
						type="button">Next</button>
				</div>
			</div>
		</div>
		<div class="row setup-content" id="step-2">
			<div class="col-xs-6 col-md-offset-3">
				<div class="col-md-12">
					<h3>Step 2</h3>
					<div class="form-group">
						<label class="control-label">Company Name</label> <input
							maxlength="200" type="text" required="required"
							class="form-control" placeholder="Enter Company Name" />
					</div>
					<div class="form-group">
						<label class="control-label">Company Address</label> <input
							maxlength="200" type="text" required="required"
							class="form-control" placeholder="Enter Company Address" />
					</div>
					<button class="btn btn-primary nextBtn btn-lg pull-right"
						type="button">Next</button>
				</div>
			</div>
		</div>
		<div class="row setup-content" id="step-3">
			<div class="col-xs-6 col-md-offset-3">
				<div class="col-md-12">
					<h3>Step 3</h3>
					<div class="form-group">
						<label class="control-label">Birth Place</label> <input
							maxlength="200" type="text" required="required"
							class="form-control" placeholder="Birth Place" />
					</div>
					<div class="form-group">
						<label class="control-label">Sunsign</label> <input
							maxlength="200" type="text" required="required"
							class="form-control" placeholder="Sunsign" />
					</div>
					<button class="btn btn-primary nextBtn btn-lg pull-right"
						type="button">Next</button>
				</div>
			</div>
		</div>
		<div class="row setup-content" id="step-4">
			<div class="col-xs-6 col-md-offset-3">
				<div class="col-md-12">
					<h3>Step 4</h3>
					<button class="btn btn-success btn-lg pull-right" type="submit">Submit</button>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
<script>
	$(document)
			.ready(
					function() {
						var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content'), allNextBtn = $('.nextBtn');

						allWells.hide();

						navListItems
								.click(function(e) {
									e.preventDefault();
									var $target = $($(this).attr('href')), $item = $(this);

									if (!$item.hasClass('disabled')) {
										navListItems.removeClass('btn-primary')
												.addClass('btn-default');
										$item.addClass('btn-primary');
										allWells.hide();
										$target.show();
										$target.find('input:eq(0)').focus();
									}
								});

						allNextBtn
								.click(function() {
									var curStep = $(this).closest(
											".setup-content"), curStepBtn = curStep
											.attr("id"), nextStepWizard = $(
											'div.setup-panel div a[href="#'
													+ curStepBtn + '"]')
											.parent().next().children("a"), curInputs = curStep
											.find("input[type='text'],input[type='url']"), isValid = true;

									$(".form-group").removeClass("has-error");
									for (var i = 0; i < curInputs.length; i++) {
										if (!curInputs[i].validity.valid) {
											isValid = false;
											$(curInputs[i]).closest(
													".form-group").addClass(
													"has-error");
										}
									}

									if (isValid)
										nextStepWizard.removeAttr('disabled')
												.trigger('click');
								});

						$('div.setup-panel div a.btn-primary').trigger('click');
					});
</script>
</html>