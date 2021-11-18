<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
th{
	background-color: lightblue;
	opacity: 0.8;
	text-align: center;
	padding: 10px;
}

td{
	padding: 5px;
	border-style: solid;
	border-width: 1px;
	text-align: left;
}

input{
	width: 80%;
}

</style>
</head>
<body>
<table id="listaus">
	<thead>
	<tr>
		<th>Hakusana:</th>
		<th colspan="3"><input type= "text" id="hakusana"></th>
		<th><input type="button" value="HAE" id="hakunappi"></th>
	</tr>
		<tr>
			<th>Asiakas ID</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>
		</tr>
	</thead>
	<tbody>
	
	</tbody>
</table>
<script>
$(document).ready(function(){
	
	haeAsiakkaat();
	$("#hakunappi").click(function(){	
		haeAutot();
	});
	$(document.body).on("keydown", function (event){
		if(event.which==13){
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus();
});

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), 
		type:"GET", 
		dataType:"json", 
		success:function(result){
			$.each(result.asiakkaat, function(i, field){
				var htmlStr;
				htmlStr+="<tr>";
				htmlStr+="<td>"+field.asiakas_id+"</td>";
				htmlStr+="<td>"+field.etunimi+"</td>";
				htmlStr+="<td>"+field.sukunimi+"</td>";
				htmlStr+="<td>"+field.puhelin+"</td>";
				htmlStr+="<td>"+field.sposti+"</td>";
				htmlStr+="</tr>";
				$("#listaus tbody").append(htmlStr);
			});
	}});
}
</script>
</body>
</html>