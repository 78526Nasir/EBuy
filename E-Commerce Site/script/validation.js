/* Generic function for required field validation*/

function usernameValidation() {
    var element = document.getElementById("txtUsername");
    var alertEle = document.getElementById("unAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";
    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

function fullNameValidation() {
    var element = document.getElementById("txtFullName");
    var alertEle = document.getElementById("fnAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

function emailValidation() {
    var element = document.getElementById("txtEmail");
    var alertEle = document.getElementById("eAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

function dobValidation() {
    var element = document.getElementById("txtDOB");
    var alertEle = document.getElementById("dobAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

function religionValidation() {
    var element = document.getElementById("txtReligion");
    var alertEle = document.getElementById("rAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

function passwordValidation() {
    var element = document.getElementById("txtPassword");
    var alertEle = document.getElementById("pAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

function confirmPasswordValidation() {
    var element = document.getElementById("txtConfirmPassword");
    var alertEle = document.getElementById("cpAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
        element.style.border = "1px solid #77dd66";
        element.style.boxShadow = "none";
        alertEle.style.visibility = "hidden";
    }
}

