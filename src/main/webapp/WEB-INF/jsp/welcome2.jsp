<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
<style><%@include file="/WEB-INF/css/style.css"%></style>
<title>Assignment </title>
</head>
<body>

	<div class="container">
		<div class="mt-5">
		
		<div class="row">
			<div class="col-md-3 mt-5">
				<div class="boxval mt-3">
					<a href="#">Interviews Planned </a>
				</div>
				<div class="boxval mt-3">
					<a href="#">Training Needs </a>
				</div>
				<div class="boxval mt-3">
					<a href="#">Master Details </a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="text-center">
					<button class="btn btn-primary text-center md-3">Training Details</button>
				</div>
				<table id="traineeList" class="display" style="width: 100%"></table>
				<div class="mb-5 mt-3"> 
					<div class="float-right">
						<button class="btn btn-danger" id="deleteFunction">Delete</button>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Add</button>
						<button class="btn btn-primary">Details</button>
						<button class="btn btn-primary" id="saveFunction">Save</button>
					</div>
				</div>
				

			</div>
		</div>
		
		
		</div>
		
		
	</div>

    
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		for(var i=0;i<'${skillValue}.size()';i++){
			console.log(i);
		}
		
		$('#traineeList').DataTable({
			ajax : {
				url : '/findall',
				dataSrc : ''
			},
			pageLength : 5,
			lengthMenu: [[5, 10, 20, -1], [5, 10, 20, "All"]],
			columns : [ {
				title : 'Select',
				data : 'id',
				render: function(data,type,row){
					return '<input type="radio" name="selectedone" id="selectedone" value="'+data+'">'
				}
			},
			{
				title : 'Name',
				data : 'traineeName'
			},
			{
				title : 'Email',
				data : 'email'
			},
			{
				title : 'Skill',
				data : 'skill',
				/* render: function (data, type, row, meta){
                    var $select = $("<select></select>", {
                    });
                    $.each(${skillValue}, function (k, v) {
						
                        var $option = $("<option></option>", {
                            "text": v,
                            "value": k
                        });
                        if (data == k) {
                            $option.attr("selected", "selected")
                        }
                        $select.append($option); 
                    });
                    return $select.prop("outerHTML");
				} */
			},
			{
				title : 'Batch',
				data : 'batch'
			},
			{
				title : 'Level',
				data : 'level'
			},
			{
				title : 'Status',
				data : 'status'
			},
			]
		});
	});
</script>
</body>
</html>