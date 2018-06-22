<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
      pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>订单管理</title> 
<style>
table{  border-collapse:collapse;  }   
td{  border:2px solid blue;  }   
</style>  
<script type="text/javascript"> 
function send(id){  
     url="${basePath}/Order/sendProduct.do?&id=" + id;
     window.location.href=url;
} 
</script> 
</head>  
<body> 
<jsp:include page="businessHeader.jsp"></jsp:include> 
<center>
<h1>订单信息列表</h1>
<form name="form">
  <table class="table"> 
    <tr>  
        <td>订单号</td>  
        <td>买家</td>  
        <td>购买商品</td>  
        <td>购买数量</td> 
        <td>总价</td> 
        <td>购买日期</td>
        <td>操作</td>
    </tr>  
    <c:forEach items="${list}" var="order" varStatus="status">  
    <tr id="<c:out  value="${order.id}"/>"> 
        <td>${order.id}</td>  
        <td>${order.customer_1}</td>  
        <td>${order.product}</td>  
        <td>${order.number}</td>
        <td>${order.totalprice}</td>
        <td>${order.date}</td>
        <td> 
        <c:choose>
   		<c:when test="${order.state.equals('未发货')}">
   		     ${order.state}<br/>
            <input type="button" onclick="send('<c:out value="${order.id}"/>')" value="发货"/>        
   		</c:when>
   
   		<c:otherwise>
   		   ${order.state}
   		</c:otherwise>
  
	</c:choose>
        </td>        
    </tr> 
    </c:forEach>  
 </table>
</form>
   <br>
   <table>
       <tr>
            <td colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页<br>            
                <a href="<%=request.getContextPath()%>/Order/orderList.do?pageNo=${page.topPageNo}"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${page.pageNo!=1}">             
                      <a href="<%=request.getContextPath()%>/Order/orderList.do?pageNo=${page.previousPageNo }"><input type="button" name="previousPage" value="上一页" /></a>                
                  </c:when>
                  <c:otherwise>   
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />       
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${page.pageNo != page.totalPages}">
                    <a href="<%=request.getContextPath()%>/Order/orderList.do?pageNo=${page.nextPageNo }"><input type="button" name="nextPage" value="下一页" /></a>
                  </c:when>
                  <c:otherwise>    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                  </c:otherwise>
                </c:choose>
                <a href="<%=request.getContextPath()%>/Order/orderList.do?pageNo=${page.bottomPageNo}"><input type="button" name="lastPage" value="尾页" /></a>
            </td>
        </tr>
     </table>
     <a href="<%=request.getContextPath()%>/BusinessClient/main.jsp"><input type="button" name="nextPage" value="返回" /></a>
</center> 
</body>  
</html>  