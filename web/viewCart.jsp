
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Cart</title>
    </head>
    <body>
        <h1>Your selected :</h1>
        <%
            Cart cart = (Cart)session.getAttribute("CART");
            if(cart!=null){
                if(cart.getCart().size()>0){
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
                               <th>Total</th>
                               <th>Edit</th>
                               <th>Remove</th>
                           </tr>
                       </thead>
                       <tbody>
                           <%
                               int count =1;
                               double total =0;
                               for(ProductDTO product : cart.getCart().values()){
                                   total += product.getPrice() * product.getQuantity();
                           %>
                       <form action="MainController">                      
                           <tr> 
                               <td><%=count++ %></td>
                               <td>
                                   <%=product.getProductID()%>
                                   <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                               </td>
                               <td><%=product.getProductName() %></td>
                               <td><img width="60px" height="50px" src="image/<%= product.getImage()%>" alt="Image can't show"></td>
                               <td><%=product.getPrice() %></td>
                               <td>
                                   <input type="number" name="quantity" value="<%=product.getQuantity()%> " required="" min="1"/>
                               </td>
                               <td><%=product.getCategoryID() %></td>
                               
                               <td><%=product.getImportDate() %></td>
                               <td><%=product.getUsingDate() %></td>
                               <td><%=product.getPrice() * product.getQuantity()%></td>
                               <!--edit-->
                               <td>
                                   <input type="submit" name="action" value="Edit"/> 
                                    </td>
                                    <!--remove-->
                                    <td>
                                   <input type="submit" name="action" value="Remove"/> 
                                    </td>
                           </tr>
                            </form>
                           <%
                               }
                               %> 
                       </tbody>
                   </table>
                               <h1> Total : <%= total %> vnd </h1>
                                   
                   <%
                       
                }
            }
            %>
            <a href="user.jsp">Add more</a>
    </body>
</html>
