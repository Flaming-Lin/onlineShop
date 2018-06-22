<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>已买到的宝贝</title> 
<style>
table{  border-collapse:collapse;  }   
td{  border:1px solid lightgray;  
     
}   
</style>  
 <script type="text/javascript">

function readOrderInfo(id){   
	url="<%=request.getContextPath()%>/Order/searchOrderInfo.do?&id=" + id;
    window.location.href=url;
}   
function buy(id){  
	url="<%=request.getContextPath()%>/Order/confirmOrder.do?&id=" + id;
	window.location.href=url;  
} 
</script>
</head>  
<body> 
<jsp:include page="customerHeader.jsp"></jsp:include> 
<center>
<h1>我的宝贝</h1>
<form name="form">
  <table class="table table-hover"> 
    <tr>  
        <td>名称</td>  
        <td>种类</td>
        <td>单价</td>  
        <td>总价</td>  
        <td>交易时间</td> 
        <td>订单状态</td> 
        <td>操作</td>
    </tr>  
    <c:forEach items="${list}" var="order" varStatus="status">  
    <tr id="<c:out  value="${order.id}" />"> 
        <td><input  value="${order.products.name}" readonly="readonly"/></td>  
        <td><input  value="${order.products.type}" readonly="readonly"/></td>
        <td><input  value="${order.products.price}"    readonly="readonly"/></td>  
        <td><input  value="${order.totalprice}"   readonly="readonly"/></td>  
        <td><input  value="${order.date}"   readonly="readonly"/></td>
        <td><input  value="${order.state}" readonly="readonly"/></td>
        <td> 
            <input type="button" class="btn btn-info" onclick="readOrderInfo('<c:out value="${order.id}"/>')" value="查看订单详情"/> 
            <c:choose>
            <c:when test="${order.state.equals('已发货')}">  
            	<input type="button" class="btn btn-success" onclick="buy('<c:out value="${order.id}"/>')" value="确认收货"/>    
            </c:when>    
            </c:choose>
        </td>        
    </tr> 
    </c:forEach>  
 </table>
</form>
   <br>
   <table>
       <tr>
            <td colspan="6" align="center">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页<br>            
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
     <a href="<%=request.getContextPath()%>/CustomerClient/main.jsp"><input type="button" name="nextPage" value="返回" /></a>
        <br>
        <!-- 添加记录：<input id="add" type="button" onclick="add()" value="上架"/>  -->
</center> 
</body>  
</html>  