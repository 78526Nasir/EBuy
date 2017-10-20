
/* Adding unobtrusive javascript on button control*/
/* Adding an extra event listener for register button */

document.addEventListener('DOMContentLoaded', WireUpEvents);

function WireUpEvents() {
    var button1 = document.getElementById('btnLogin');
    button1.addEventListener('click', button1_Click);
}

function usernameValidation() {
    var element = document.getElementById("txtUsername");

    if (!element.value) {
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";
    } else {
        element.style.border = "1px solid #ccc;";
        element.style.boxShadow = "none";
    }
}

function passwordValidation() {
    var element = document.getElementById("txtPassword");

    if (!element.value) {
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #ccc";
        element.style.boxShadow = "none";
    }
}



function button1_Click() {
    usernameValidation();
    passwordValidation();
}