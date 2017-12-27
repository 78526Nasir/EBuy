$(document).ready(function () {

    $("#txtEmail").blur(function () {
        var email = $(this).val();
        var label = $("#lblAvailablityMessage2");
        var alertEle = $("#unAlert");

        $.ajax({
            url: "../WebServices/IsEmailExists.asmx/EmailExists",
            method: "post",
            data: { email: email },
            dataType: "json",
            success: function (data) {
                if (data.EmailInUse) {
                    label.text("Email is already in use");
                    label.css("color", "red");
                    $("#txtEmail").css("border", "1px solid red");
                    $("#txtEmail").css("box-shadow", "0px 0px 5px rgba(255,0,0,0.4)");
                    alertEle.css("visibility", "visible");
                    $("#btnRegister").attr('disabled', 'disabled');
                } else {
                    label.text("");
                    $("#txtEmail").css("border", "1px solid #77dd66");
                    $("#txtEmail").css("boxShadow", "none");
                    alertEle.css("visibility", "hidden");
                }
            },
            error: function (err) {
                alert(err);
            }
        });
    });

});



