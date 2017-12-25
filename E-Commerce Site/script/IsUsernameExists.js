$(document).ready(function () {

    $("#txtUsername").keyup(function () {
        var username = $(this).val();
        var label = $("#lblAvailablityMessage");

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
                    } else {
                        label.text(username + " is available");
                        label.css("color", "green");
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });

        }

        if (username.length <= 2) {
            label.text("");
        }
    });
});