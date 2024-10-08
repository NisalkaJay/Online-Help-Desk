<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update ticket</title>
<link rel="stylesheet" href="insertTicket.css">
<script type="text/javascript"
>
function validateForm() {
    var ticketID = document.getElementById("ticketID").value; <!--using getElementById method of document object retriving data from html or jsp page -->
    var firstName = document.getElementById("first_name").value;
    var lastName = document.getElementById("last_name").value;
    var email = document.getElementById("email").value;
    var facultySchool = document.getElementById("faculty_school").value;
    var contactNumber = document.getElementById("contact_number").value;
    var inquiryType = document.getElementById("inquiryType").value;
    var inquirySubject = document.getElementById("inquiry_subject").value;
    var message = document.getElementById("message").value;

    if (contactNumber.length !== 10) {
        alert("Contact number must be 10 digits long.");
        return false;
    }

    if (email.indexOf("@") === -1) {
        alert("Invalid email address. It must contain '@'.");
        return false;
    }

    return true;
}
</script>
</head>
<body>
	
	
<%
String ticketID = request.getParameter("ticketID");  // getting parameters and setting em to a string variable using jstl from a java page
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String facultySchool = request.getParameter("facultySchool");
String contactNumber = request.getParameter("contactNumber");
String inquiryType = (String)request.getParameter("inquiryType");
String inquirySubject = request.getParameter("inquirySubject");
String message = request.getParameter("message");
%>

	<h1 align="center" margin-down="5px">Update Ticket</h1>
    <form action="UpdateTicketServlet" method="post" onsubmit="return validateForm()">
    	
    	 
        <label for="ticketID">Student ID:</label>
        <input type="text" id="ticketID" name="ticketID" value="<%= ticketID %>" readonly/> <br><br>

        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="firstname" value="<%= firstName %>" /> <br><br>

        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="lastname" value="<%= lastName %>" /> <br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= email %>" /><br><br>

        <label for="faculty_school">Faculty/School:</label>
        <input type="text" id="faculty_school" name="facultyschool" value="<%= facultySchool %>" /><br><br>

        <label for="contact_number">Contact Number:</label>
	    <input type="text" id="contact_number" name="contactnumber" value="<%= contactNumber %>" /><br><br>
		
		
        <label for="inquiryType">Request Inquiry Type:</label>
        <select id="inquiryType" name="inquiryType" value="<%= inquiryType %>" >
            <option value="General" <c:if test='${inquiryType == "General"}'>selected</c:if>>General</option>
            <option value="Admissions" <c:if test='${inquiryType == "Admissions"}'>selected</c:if>>Admissions</option>
            <option value="Financial Aid" <c:if test='${inquiryType == "Financial Aid"}'>selected</c:if>>Financial Aid</option>
        </select><br><br> 
        <label for="inquiry_subject">Inquiry Subject:</label>
        <input type="text" id="inquiry_subject" name="inquirysubject" value="<%= inquirySubject %>" /><br><br>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="4" cols="50"><%= message %></textarea><br><br>
	
		<a href="UpdateTicketServlet">
        <input type="submit" name="submit" value="Update Ticket"><br><br> 
         </a>
 		<input type="button" name="back" value="back">
    </form>
    

 	

</body>
</html>