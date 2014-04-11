function retenshee(tenshi_id)
{   $.ajax({
        type:"POST",
        url: "/tenshis/"+tenshi_id+"/retenshee",
        data:{tenshi_id:tenshi_id},

        dataType:'text',
        success:function(){
            Sexy.alert("Your retenshee has been sent!");
        },
        error:function(){
            Sexy.error("Error");
        }
    });
}

function reply(reply_id)
{   var message
    message = Sexy.prompt("<h1>Reply: </h1>")
    {   $.ajax({
        type:"POST",
        url: "/tenshis/"+reply_id+"/reply",
        data:{message:message, reply_id:reply_id},

        dataType:'text',
        success:function(){
            Sexy.alert("Your tenshi has been sent!");
        },
        error:function(){
            Sexy.error("Try again");
        }
        });
    }
}