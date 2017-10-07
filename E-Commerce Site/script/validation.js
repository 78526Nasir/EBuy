/* Generic function for required field validation*/

function usernameValidation() {
    var element = document.getElementById("txtUsername");
    var alertEle = document.getElementById("unAlert");
    if (!element.value) {
        alertEle.style.visibility = "visible";
        element.style.border = "1px solid red";
        element.style.boxShadow = "0px 0px 5px rgba(255,0,0,0.4)";

    } else {
       alertEle.style.visibility = "hidden";
    }
}

