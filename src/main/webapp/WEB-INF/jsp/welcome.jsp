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
					<button class="btn btn-primary text-center">Training Details</button>
					<br>
					<div class="float-right">
						<form id="searchTrainee" class="form-inline">
							  <label class="sr-only" for="keywordValue">Search</label>
							  <input type="text" class="form-control mb-2 mr-sm-2" id="keywordValue" placeholder="Search Here">	
							  <button type="submit" class="btn btn-info mb-2">Search</button>
							</form>
					</div>
				</div>
				<table class="table table-bordered mt-2">
					<thead>
						<tr>
							<th>Select</th>
							<th>Trainee Name</th>
							<th>Trainee Email</th>
							<th>Skill</th>
							<th>Batch</th>
							<th>Level</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
							<c:choose>
							    <c:when test="${trainees.size()==0}">
							        <tr> 
							           <td colspan="7" class="text-center text-danger"> No Data Found </td>
							         </tr> 					       
							    </c:when>    
							    <c:otherwise>
							        <c:forEach var="trainee" items="${trainees}">
										<tr>
											<td> <input type="radio" name="selectedone" id="selectedone" value="${ trainee.id }"> </td>
											<td> ${trainee.traineeName} </td>
											<td> ${trainee.email} </td>
											<td>
												<select name="skill${ trainee.id }" id="skill${ trainee.id }" class="form-control">
													<c:forEach var="skil" items="${skillValue}">
														<c:choose>
															<c:when test="${skil == trainee.skill}">
																<option value="${skil}" selected>${skil.getName()}</option>
															</c:when>
															<c:otherwise>
																<option value="${skil}">${skil.getName()}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</td>
											<td> ${trainee.batch} </td>
											<td> ${trainee.level} </td>
											<td>
												<select name="status${ trainee.id }" id="status${ trainee.id }" class="form-control">
													<c:forEach var="stat" items="${statusValue}">
														<c:choose>
															<c:when test="${stat == trainee.status}">
																<option value="${stat}" selected>${stat.getStatusName()}</option>
															</c:when>
															<c:otherwise>
																<option value="${stat}">${stat.getStatusName()}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</td>
										</tr>
								    </c:forEach>
							    </c:otherwise>
							</c:choose>
					</tbody>
				</table>
				
				<% 
					Integer val = (Integer) request.getAttribute("totalObjects"); 
					Integer totalPages = val /5;
					if(val%5 == 0){
						totalPages-=1;
					}
				%>
				<div class="mb-5"> 
					<div class="float-right">
						<button class="btn btn-danger" id="deleteFunction">Delete</button>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Add</button>
						<button class="btn btn-primary">Details</button>
						<button class="btn btn-primary" id="saveFunction">Save</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
					</div>	
					<div class="col-md-6">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    		<% for(int i=0; i<=totalPages; i++) { %>
						    			<li class="page-item"><a class="page-link" onclick="searchAndPagination(<%= i %>)"> <%= i+1 %> </a></li>
									<% } %>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
					<div class="col-md-4">
					</div>	
				</div>

			</div>
		</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Add Trainee</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form:form id="addTrainee" action="addTraineeData" method="post" modelAttribute="traineeVal">
		        		<div class="row">
		        			<div class="col">
								<div class="form-group">
									<form:label path="traineeName">Trainee name:</form:label>
				            		<form:input path="traineeName" class="form-control" required="required"/>
								</div>		        			
		        			</div>
		        			<div class="col">
		        				<div class="form-group">
									<form:label path="email">Trainee Email:</form:label>
			            			<form:input type="email" path="email" id="emailTrainee" class="form-control" required="required"/>
								</div>
		        			</div>
		        		</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<form:label path="skill">Skill:</form:label>
									<form:select path="skill" class="form-control">
				            			<c:forEach var="skil" items="${skillValue}">
				            				<form:option value="${skil}">${skil.getName()}</form:option>
										</c:forEach>
									</form:select>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<form:label path="status">Status:</form:label>
									<form:select path="status" class="form-control">
				            			<c:forEach var="stat" items="${statusValue}">
				            				<form:option value="${stat}">${stat.getStatusName()}</form:option>
										</c:forEach>
									</form:select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<form:label path="batch">Batch :</form:label>
			            			<form:input path="batch" class="form-control" placeholder="Eg : Q2,Q1" required="required"/><br/>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<form:label path="level">Level :</form:label>
			            			<form:input type="number" path="level" class="form-control" placeholder="Eg : 1,2,3" required="required"/>
								</div>
							</div>
						</div>
						<form:button class="btn btn-primary">Add</form:button>
					</form:form>
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
<script>
	$(document).ready(function(){
		
		 
	  $("#saveFunction").click(function(){
		  var selectedValue = $("input[name='selectedone']:checked").val();
		  if(selectedValue == undefined){
			  alert("Please select any value");
		  }
		  else{
			  var reqSkillId = "#skill"+selectedValue;
			  var reqSkillVal = $(reqSkillId).val();
			  
			  var reqStatusId = "#status"+selectedValue;
			  var reqStatusVal = $(reqStatusId).val();
			  
			  $.ajax({
			        url: "/update",
			        type: "PUT",
			        data: {
			        	id : selectedValue,
			        	skill : reqSkillVal,
			        	status : reqStatusVal
			        },
			        success: function (data) {
			           alert(data);
			           location.reload();
			        },
			        error: function (data) {
			        	console.log(data);
			            alert("An error has occured!!!");
			        }
			    });
		  }
	  });
	  
		$("#addTrainee").submit(function(e){
			 e.preventDefault();
			 
			 $.ajax({
				    url: "/addTraineeData",
				    type: "POST",
				    data: $("#addTrainee").serialize(),
				    success: function (data) {
				        if(data == "found"){
					       alert(data);	
				        }
				        else{
					        alert(data);
					        location.reload();
				        }
				     },
				      error: function (data) {
				        console.log(data);
				           alert("An error has occured!!!");
				        }
				 }); 
		});
		
		
		$("#deleteFunction").click(function(){
			var selectedValue = $("input[name='selectedone']:checked").val();
			  if(selectedValue == undefined){
				  alert("Please select any value");
			  }
			  else{
				  $.ajax({
				        url: "/delete",
				        type: "DELETE",
				        data: {
				        	id : selectedValue
				        },
				        success: function (data) {
				           alert(data);
				           location.reload();
				        },
				        error: function (data) {
				        	console.log(data);
				            alert("An error has occured!!!");
				        }
				    });
			  }
		});
		
		$("#searchTrainee").submit(function(e){
			e.preventDefault();
			var inputValue = $("#keywordValue").val();
			localStorage.setItem("keyw", inputValue);
			searchAndPagination(0,inputValue);
		});
		
		
		let searchParams = new URLSearchParams(window.location.search);
		if(searchParams.has('keyword')){
			var localPage = localStorage.getItem("keyw");
			$("#keywordValue").val(localPage);	
		}
		else{
			localStorage.removeItem("keyw");
		}
	});
	
	function searchAndPagination(pageId,keywor){
		if (typeof(pageId)==='undefined') pageId = 0;
		if (typeof(keywor)==='undefined') keywor = "";
		
		var localPage = localStorage.getItem("keyw");
		if(localPage){
			keywor = localPage;
		}
		window.open("/?pageId="+pageId+"&keyword="+keywor,"_self");
	}
	
</script>
</body>
</html>