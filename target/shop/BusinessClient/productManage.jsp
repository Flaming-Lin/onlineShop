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
<title>店铺管理</title> 
<style>
table{  border-collapse:collapse;  }   
td{  border:2px solid blue;  }   
</style>  
<script type="text/javascript">
function add(){   
     window.location.href="<%=request.getContextPath() %>/BusinessClient/addProduct.jsp";   
}   
function del(id){  
     window.location.href="<%=request.getContextPath()%>/Products/delete.do?id=" + id;  
}   
function edit(id){  
     url="<%=request.getContextPath()%>/Products/editUI.do?&id=" + id;
     window.location.href=url;
} 
</script> 
</head>  
<body>  
<jsp:include page="businessHeader.jsp"></jsp:include>
<center>
<h1>商品信息列表</h1>
<form name="form">
  <table class="table"> 
    <tr>  
        <td>图片</td>
        <td>名称</td>  
        <td>类型</td>  
        <td>库存</td>  
        <td>已售</td> 
        <td>单价</td> 
        <td>操作</td>
    </tr>  
    <c:forEach items="${list}" var="product" varStatus="status">  
    <tr id="<c:out  value="${product.id}"/>"> 
        <td><img src="${basePath}${product.imgurl}" style="width:40px" /></td>
        <td><a href="${basePath}/Products/searchProInfo.do?id=${product.id}">${product.name}</a></td>
        <td><input  name="list[${status.index}].type"      value="${product.type}"    readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].instock"     value="${product.instock}"   readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].selled"     value="${product.selled}"   readonly="readonly"/></td>
        <td><input  name="list[${status.index}].price"   value="${product.price}" readonly="readonly"/></td>
        <td> 
            <input type="button" onclick="edit('<c:out value="${product.id}"/>')" value="修改"/>        
            <input type="button" onclick="del('<c:out value="${product.id}"/>')" value="下架"/>  
        </td>        
    </tr> 
    </c:forEach>  
 </table>
</form>
   <br>
   <table>
       <tr>
            <td colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页<br>            
                <a href="<%=request.getContextPath()%>/Products/businessProlist.do?pageNo=${page.topPageNo}"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${page.pageNo!=1}">             
                      <a href="<%=request.getContextPath()%>/Products/businessProlist.do?pageNo=${page.previousPageNo }"><input type="button" name="previousPage" value="上一页" /></a>                
                  </c:when>
                  <c:otherwise>   
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />       
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${page.pageNo != page.totalPages}">
                    <a href="<%=request.getContextPath()%>/Products/businessProlist.do?pageNo=${page.nextPageNo }"><input type="button" name="nextPage" value="下一页" /></a>
                  </c:when>
                  <c:otherwise>    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                  </c:otherwise>
                </c:choose>
                <a href="<%=request.getContextPath()%>/Products/businessProlist.do?pageNo=${page.bottomPageNo}"><input type="button" name="lastPage" value="尾页" /></a>
            </td>
        </tr>
     </table>
     <a href="<%=request.getContextPath()%>/BusinessClient/main.jsp"><input type="button" name="nextPage" value="返回" /></a>
        <br>
        添加记录：<input id="add" type="button" onclick="add()" value="上架"/> 
</center> 
</body>  
</html>  