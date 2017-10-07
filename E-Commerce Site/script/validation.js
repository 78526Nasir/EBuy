/* Generic function for required field validation*/

function usernameValidation(){
    if (!document.getElementById("txtUsername").value) {
        document.getElementById("unAlert").style.visibility = "visible";

    } else {
        document.getElementById("unAlert").style.visibility = "hidden";
    }
}