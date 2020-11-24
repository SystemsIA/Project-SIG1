function eliminarCat(idcategoria){
	
	swal({
		  title: "¿Estas seguro de Eliminar?",
		  text: "Una vez eliminado, ¡no podrá recuperar esta categoría!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((OK) => {
		  if (OK) {
			  $.ajax({
					url:"/admin/eliminar/"+idcategoria,
					success: function(res){
						console.log(res);
					
				}	  ,
			  });
		    swal("¡La categoría seleccionada ha sido borrada!", {
		      icon: "success",
		    }).then((ok)=>{
		    	if(ok){
		    		location.href="/admin/categori";
		    	}
		    });
		  } else {
		    swal("¡La categoría está segura!");
		  }
		});
}