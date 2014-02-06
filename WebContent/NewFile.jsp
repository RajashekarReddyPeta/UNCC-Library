<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery.getJSON demo</title>
<style>
img {
	height: 100px;
	float: left;
}
</style>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
	<div id='tweet-list'></div>
	<script>
 
		window.onload = init;

		function init() {
			// the code to be called when the dom has loaded
			
		jQuery.support.cors = true;
		var firstParturl = "http://developer.api.cnet.com/rest/v1.0/techProductSearch?viewType=json&partKey=np5dzg5em3j2zy9jhrnm24mp&partTag=np5dzg5em3j2zy9jhrnm24mp&query=";
		var query =encodeURIComponent($('#item').text());
		var secondPartUrl = "&criteria=minOffers%3D1%7ChasGoodBad%3Dtrue&iod=goodBad&start=0&limit=1";
		var mainUrl = firstParturl+query+secondPartUrl; 
		//var mainUrl = "http://developer.api.cnet.com/rest/v1.0/techProductSearch?viewType=json&partKey=np5dzg5em3j2zy9jhrnm24mp&partTag=np5dzg5em3j2zy9jhrnm24mp&query=nexus%205&criteria=minOffers%3D1%7ChasGoodBad%3Dtrue&iod=goodBad&start=0&limit=1";
		//console.log(url);
		console.log(mainUrl);
		var jqxhr = $.ajax({
			url : mainUrl,
			dataType : 'jsonp'
		})

		.fail(
				function(data, textStatus, error) {
					alert("getJSON failed, status: " + textStatus + ", error: "
							+ error);
				})

		.always(function(jqxhr) {
			//alert(JSON.stringify(jqxhr));
			console.log(jqxhr.CNETResponse.TechProducts.TechProduct.BottomLine);
			$('#bottomLine').append(jqxhr.CNETResponse.TechProducts.TechProduct.BottomLine.$);
			$('#EditorsTake').append(jqxhr.CNETResponse.TechProducts.TechProduct.EditorsTake.$);
			$('#bad').append(jqxhr.CNETResponse.TechProducts.TechProduct.Bad.$);
			$('#good').append(jqxhr.CNETResponse.TechProducts.TechProduct.Good.$);
			$('#EditorsRating').append(jqxhr.CNETResponse.TechProducts.TechProduct.EditorsRating.$);

		 	var imgSrc = jqxhr.CNETResponse.TechProducts.TechProduct.ImageURL[1].$;
		 	//console.log(jqxhr.CNETResponse.TechProducts.TechProduct.ImageURL[1].$);
		 	var imgInfo = '<img src='+imgSrc+'>';
		 	$('#image').append(imgInfo);
			console.log(jqxhr.id);

		});
			console.log();
		}
	</script>
			<span id="image" title="image"></span><br>
	
	<ul>
		<li id="item" value="item">iphone 4S</li>
		<li id="EditorsTake" value="EditorsTake" title="Editors Take"></li>
		<li id="bottomLine" value="bottomLine" title="Bottom Line"></li>
		<li id="bad" value="bad" title="bad"></li>
		<li id="good" value="good" title="good"></li>
		<li id="EditorsRating" value="EditorsRating" title="Editors Rating"></li>
		<li id="EditorsStarRating" value="EditorsStarRating"
			title="Editors Star Rating"></li>


	</ul>

</body>
</html>