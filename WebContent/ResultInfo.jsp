<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.pages.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("div.holder").jPages({
	    containerID : "content",
	    perPage: 5
  	});
});
</script>
<title>Uncc Library database book search</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<!-- <link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />-->
</head>

<body>

<div id="container">
<div id="page_menu">

		<ul>
		<li><a href="Index.jsp">Home</a></li>
		<li><a href="#">About us</a></li>
		<li><a href="#">Services</a></li>
		<li><a href="#">Portfolio</a></li>
		<li><a href="#">Faq</a></li>
		<li class="last"><a href="#">Contact</a></li>
		</ul>

  </div>
<!-- Start of Page Header -->

	<div id="page_header">

		<div id="page_heading">
		<h1><a href="https://library.uncc.edu/">UNCC LIBRARY</a><span>Hardware Store</span></h1>
		<h2><span>Education everywhere</span></h2>
		</div>

		<div class="clearthis">&nbsp;</div>

	</div>

	<!-- End of Page Header -->


	<!-- Start of Page Menu -->

	

<!-- End of Page Menu -->


	<!-- Start of Left Sidebar -->

	<div id="left_sidebar">


		<!-- Start of Newsletter Signup Form -->
	  <!-- End of Newsletter Signup Form -->

	  <!-- Start of Categories Box -->


		<!-- End of Categories Box -->


		<!-- Start of Special Offer Box -->
				<!-- End of Special Offer Box -->
    </div>
<!-- End of Left Sidebar -->


	<!-- Start of Main Content Area -->

	<div id="main_content">

		<!-- Start of New Item Description -->

		<div id="new_item">

			<div id="new_item_header">
			<h1>Results to Library Search!</h1>
			<h2>&nbsp;</h2>
			<div class="holder"></div>
<ul id="content">
<%
List<String> arrayObj = (ArrayList<String>)session.getAttribute("arrayObj");
//Integer columnCount = (Integer)session.getAttribute("columnCount");

for(int i=0;i<arrayObj.size();i++){
	String value =arrayObj.get(i);
	//session.setAttribute("value", value);
	String link="/UnccLibrary/DataController?requested_info="+java.net.URLEncoder.encode(value,"UTF-8");
%>

<!-- <a href=
> -->
<li><a href=<%=link%>><%=value%></a></li>
<!-- </a><br> -->
<%
}
%>

</ul>
		  </div>

			<div id="new_item_image"><img src="images/uncclogo.jpg" alt="" /></div>

		  <div id="new_item_text">
<p></p>
				
		  </div>

		  <div id="new_item_link">
				</div>

		  <div class="clearthis">&nbsp;</div>
		</div>

		<!-- End of New Item Description -->


		<div class="h_divider">&nbsp;</div>


		<!-- Start of Sub Item Descriptions -->

		<div class="sub_items">


			<!-- Start Left Sub Item -->

		</div>

		<!-- End of Sub Item Descriptions -->
  </div>
	<!-- End of Main Content Area -->


	<div class="clearthis">&nbsp;</div>


	<!-- Start of Page Footer -->

	<div id="page_footer">
	  <div id="powered_by">Copyright &copy; 2013 <a href="http://www.uncc.com">Book Illustrations</a> | <a href="http://www.maagraphics.com/print-designs/print-design-services.htm">Uncc Library Search</a> | <a href="#">Sitemap</a> | <a href="#">library</a> by <a href="https://library.uncc.edu/">https://library.uncc.edu</a></div>

	  <div class="clearthis">&nbsp;</div>
	</div>

	<!-- End of Page Footer -->

</div>

</body>
</html>