<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room</title>
	<link rel="stylesheet" type="text/css" href="room.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Bungee+Shade&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Tomorrow&display=swap" rel="stylesheet">
	
</head>
<body>
	<% String username = "John"; %>
	<% String code = request.getParameter("roomID"); %>
	<% String person = "User"; %>
	<% String song1= "song1"; %>
	<% String song2= "song2"; %>
	<% String song3= "song3"; %>
	
	<% String count1= "19"; %>
	<% String count2= "9"; %>
	<% String count3= "-4"; %>
	
	<% String artist1= "artist1"; %>
	<% String artist2= "artist2"; %>
	<% String artist3= "artist3"; %>
	
	<script>
		let songs = ["", "EverydayLife", "OldFriends", "BadGuy"];
	</script>
	<div id="header_row">
		<div id="code" class="border-3 col-3 rounded">
			<h5>Room Code</h5>
			<h5><%=code %></h5>
		</div>
		
		
		<h1 class="col-6"><%=username %>'s Room</h1>
		
		<div id="view" class="col-3 border-3 rounded">
			<h5><%=person %> View</h5>
		</div>
	</div> 
	
	<div class="clearfloat"></div>
	<div id="form" class="mt-5 mb-5">
		<form action="" method="">
			<div class="form-group row justify-content-center">
				<div class="col-5">
					<select name="song-name" id="song-id" class="form-control">
						<option value="" selected disabled>-- Add a Song --</option>
						<option value="1"><%=song1 %></option>
						<option value="2"><%=song2 %></option>
						<option value="3"><%=song3 %></option>
					</select>
					
					<input type="hidden" id="username" name="username" value="<%=username%>">
				</div>
				<div class="col-2">
					<button id="submit"  onclick = "return addSong()" type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div> <!-- .form-group -->
		</form>
	</div> 
	
	<div id="queue">
		<ol id = "my-list">
		
			<div class="row justify-content-center">
				<div class="col-6 songaudio">
					<li>
						<%=song1 %> 
						<%=artist1 %>
						<audio controls>
							<source src="BadGuy.mp3" type="audio/mpeg">
						</audio>
						
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count1%></div>
							<div class="triangle-down"></div>
						</div>
	 				</li>
 			</div>
 			<%-- 
 			<div class="row justify-content-center">
				<div class="col-6">
					<li>
						<%=song2 %> 
						<%=artist2 %>
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count2%></div>
							<div class="triangle-down"></div>
						</div>
	 				</li>
 			</div>
			
			<div class="row justify-content-center">
				<div class="col-6">
					<li>
						<%=song3 %> 
						<%=artist3 %>
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count3%></div>
							<div class="triangle-down"></div>
						</div>
	 				</li>
 			</div--%>
		</ol>
	</div>
	<script>
	function addSong(){
		console.log("add song js");
		
		var type;
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "ADD_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + document.querySelector("#song-id").value, false);
		xhttp.send();
		var allSongs = xhttp.responseText.trim();
		
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "addSongServlet?username=" + document.querySelector("#username").value + "&song-name=" + document.querySelector("#song-id").value , false);
		xhttp.send();
		
		var songsFromServlet = xhttp.responseText.trim();
		console.log(songsFromServlet);
		if(xhttp.responseText.trim().length > 0){
			//document.querySelector("#response").innerHTML = songsFromServlet;
			//var array = songsFromServlet.split("&");
			var array = allSongs.split(",");
			console.log(array);
			let orderedList = document.querySelector("#my-list");
			while(orderedList.hasChildNodes()) {
				orderedList.removeChild(orderedList.lastChild);
			}
			for(let i = 0; i < array.length; i++) {
				if(array[i] == "") {
					continue;
				}
				console.log("ADDING NEW ELEMENT WITH NAME: " + songs[array[i]]);
				let listItem = document.createElement("li");
				listItem.innerHTML = songs[parseInt(array[i])];
				orderedList.append(listItem);
			}
			//document.querySelector("#response").innerHTML += array;
			return false;
		}
		
	}
	</script>
	
</body>
</html>