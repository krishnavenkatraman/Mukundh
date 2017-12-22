<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import=" java.util.HashMap,java.util.Iterator,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mortgage Handler!</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
<link rel="stylesheet" type="text/css"  href="resources/css/mort-tree.css" />
<style type="text/css">
body
{
background-image:url('resources/images/bg2.jpg');
background-repeat:repeat-y;
}
</style>
</head>

<body>

<table border = "4">
<tr>
	<td> S No</td>
	<td> Amount Description</td>
	<td> Amount Value</td>
</tr>
<% 

HashMap<String, Double> entireSummary = null;
entireSummary = (HashMap<String, Double>) request.getAttribute("summary");
int i = 1;
Iterator iterator = entireSummary.keySet().iterator();  

while (iterator.hasNext()) {  
   String key = iterator.next().toString();  
   String value = entireSummary.get(key).toString();  
   
%>   
<tr> 
		<td><%=i %> </td>
		<td><%=key%> </td>
		<td><%=value%></td>	
</tr>
<%  
i++;
}  
%>
</table>
<br><br><br>
<table border="1">

<tr>
	<td>Month Number  </td>
	<td> Principal Amount  Balance</td>
	<td>Payment towards Interest for the current Month  </td>
	<td>Payment towards Principal for the current Month</td>
	
	<td>Updated Principal Amount  Balance after current Payment  </td>	
	<td>Cumulative Interest Paid Till Date</td>
</tr>

<% 
 HashMap<String, ArrayList> ammortizedList = null;
ammortizedList = (HashMap<String, ArrayList>) request.getAttribute("ammortizationList");
int ammortizedListSize = ammortizedList.size(); 
%><b> Ammortization List  for <%=ammortizedListSize %> Months</b> <br><br>
<%

   
    for(int k=1;k<=ammortizedListSize;k++){
%>
<tr>
	<td><%=k %></td>
	<%   
	for (int j =0; j<ammortizedList.get(k).size(); j++){		   
		   String value =   ammortizedList.get(k).get(j).toString();  
%>

	<td> <%=value %> </td>

<% 
  }
%>
</tr>
<%	
   } %>
</table>
</body>
</html>