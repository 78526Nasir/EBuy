/* 
    // Check the terms and conditions checkbox first 
    // by default set the button cursor to not-allowed
    // If checked then allow cursor
*/

window.onload = function () {
    var checkbox = document.getElementById("cbAgreement");
    if (!checkbox.checked) {
        document.getElementById("btnRegister").disabled = true;
    }
};


/* function for required field validation*/

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


function imageValidation(flag) {
    var element = document.getElementById("fuImage");
    var alertEle = document.getElementById("iAlert");

    if (!element.value) {
        alertEle.style.visibility = "visible";

    } else {
        alertEle.style.visibility = "hidden";
    }
}

//function genderValidation() {
//    var element = document.getElementById("rMale");
//    var element2 = document.getElementById("rFemale");
//    var alertEle = document.getElementById("gAlert");

//    if (!element.checked && !element2.checked) {
//        alertEle.style.visibility = "visible";
//    } else {
//        alertEle.style.visibility = "hidden";
//    }
//}

/* Adding unobtrusive javascript on button control*/
/* Adding an extra event listener for register button */

document.addEventListener('DOMContentLoaded', WireUpEvents);

function WireUpEvents() {
    var button1 = document.getElementById('btnRegister');
    button1.addEventListener('click', button1_Click);
}

function button1_Click() {
    usernameValidation();
    fullNameValidation();
    emailValidation();
    dobValidation();
    religionValidation();
    passwordValidation();
    confirmPasswordValidation();
    //genderValidation();
    imageValidation();
}


function isChecked() {
    var checkbox = document.getElementById("cbAgreement");
    if (!checkbox.checked) {
        document.getElementById("btnRegister").disabled = true;
    } else {
        document.getElementById("btnRegister").disabled = false;
    }
}
