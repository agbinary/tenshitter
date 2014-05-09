function retenshee(tenshi_id)
{   $.ajax({
        type:"POST",
        url: "/tenshis/"+tenshi_id+"/retenshee",
        data:{tenshi_id:tenshi_id},

        dataType:'text',
        success:function(){
            bootbox.alert("Your retenshee has been sent!");
        }
    });
}

function reply(reply_id)
{   bootbox.prompt("Reply:", "Reply",
    { onComplete:
        function(message)
        {   if (message)
            {   $.ajax({
                    type:"POST",
                    url: "/tenshis/"+reply_id+"/reply",
                    data:{message:message, reply_id:reply_id},

                    dataType:'text',
                    success:function(){
                        bootbox.alert("Your tenshi has been sent!");
                    }
                });
            }
        }
    });
}

function delete_tenshi(delete_id)
{   $.ajax({
        type:"DELETE",
        url: "/tenshis/"+delete_id,
        data:{delete_id:delete_id},

        dataType:'text',
        success:function(){
            bootbox.alert("Your tenshi has been deleted!", {onComplete:function(){location.reload();}});
        }
    });
}

function sign_out()
{   $.ajax({
        type:"POST",
        url: "/username/signout",

        dataType:'text',
        success:function(){
            bootbox.alert("Your sesion has been closed", {onComplete:function(){location.href="/";}});
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
        type:"DELETE",
        url: "/"+user_id,
        data:{user_id:user_id},

        dataType:'text',
        success:function(){
            bootbox.alert("Your account has been deleted!", {onComplete:function(){location.href="/";}});
        }
    });
}

function follow(user_id)
{   $.ajax({
        type:"POST",
        url: "/"+user_id+"/follow",
        data:{user_id:user_id},

        dataType:'text',
        success:function(){
            bootbox.alert("Follow!");
        }
    });
}

function unfollow(user_id)
{   $.ajax({
        type:"POST",
        url: "/"+user_id+"/unfollow",
        data:{user_id:user_id},

        dataType:'text',
        success:function(){
            bootbox.alert("Unfollow!");
        }
    });
}
