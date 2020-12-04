function eliminarProduct(idproducto,idusuario){
	
	swal({
		  title: "¿Esta seguro de Eliminar la categoria del producto?",
		  text: "Una vez eliminado, ¡no podrá recuperar la categorizacion!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((OK) => {
		  if (OK) {
			  $.ajax({
					url:"/seller/categoria/quitar/"+idproducto,
					success: function(res){
						console.log(res);
					
				},
			  });
		    swal("¡La categoría del productos seleccionado ha sido eliminada!", {
		      icon: "success",
		    }).then((ok)=>{
		    	if(ok){
		    		
		    		location.href="/seller/"+idusuario+"/categoria/products";
		    	}
		    });
		  } 
		});
}