<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Spring Pagination using Display Tag</title>
<link rel="stylesheet" type="text/css" href="css/screen.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%-- <form:form commandName="person" action="" method="post">
		<h2>Spring Pagination using Display Tag</h2>
		<!-- To change column style please form this classes ISIS OR ITS OR Mars OR Simple OR Report OR Mark Column 
	We have chosen style class="its"-->
		<display:table export="true" name="person.personList" id="row"
			requestURI="/paginationDisplayTag.web" pagesize="15" class="its">
			<display:column title="Name" sortable="true">
				<c:set var="id" value="${row.name}" />
				<!-- Trigger the modal with a hyperlink -->
				<a href="#" data-toggle="modal" data-target="#modal${id}">${row.name}
				</a>
				<!-- Modal -->
				<div id="modal${id}" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header${id}</h4>
							</div>
							<div class="modal-body">
								<p>Some text in the modal.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</display:column>
			<display:column property="position" title="Position" sortable="true" />
			<display:column property="salary" title="Salary" sortable="true" />
			<display:column property="location" title="Location" sortable="true" />
			<display:column property="phone" title="Phone" sortable="true" />
		</display:table>
	</form:form> --%>
	<!-- multistep form -->
	<form:form commandName="person" action="" method="post" id="msform">
		<!-- progressbar -->
		<ul id="progressbar">
			<li class="active">Account Setup</li>
			<li>Social Profiles</li>
			<li>Personal Details</li>
		</ul>
		<!-- fieldsets -->
		<fieldset>
			<h2 class="fs-title">Create your account</h2>
			<h3 class="fs-subtitle">This is step 1</h3>
			<input type="text" name="email" placeholder="Email" /> <input
				type="password" name="pass" placeholder="Password" /> <input
				type="password" name="cpass" placeholder="Confirm Password" /> <input
				type="button" name="next" class="next action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">Social Profiles</h2>
			<h3 class="fs-subtitle">Your presence on the social network</h3>
			<input type="text" name="twitter" placeholder="Twitter" /> <input
				type="text" name="facebook" placeholder="Facebook" /> <input
				type="text" name="gplus" placeholder="Google Plus" /> <input
				type="button" name="previous" class="previous action-button"
				value="Previous" /> <input type="button" name="next"
				class="next action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">Personal Details</h2>
			<h3 class="fs-subtitle">We will never sell it</h3>
			<input type="text" name="fname" placeholder="First Name" /> <input
				type="text" name="lname" placeholder="Last Name" /> <input
				type="text" name="phone" placeholder="Phone" />
			<textarea name="address" placeholder="Address"></textarea>
			<input type="button" name="previous" class="previous action-button"
				value="Previous" /> <input type="submit" name="submit"
				class="submit action-button" value="Submit" />
		</fieldset>
	</form:form>
</body>
<script
	src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src='//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script>
	var current_fs, next_fs, previous_fs;
	var left, opacity, scale;
	var animating;
	$('.next').click(
			function() {
				if (animating)
					return false;
				animating = true;

				current_fs = $(this).parent();
				next_fs = $(this).parent().next();

				//activate next step on progressbar using the index of next_fs
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass(
						"active");

				//show the next fieldset
				next_fs.show();
				//hide the current fieldset with style
				current_fs.animate({
					opacity : 0
				}, {
					step : function(now, mx) {
						//as the opacity of current_fs reduces to 0 - stored in "now"
						//1. scale current_fs down to 80%
						scale = 1 - (1 - now) * 0.2;
						//2. bring next_fs from the right(50%)
						left = (now * 50) + "%";
						//3. increase opacity of next_fs to 1 as it moves in
						opacity = 1 - now;
						current_fs.css({
							'transform' : 'scale(' + scale + ')',
							'position' : 'absolute'
						});
						next_fs.css({
							'left' : left,
							'opacity' : opacity
						});
					},
					duration : 800,
					complete : function() {
						current_fs.hide();
						animating = false;
					},
					//this comes from the custom easing plugin
					easing : 'easeInOutBack'
				});
			});

	$(".previous").click(
			function() {
				if (animating)
					return false;
				animating = true;

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//de-activate current step on progressbar
				$("#progressbar li").eq($("fieldset").index(current_fs))
						.removeClass("active");

				//show the previous fieldset
				previous_fs.show();
				//hide the current fieldset with style
				current_fs.animate({
					opacity : 0
				}, {
					step : function(now, mx) {
						//as the opacity of current_fs reduces to 0 - stored in "now"
						//1. scale previous_fs from 80% to 100%
						scale = 0.8 + (1 - now) * 0.2;
						//2. take current_fs to the right(50%) - from 0%
						left = ((1 - now) * 50) + "%";
						//3. increase opacity of previous_fs to 1 as it moves in
						opacity = 1 - now;
						current_fs.css({
							'left' : left
						});
						previous_fs.css({
							'transform' : 'scale(' + scale + ')',
							'opacity' : opacity
						});
					},
					duration : 800,
					complete : function() {
						current_fs.hide();
						animating = false;
					},
					//this comes from the custom easing plugin
					easing : 'easeInOutBack'
				});
			});

	$(".submit").click(function() {
		return false;
	})
</script>
</html>