

<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
         <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1 >Welcome: <%= loginUser.getFullName()%> </h1>              
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <h1 >Go shopping  </h1> 
        <form action="MainController" >
            Search<input type="text" name="search"   value="<%= search %>" placeholder="input your text"/>
            <input type="submit" name="action"  value="Show"/>
        </form>
            
        <form action="MainController">
            <input type="submit" name="action" value="View"/>
        </form>
        <%
            List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size()>0) {
        %>
        
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Import Date</th>
                    <th>Using Date</th>
                    <th>Add</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    int count=1;
                    for (ProductDTO product : listProduct) {
                %>
        <tr>
            <form action="MainController">   
                
            
                
                    <td><%= count++%></td>
                    
                    <td>
                        <%=product.getProductID()%>
                        <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                    </td>
                    
                    <td>
                        <%= product.getProductName()%>
                        <input type="hidden" name="productName" value="<%= product.getProductName()%>"/>
                    </td>
                    <td>
                        <img width="60px" height="50px" src="image/<%= product.getImage()%>" alt="Image can't show">
                        <input type="hidden" name="image" value="<%= product.getImage()%>"/>
                    </td>
                    
                    <td>
                        <%= product.getPrice()%>
                        <input type="hidden" name="price" value="<%=product.getPrice()%>"/>
                    </td>
                    <td>  
                        <%= product.getQuantity()%>
                        <input type="hidden" name="quantity" value="<%= product.getQuantity()%>"/>
                    </td>
                    <td>  
                        <%= product.getCategoryID()%>
                        <input type="hidden" name="categoryID" value="<%= product.getCategoryID()%>"/>
                    </td>
                    
                    <td>  
                        <%= product.getImportDate()%>
                        <input type="hidden" name="importDate" value="<%= product.getImportDate()%>"/>
                    </td>
                    <td>  
                        <%= product.getUsingDate()%> 
                        <input type="hidden" name="usingDate" value="<%= product.getUsingDate()%>"/>
                    </td>
                    <td> 
                        <input type="submit" name="action" value="Add"/>
                        <input type="hidden" name="search" value="<%= search%>" />
                    </td>
                    
            
                    
               
            </form>
            
            <%
                        }
                    %>
        </tr>
            </tbody>
        </table>
         <%
            String message = (String) request.getAttribute("MESSAGE");
            if(message == null){
                message="";
            }
        %>
            <%= message %>       
            
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>

        <%
                }
            }
        %> 
    </body>
</html>
