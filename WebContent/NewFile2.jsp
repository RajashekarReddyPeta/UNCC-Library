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
 <script >
 jQuery.support.cors = true;
 var url="http://developer.api.cnet.com/rest/v1.0/techProductSearch?viewType=json&callback=jqXhr&partKey=np5dzg5em3j2zy9jhrnm24mp&partTag=np5dzg5em3j2zy9jhrnm24mp&query=nexus%207&criteria=minOffers%3D1%7ChasGoodBad%3Dtrue&iod=goodBad&start=0&limit=1";
//	var url="http://graph.facebook.com/TarunSantosh";
 var jqxhr =$.getJSON(url, function( data ) {
		  alert( "success" );
		 })
		 
		  .fail( function(data, textStatus, error) {
        alert("getJSON failed, status: " + textStatus + ", error: "+error); })
        
		  .always(function(jqxhr) {
		   		alert(JSON.stringify(jqxhr));
			    alert( "finished");
			    console.log(jqxhr);
			    //console.log(jqxhr.id);


		  });
		 
		// Perform other work here ...
		 alert(jqxhr);
		// Set another completion function for the request above
		jqxhr.always(function() {
		  alert( "second finished" );
		});

</script>
</body>
</html>