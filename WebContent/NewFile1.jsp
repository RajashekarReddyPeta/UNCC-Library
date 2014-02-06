<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<ul id="groups"></ul>
 <script >
var jsonString = '[{"name":"Manchester GTUG","meetup":"First Monday of every month","tags":["gtug","google","manchester","madlab"]},{"name":"Manchester jQuery Group","meetup":"First Tuesday of every month","tags":["jquery","javascript","jresig","madlab"]},{"name":"Hybrid!","meetup":"First Monday of every month","tags":["jquery","javascript","jresig","madlab"]}]';
var url="http://developer.api.cnet.com/rest/v1.0/techProductSearch?viewType=json&partKey=np5dzg5em3j2zy9jhrnm24mp&partTag=np5dzg5em3j2zy9jhrnm24mp&query=Nexus%207&criteria=minOffers%3D1%7ChasGoodBad%3Dtrue&iod=none&start=0&limit=1";
document.write(url);

var jst = $.ajax({
	  dataType: "json",
	  url: url,
	  success: success
	});
	document.write(jst);
var myData = JSON.parse(jst);

$(document).ready(function() {
    var $grouplist = $('#groups');
    $.each(myData, function() {
        $('<li>' + this.name + '</li>').appendTo($grouplist);
    });
});
 </script>
</body>
</html>