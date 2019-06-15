$(document).ready(function() {
	$('#cuestionariosTable').DataTable({
		"language": {
			"url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
		}
	});
	
	document.getElementById('addPlayer').onclick = function createInputField() {
	  var input = document.createElement('input');
	  var lineBreak = document.createElement('br');
	  var testId = "player";
	  var i = 0;
	  var x = document.getElementsByTagName('INPUT').length - 2;
	  for (i = 0; i < x; i++) {
	    i;
	  }
	  input.setAttribute('id', testId + i);
	  input.type = 'text';
	  input.name = 'player[]';
	  var aplayer1 = document.getElementById('input-player-list');
	  aplayer1.appendChild(input);
	  aplayer1.appendChild(lineBreak);
	}
/*
	document.getElementById('removePlayer').onclick = function removeInputField() {
	  
	  var x = document.getElementsByTagName('INPUT').length;
	  if ( x > 3 ) {
	  $('#input-player-list input:last').remove();
	  $('#input-player-list br:last').remove();
	  return false;
	  } else {
	  }
	}*/
	
	document.getElementById('addQuestion').onclick = function createInputField() {
		  var div = document.createElement('div');
		  var input = document.createElement('input');
		  var input2 = document.createElement('input'); 
		  var input3 = document.createElement('input');
		  var lineBreak = document.createElement('br');
		  var testId = "player";
		  var i = 0;
		  var x = document.getElementsByTagName('INPUT').length - 2;
		  for (i = 0; i < x; i++) {
		    i;
		  }
		  div.setAttribute('id', testId + i);
		  div.style.border="1px solid grey";
		  div.appendChild(input);
		  div.appendChild(input2);
		  div.appendChild(input3);
		  var aplayer1 = document.getElementById('a-players');
		  aplayer1.after(div);
		  aplayer1.after(lineBreak);
		}
	/*

		document.getElementById('removeQuestion').onclick = function removeInputField() {
		  
		  var x = document.getElementsByTagName('div').length;
		  if ( x > 3 ) {
		  $('#input-player-list input:last').remove();
		  $('#input-player-list br:last').remove();
		  return false;
		  } else {
		  }
		}*/

});