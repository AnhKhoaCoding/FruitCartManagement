

<%@page import="sample.product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add product Page</title>
    </head>
    <body>
        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if(productError == null){
                productError = new ProductError();
            }
            %>
        <form action="MainController" method="POST">
            Product ID<input type="text" name="productID" required=""/>
            <%= productError.getProductIDError()%></br>
            Product Name<input type="text" name="productName" required=""/>
            <%= productError.getProductNameError()%></br>
            Image<input type="text" name="image" required=""/></br>
            Price<input type="text" name="price" required=""/></br>
            Quantity<input type="text" name="quantity" required=""/></br>
            Category ID<input type="text" name="categoryID" required=""/></br>
            Import Date<input type="text" name="importDate" required=""/></br>
            Using Date<input type="text" name="usingDate" required=""/></br>
            Status<input type="text" name="status" required=""/></br>
           
            <input type="submit" name="action" value="Create"/>
             <input type="reset"  value="Reset"/>
        </form>
    </body>
</html>
