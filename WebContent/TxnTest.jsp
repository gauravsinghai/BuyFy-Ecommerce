<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
</head>
<body>
	<h1>Merchant Check Out Page</h1>
	<pre>
	</pre>
	<form method="post" action="pgRedirect.jsp" name="f1">
			<input id="ORDER_ID" type="hidden" tabindex="1" maxlength="20" size="20" name="ORDER_ID" 
						autocomplete="off" value="${requestScope.order.id}"/>
			<input id="CUST_ID" type="hidden" tabindex="2" maxlength="30" size="12" name="CUST_ID" 
						autocomplete="off" value="${requestScope.order.user.email}"/>
			<input id="INDUSTRY_TYPE_ID" type="hidden" tabindex="4" maxlength="12" size="12" 
						name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"/>
			<input id="CHANNEL_ID" type="hidden" tabindex="4" maxlength="12" size="12" 
						name="CHANNEL_ID" autocomplete="off" value="WEB"/>
			<input title="TXN_AMOUNT" type="hidden" tabindex="10" type="text" 
						name="TXN_AMOUNT" value="${requestScope.order.amount}"/>
	</form>

	<script type='text/javascript'>
		document.f1.submit();
	</script>
</body>
</html>