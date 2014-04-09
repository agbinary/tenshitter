function retenshee(tenshee_id)
{   alert("Probando funcion, id recibida: "+tenshee_id);
    $.ajax({
        type:"POST",
        url:"../models/x.rb",
        data:{tenshi_id:tenshee_id},

        dataType:'text',
        success:function(){
        alert("Data saved");
        },
        error:function(){
            alert("Ha ocurrido un error");
        }
    });
}