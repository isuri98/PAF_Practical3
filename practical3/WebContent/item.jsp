
<%@ page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.4.0.min.js" type="text/javascript"></script>  
    <% 
 //Insert item---------------------------------- 
if (request.getParameter("itemCode") != null) 
 { 
 Item itemObj = new Item(); 
 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
 request.getParameter("itemName"), 
 request.getParameter("itemPrice"), 
 request.getParameter("itemDesc")); 
 session.setAttribute("statusMsg", stsMsg); 
 } 



if (request.getParameter("itemID") != null) 
 { 
 Item itemObj = new Item(); 
 String stsMsg = itemObj.deleteItem(request.getParameter("itemID")); 
 session.setAttribute("statusMsg", stsMsg); 
 } 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Management</title>
</head>
<body>

<div class="container">
 <div class="row">
 <div class="col">
 
 

<h1>Items Management</h1>
<form method="post" action="item.jsp">
 Item code: <input name="itemCode"" class="form-control" type="text"><br> 
Item name: <input name="itemName" " class="form-control"type="text"><br> 
 Item price:<input name="itemPrice" " class="form-control"type="text"><br> 
 
Item description: <input name="itemDesc"" class="form-control" type="text"><br>
 <input name="btnSubmit" type="submit" " class="btn btn-primary" value="Save">
</form>



<div class="alert alert-success">
<% out.print(session.getAttribute("statusMsg"));%>
 </div>

<br>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>
</div>
 </div>
</div>
</body>
</html>