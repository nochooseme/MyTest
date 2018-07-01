function updateBookShelf(id){
	var bId=parseInt(id);
	var json={id:bId,check:1};
	alert(json.id);
	$.ajax({
		async:false,
		type:"post",
		url:"../updateBookShelf",
		data:JSON.stringify(json),
		contentType:"application/json",
		success:function(data){
			alert(data.result);
		},
		error:function(data){
			alert("error!");
		}
	})

}