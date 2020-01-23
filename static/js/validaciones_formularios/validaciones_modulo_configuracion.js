var $ = jQuery.noConflict();

function guardar_menu(){

	var $ = jQuery.noConflict();
	var descripcion = $('#descripcion').val();
	var modulo =  $('#modulo').val();
	var url =  $('#url').val();
	var name = $('#name').val();
	var lazyname = $('#lazyname').val();
	var view = $('#view').val();

	if (modulo==null){
	   		$('#modulo').toggleClass('is-invalid');
	   		$("#error_modulo").css("display","");
	   		$("#mensaje_modulo").empty();
			$("#mensaje_modulo").append("Este campo no debe estar incompleto. Porfavor seleccione uno de los modulos disponibles.");
			$('#btn_guardar_menu').removeAttr("onclick");
				setTimeout(function(){
				$("#modulo").removeClass('is-invalid');
				$("#error_modulo").css("display","none");
				$("#error_nom_menu").css("display","none");
				$('#btn_guardar_menu').attr({onclick: 'guardar_menu()'});	
				},3000);
			return;
		}

	if (descripcion==null
	   ||descripcion==''
	   ||descripcion.length==0){
	   		$('#descripcion').toggleClass('is-invalid');
	   		$("#error_nom_menu").css("display","");
	   		$("#mensaje_menu").empty();
			$("#mensaje_menu").append("Este campo no debe estar incompleto. Porfavor ingresa el nombre del menu");
			$('#btn_guardar_menu').removeAttr("onclick");
			setTimeout(function(){
				$("#descripcion").removeClass('is-invalid');
				$("#error_nom_menu").css("display","none");
				$('#btn_guardar_menu').attr({onclick: 'guardar_menu()'});				
				},3000);
			return;
		}


	if (url==null || url=='' || url.length==0 && url.startsWith('Academico:') || url.startsWith('Academico:') === false ){
	   		$('#url').toggleClass('is-invalid');
	   		$("#error_url").css("display","");
	   		$("#mensaje_url").empty();
			$("#mensaje_url").append("Porfavor ingresa una url valida para menu. Ejemplo: Academico:ejemplo");
			$('#btn_guardar_menu').removeAttr("onclick");
			setTimeout(function(){
				$("#url").removeClass('is-invalid');
				$("#error_url").css("display","none");
				$('#btn_guardar_menu').attr({onclick: 'guardar_menu()'});					
				},3000);
			return;
		}

	if (lazyname==null
	   ||lazyname==''
	   ||lazyname.length==0){
	   		$('#lazyname').toggleClass('is-invalid');
	   		$("#error_lazy").css("display","");
	   		$("#mensaje_lazy").empty();
			$("#mensaje_lazy").append("Este campo no debe estar incompleto. Porfavor, ingresa un name valido para el menu.");
			$('#btn_guardar_menu').removeAttr("onclick");
			setTimeout(function(){
				$("#lazyname").removeClass('is-invalid');
				$("#error_lazy").css("display","none");
				$('#btn_guardar_menu').attr({onclick: 'guardar_menu()'});				
				},3000);
			return;
		}

	if (name==null
	   ||name==''
	   ||name.length==0){
	   		$('#name').toggleClass('is-invalid');
	   		$("#error_name").css("display","");
	   		$("#mensaje_name").empty();
			$("#mensaje_name").append("Este campo no debe estar incompleto. Porfavor, ingresa un name valido para el menu.");
			$('#btn_guardar_menu').removeAttr("onclick");
			setTimeout(function(){
				$("#name").removeClass('is-invalid');
				$("#error_name").css("display","none");
				$('#btn_guardar_menu').attr({onclick: 'guardar_menu()'});				
				},3000);
			return;
		}

	if (view==null
	   ||view==''
	   ||view.length==0){
	   		$('#view').toggleClass('is-invalid');
	   		$("#error_view").css("display","");
	   		$("#mensaje_view").empty();
			$("#mensaje_view").append("Seleccione el view valido para este menu.");
			$('#btn_guardar_menu').removeAttr("onclick");
			setTimeout(function(){
				$("#view").removeClass('is-invalid');
				$("#error_view").css("display","none");
				$('#btn_guardar_menu').attr({onclick: 'guardar_menu()'});				
				},3000);
			return;
		}

	formulario_menu = document.getElementById('registrar_menu');
	var datos = new FormData(formulario_menu); 
	fetch('/api_menu/',{
		method = 'POST',
		body = datos
	})
	.then(res => data())

    
}


