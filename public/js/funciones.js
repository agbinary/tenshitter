function retenshee(tenshi_id)
{   $.ajax({
        type:"POST",
        url: "/tenshis/"+tenshi_id+"/retenshee",
        data:{tenshi_id:tenshi_id},

        dataType:'text',
        success:function(){
        alert("Retenshee");
        },
        error:function(){
            alert("Error");
        }
    });
}