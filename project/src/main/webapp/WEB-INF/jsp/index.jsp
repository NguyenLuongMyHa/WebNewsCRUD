<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>LOP T3 SANG NHOM7</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a href="/" class="navbar-brand">LOP_T3_SANG_NHOM 7</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="new-task">New
						Post</a></li>
				<li class="nav-item"><a class="nav-link" href="all-tasks">All
						Posts</a></li>
			</ul>
		</div>
	</nav>

	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Post Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Posts</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Description</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${task.dateCreated}" /></td>
									<td>${task.finished}</td>
									<td><a href="update-task?id=${task.id}"><span
											class="glyphicon glyphicon-pencil">Edit</span></a></td>
									<td><a href="delete-task?id=${task.id}"><span
											class="glyphicon glyphicon-trash">Delete</span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Post</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}" />
					<div class="form-group">
						<label for="InputName">Name</label> <input type="text"
							class="form-control" id="InputName" aria-describedby="NameHelp"
							placeholder="Enter task name" name="name" value="${task.name}" />
						<small id="NameHelp" class="form-text text-muted">Enter
							your new post title.</small>
					</div>

					<div class="form-group">
						<label for="InputName">Description</label> <input type="text"
							class="form-control" id="InputDescription"
							aria-describedby="DescriptionHelp"
							placeholder="Enter task description" name="description"
							value="${task.description}" /> <small id="DescriptionHelp"
							class="form-text text-muted">Enter your new post
							description.</small>
					</div>

					<div class="form-group">
						<label for="InputName">Finished</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="finished"
								id="exampleRadios1" value="true"> <label
								class="form-check-label" for="exampleRadios1"> Yes </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="finished"
								id="exampleRadios2" value="false" checked> <label
								class="form-check-label" for="exampleRadios2"> No </label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Save</button>
				</form>
			</div>
		</c:when>
	</c:choose>

	<script src="static/js/bootstrap.min.js"></script>

</body>
</html>