var WORDNUM = 20;

$("#search_buttom").click(function() {
	var word = $("#search_input").val();
	console.log(word);
	if (word == "") {
		$("#search_input").addClass("bg-danger");
		return;
	}
	$("form .loadingimg").removeClass("hidden");
	$("#search_form").submit();
});

$("#search_input").keypress(function(e) {
	$("#search_input").removeClass("bg-danger");
	if (e.which == 13) {
		$("#search_buttom").click();
		return false;
	}
});

$(document).on("click", ".table_word", function() {
	var word = $(this).text();
	$("#search_input").val(word);
	$("#search_buttom").click();
	return false;
});

$(".panel-heading").on('tap', function() {
	// console.log("tap");
	// console.log($(this).next());
	$(this).next(".collapse").collapse();
});

function isEmpty(obj) {
	for ( var name in obj) {
		return false;
	}
	return true;
};
