function retenshee(tenshi_id)
{   $.ajax({
        type:"POST",
        url: "/tenshis/"+tenshi_id+"/retenshee",
        data:{tenshi_id:tenshi_id},

        dataType:'text',
        success:function(){
            Sexy.confirm("Your retenshee has been sent!");
        },
        error:function(){
            Sexy.error("Error");
        }
    });
}

function reply(reply_id)
{   Sexy.prompt("Reply:", "Reply",
    { onComplete:
        function(message)
        {   if (message)
            {   $.ajax({
                    type:"POST",
                    url: "/tenshis/"+reply_id+"/reply",
                    data:{message:message, reply_id:reply_id},

                    dataType:'text',
                    success:function(){
                        Sexy.confirm("Your tenshi has been sent!");
                    },
                    error:function(){
                        Sexy.error("Error");
                    }
                });
            }
        }
    });
}