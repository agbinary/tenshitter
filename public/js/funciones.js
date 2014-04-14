function retenshee(tenshi_id)
{   $.ajax({
        type:"POST",
        url: "/tenshis/"+tenshi_id+"/retenshee",
        data:{tenshi_id:tenshi_id},

        dataType:'text',
        success:function(){
            Sexy.confirm("Your retenshee has been sent!", {onComplete:function(){location.reload();}});
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
                        Sexy.confirm("Your tenshi has been sent!", {onComplete:function(){location.reload();}});
                    },
                    error:function(){
                        Sexy.error("Error");
                    }
                });
            }
        }
    });
}

function delete_tenshi(delete_id)
{   $.ajax({
        type:"POST",
        url: "/username/"+delete_id+"/delete_tenshi",
        data:{delete_id:delete_id},

        dataType:'text',
        success:function(){
            Sexy.confirm("Your tenshi has been deleted!");
        },
        error:function(){
            Sexy.error("Error");
        }
    });
}

function sign_out()
{   $.ajax({
        type:"POST",
        url: "/username/signout",

        dataType:'text',
        success:function(){
            Sexy.alert("Your sesion has been closed", {onComplete:function(){location.href="/";}});
        },
        error:function(){
            Sexy.error("Error");
        }
    });
}
$(document).ready(function(){
    setInterval(function(){
        new_tenshis();
    },10000);
});

function new_tenshis()
{   $.ajax({
        type:"POST",
        url: "/tenshis/news",

        dataType:'html',
        success:function(r){
            $('#tabla_tenshis').prepend(r);
        }
    });
}

function delete_user(user_id)
{   $.ajax({
        type:"POST",
        url: "/username/"+user_id+"/delete_user",
        data:{user_id:user_id},

        dataType:'text',
        success:function(){
            Sexy.confirm("Your account has been deleted!", {onComplete:function(){location.href="/";}});
        },
        error:function(){
            Sexy.error("Error");
        }
    });
}