    function crear_modal(url){

        var $ = jQuery.noConflict();
        $('#modal_crear').load(url, function(){
            $(this).modal('show');
        });
    }

     function editar_modal(url){

        var $ = jQuery.noConflict();
        $('#modal_editar').load(url, function(){
            $(this).modal('show');
        });
    }
     function eliminar_modal(url){
        var $ = jQuery.noConflict();
        $('#modal_eliminar').load(url, function(){
            $(this).modal('show');
        });
    }


