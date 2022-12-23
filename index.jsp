<%-- 
    Document   : index
    Created on : Oct 31, 2022, 12:19:09 AM
    Author     : annma
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
          
        //Use a try/catch block to catch any database exceptions
        try { 
            //Create a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/classicmodels", "root", "Hemingway007");

            //Create a new SQL statement using the connection
            Statement stmt = con.createStatement();


            //Execute the SQL statement to retrieve a result set of records from the database.
            //This SQL query will retrieve all of the records in the products table
            ResultSet rs = stmt.executeQuery("SELECT * FROM order WHERE ;");  
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ClassicModels</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
        <body>
        <h1>Welcome to Classic Models LTC!</h1>
        <table border="0">
                <thead>
                        <tr>
                                <th>Northwind Traders supplies a wide range of gourmet foods to grocery stores and specialty retailers.</th>
                            </tr>
                    </thead>
                <tbody>
                        <tr>
                              <td>To learn more about our products, select a product below:</td>
                            </tr>
                <tr>
                        <td>
                                <form action="response.jsp">
                                        <strong>Enter Order Number:</strong>
                                        <input type="text" name="orderNumber" value="" />
    <%
            //Use a while loop to iterate through the resultset of records
            while (rs.next()){
                //print out the data in ProductName column in the current record
                //The first column contains product name so we are calling the getString() method to retrieve it.
                %>
                <option value="<%out.print(rs.getString(1));%>"><%out.print(rs.getString(2));%></option>
                <%
            }//end while loop
               //Close the connection to the database
            con.close();

        }catch(Exception e){
            out.println(e);
        } //end try catch
            %>
                                            
                                   
                                        </select>
                                        <input type="submit" value="submit" name="submit" />
                                    </form>
                            </td>
                </tr>
        </table>
    </body>

