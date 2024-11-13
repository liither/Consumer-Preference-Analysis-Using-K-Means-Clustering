<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jp:mondrianQuery id="query01" 
	jdbcDriver="com.mysql.jdbc.Driver" 
	jdbcUrl="jdbc:mysql://localhost/apparel?user=root&password=" 
	catalogUri="/WEB-INF/queries/SchemaPenjualan.xml">
    SELECT
    [cabang].[Nama_Provinsi].Members ON ROWS,
    [Measures].[total penjualan] ON COLUMNS
  FROM [penjualan]
</jp:mondrianQuery>

<c:set var="title01" scope="session">SchemaPenjualanApparel</c:set>