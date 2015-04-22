var WORDNUM = 10;

$(document).ready(function() {
	var word = $("#search_input").val()
	var pbid = $("#search_id_input").val();
	// $("#search_input").val(word);
	// $("#search_id_input").val(pbid);
	word = $.trim(word);
	pbid = $.trim(pbid);
	if (word == "" && pbid == "") {
		return;
	}
	// automatically load data
	searchData("probase", "concept", word, 1);
	searchData("probase", "entity", word, 1);
	searchData("probaseplus", "concept", word, 1);
	searchData("probaseplus", "entity", word, 1);
});

$("#search_buttom").click(function() {
	var word = $("#search_input").val();
	console.log(word);
	if (word == "") {
		$("#search_input").addClass("bg-danger");
		return;
	} else {
		word = word.toLowerCase();
		$("#search_input").removeClass("bg-danger");
	}
	// forward page
	location.href = "query?word=" + word + "&method=byword";
});

$("#search_id_buttom").click(function() {
	var pbid = $("#search_id_input").val();
	console.log(pbid);
	if (pbid == "") {
		$("#search_id_input").addClass("bg-danger");
		return;
	} else {
		$("#search_id_input").removeClass("bg-danger");
	}
	// forward page
	location.href = "query?pbid=" + pbid + "&method=byid";
});

$("#search_input").keypress(function(e) {
	$("#search_input").removeClass("bg-danger");
	if (e.which == 13) {
		$("#search_buttom").click();
		return false;
	}
});
$("#search_id_input").keypress(function(e) {
	$("#search_id_input").removeClass("bg-danger");
	if (e.which == 13) {
		$("#search_id_buttom").click();
		return false;
	}
});

$(".propager a").click(
		function() {
			if ($(this).hasClass("disabled")) {
				return;
			}
			var word = $("#search_input").val();
			var parentId = $(this).parent().attr("id").split("_");
			var database = parentId[0];
			var contentType = parentId[1];
			var pager = $(this).siblings(".pageNumber").first();
			var currFrom = parseInt(pager.text());
			var max = parseInt(pager.attr("max"));
			var method;
			if ($(this).hasClass("glyphicon-fast-backward")) {
				searchData(database, contentType, word, 1);
			} else if ($(this).hasClass("glyphicon-backward")) {
				var backfrom = currFrom - WORDNUM < 1 ? 1 : currFrom - WORDNUM;
				searchData(database, contentType, word, backfrom);
			} else if ($(this).hasClass("glyphicon-forward")) {
				var forfrom = currFrom + WORDNUM > max ? max - WORDNUM
						: currFrom + WORDNUM;
				searchData(database, contentType, word, forfrom);
			} else if ($(this).hasClass("glyphicon-fast-forward")) {
				var forfrom = max - max % WORDNUM + 1;
				forfrom = forfrom > max ? max - WORDNUM + 1 : forfrom;
				searchData(database, contentType, word, forfrom);
			}
		});

function searchData(databaseName, contentType, word, from) {
	$.getJSON("/KnowledgeWorks/ProbaseServlet", {
		word : word,
		databaseName : databaseName,
		from : from,
	}, function(result) {
		console.log(result);
		$("#result_title").text("Result: " + word);

		setStatistic(databaseName, contentType, word, result);
		if (contentType == "concept") {
			$("#" + databaseName + "_concept_tbody").empty();
			if (typeof (result.concept) == "undefined") {
				setPageNum(databaseName + "_" + contentType + "_pager", 0, 0);
			} else {
				setPageNum(databaseName + "_" + contentType + "_pager", from,
						from + WORDNUM - 1);
				setTable(databaseName + "_concept_tbody", word, result.concept,
						from);
			}
		}
		if (contentType == "entity") {
			$("#" + databaseName + "_entity_tbody").empty();
			if (typeof (result.entity) == "undefined") {
				setPageNum(databaseName + "_entity_pager", 0, 0);
			} else {
				setPageNum(databaseName + "_entity_pager", from, from + WORDNUM
						- 1);
				setTable(databaseName + "_entity_tbody", word, result.entity,
						from);
			}
		}
	});
}

function setStatistic(databaseName, contentType, word, data) {
	console.log(data);
	console.log(typeof (data));
	if (typeof (data) == "undefined" || isEmpty(data)) {
		$("#" + databaseName + "_word").text(word);
		$("#" + databaseName + "_" + contentType + "_pager .pageNumber").attr(
				"max", 0);
		$("#" + databaseName + "_" + contentType + "_num").text(0);
	} else {
		$("#" + databaseName + "_word").text(word);
		if (contentType == "concept") {
			$("#" + databaseName + "_" + contentType + "_num")
					.text(data.numcon);
			$("#" + databaseName + "_" + contentType + "_pager .pageNumber")
					.attr("max", data.numcon);
		} else if (contentType == "entity") {
			$("#" + databaseName + "_" + contentType + "_num")
					.text(data.nument);
			$("#" + databaseName + "_" + contentType + "_pager .pageNumber")
					.attr("max", data.nument);
		}
	}

}

function setTable(tableId, word, data, from) {
	var start = (from - 1) % 50; // return array contains 50 items
	var to = start + WORDNUM;
	to = to > data.length ? data.length : to;
	console.log(start + "-" + to);
	for (var i = start; i < to; i++) {
		$("#" + tableId).append(
				"<tr><td><a class='table_word'>" + data[i][0] + "</a></td><td>"
						+ data[i][1] + "</td></tr>");
	}

}

function setPageNum(pagerId, start, end) {
	var pager = $("#" + pagerId + " .pageNumber");
	var from = parseInt(start);
	var max = parseInt(pager.attr("max"));
	end = end > max ? max : end;
	if (end == 0) {
		$("#" + pagerId + " .pageNumber").text("0-0");
	} else {
		$("#" + pagerId + " .pageNumber").text(start + "-" + end);
	}
	if (from <= WORDNUM) {
		pager.prevAll(".glyphicon").addClass("disabled");
	} else {
		pager.prevAll(".glyphicon").removeClass("disabled");
	}
	if (end == max || max == 0) {
		pager.nextAll(".glyphicon").addClass("disabled");
	} else {
		pager.nextAll(".glyphicon").removeClass("disabled");
	}
}

$(document).on("click", ".table_word", function() {
	var word = $(this).text();
	$("#search_input").val(word);
	$("#search_buttom").click();
	return false;
});

$(".panel-heading").on('tap', function() {
	console.log("tap");
	console.log($(this).next());
	$(this).next(".collapse").collapse();
});

function isEmpty(obj) {
	for ( var name in obj) {
		return false;
	}
	return true;
};

function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); // 构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg); // 匹配目标参数
	if (r != null)
		return unescape(r[2]);
	return null; // 返回参数值
}
