
var expandible = false;
var currentImage = -1;

 $(document).ready(function(){
		var height = $("#overflowPanel").height();
		if (height != null && height > 160) {
			$("#expander").fadeIn(1000);
			expandible = true;
		} else {
			$("#mainText").height(166);
		}
 });

function expand() {
	$(".expansible").animate({height : "340px"}, 00);
	$("#content").animate({height : "360px"}, 500, function() {
		$("#collapser").fadeIn(300);
	});
	$("#expander").hide();
}

function collapse() {
	$(".expansible").animate({height : "166px"}, 00);
	$("#content").animate({height : "178px"}, 500, function() {
		$("#expander").fadeIn(300);
	});
	$("#collapser").hide();
}


var current = null;

function ShowImage(number) {
	if (currentImage == number) return;
	currentImage = number;
	$("#projectLinks").hide();
	$("#expander").hide();
	$("#collapser").hide();
  	$("#mainText").hide();
	$("#frontImage").hide();
  if (current != null) $("#slideImage"+current).hide();
	current = number;

	$("#content").animate({height : "360px"}, 500, function () {
			$("#closePanel").show();
			$("#projectLinks").fadeIn(300);
	});
  $("#slideImage"+number).fadeIn("slow");
}

function hideImages() {
	$("#projectLinks").hide();
	$("#expansible").animate({height : "166px"}, 00);
	$("#slideImage"+current).hide();
  	$("#mainText").fadeIn(500);
	$("#frontImage").fadeIn(500);
	$("#closePanel").hide();
	$("#content").animate({height : "178px"}, 500, function () {
		if (expandible) $("#expander").show();
			$("#projectLinks").fadeIn(300);
	});
	currentImage = -1;
}
