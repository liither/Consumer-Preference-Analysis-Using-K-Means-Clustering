<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jp:mondrianQuery id="query01" 
	jdbcDriver="com.mysql.jdbc.Driver" 
	jdbcUrl="jdbc:mysql://localhost/apparel?user=root&password=" 
	catalogUri="/WEB-INF/queries/SchemaPenjualan.xml">
    SELECT
    [produk].[Nama_Produk].Members ON ROWS,
    [Measures].[produk terjual] ON COLUMNS
  FROM [penjualan]
</jp:mondrianQuery>

<c:set var="title01" scope="session">ProdukTerjual</c:set>