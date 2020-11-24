function eliminarCat(idcategoria){
	
	swal({
		  title: "¿Estas seguro de Eliminar?",
		  text: "Una vez eliminado, ¡no podrá recuperar esta categoría! y dañaras tu BD :V y " +
		  		"las relaciones entre tus tablas, mejor crea una nueva cateogoria para que te " +
		  		"juegues ga",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((OK) => {
		  if (OK) {
			  $.ajax({
					url:"/admin/eliminarCategoria/"+idcategoria,
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