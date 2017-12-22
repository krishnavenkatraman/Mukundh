<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chart Example</title>
<script type="text/javascript"  src="resources/js/jquery-1.11.0.js" ></script>
<link rel="stylesheet" type="text/css" href="resources/css/jquery.jqplot.min.css" />
<script type="text/javascript" src="resources/js/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="resources/js/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="resources/js/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script >
	$(document).ready(function(){
	  // Some simple loops to build up data arrays.
	 	    
	  var sinPoints = []; 
	  for (var i=10; i<18; i+=0.4){ 
	     sinPoints.push([ 2*(i+.8), i]); 
	  }
	    
	  var powPoints1 = []; 
	  for (var i=10; i<18; i+=1) { 
	      powPoints1.push([ 2.5 / (i+.8), i]); 
	  }
	    
	
	  var plot3 = $.jqplot('chart3', [ sinPoints, powPoints1], 
	    { 
	      title:'Principal Vs Interest Payment Ammortization', 
	      // Set default options on all series, turn on smoothing.
	      seriesDefaults: {
	          rendererOptions: {
	              smooth: true
	          }
	      },
	      // Series options are specified as an array of objects, one object
	      // for each series.
	      series:[ 
	          {
	            // Change our line width and use a diamond shaped marker.
	            lineWidth:2, 
	            markerOptions: { style:'dimaond' }
	          }, 
	         
	          { 
	            // Use (open) circlular markers.
	            markerOptions: { style:"circle" }
	          }
	      ]
	    }
	  );
	    
	});
</script>
</head>
<body>
1234
<div id="chart3" style="height:300px; width:500px;">HI</div>

</body>
</html>