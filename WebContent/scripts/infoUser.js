$(document).ready(function() {
	
	var a = $('#nombreUser').val(); 
	
	$('#infoUserTable').DataTable({
		"language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        },
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                title: a
            },
            {
                extend: 'pdfHtml5',
                title: a
            }
        ]
	});
});