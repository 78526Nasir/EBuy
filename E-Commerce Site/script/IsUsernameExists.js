$(document).ready(function () {

    $("#txtUsername").blur(function () {
        var username = $(this).val();
        var label = $("#lblAvailablityMessage");
        var alertEle = $("#unAlert");

        if (username.length >= 3) {
            $.ajax({
                url: "../WebServices/IsUserNameExists.asmx/UserNameExists",
                method: "post",
                data: { username: username },
                dataType: "json",
                success: function (data) {
                    if (data.UserNameInUse) {
                        label.text(username + " is already in use");
                        label.css("color", "red");
                        $("#txtUsername").css("border", "1px solid red");
                        $("#txtUsername").css("box-shadow", "0px 0px 5px rgba(255,0,0,0.4)");
                        alertEle.css("visibility", "visible");
                        $("#btnRegister").attr('disabled', 'disabled');

                    } else {
                        label.text("");
                        $("#txtUsername").css("border", "1px solid #77dd66");
                        $("#txtUsername").css("boxShadow", "none");
                        alertEle.css("visibility", "hidden");
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });
        }
    });
});