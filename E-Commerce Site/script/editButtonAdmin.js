
function btnUEditClick() {
    var txtAEle = document.getElementById("txtUsername");
    txtAEle.disabled = false;
    txtAEle.style.cursor = "default";
    txtAEle.style.background = "white";

    var btnAEle = document.getElementById("btnUpdate");
    btnAEle.disabled = false;
    btnAEle.style.cursor = "pointer";
}

function btnFNEditClick() {
    var txtAEle = document.getElementById("txtFullName");
    txtAEle.disabled = false;
    txtAEle.style.cursor = "default";
    txtAEle.style.background = "white";

    var btnAEle = document.getElementById("btnUpdate");
    btnAEle.disabled = false;
    btnAEle.style.cursor = "pointer";
}

function btnPEditClick() {
    var txtEle = document.getElementById("txtPassword");
    txtEle.setAttribute('type', 'password');
    txtEle.disabled = false;
    txtEle.style.cursor = "default";
    txtEle.style.background = "white";
    var btnEle = document.getElementById("btnUpdate");
    btnEle.disabled = false;
    btnEle.style.cursor = "pointer";
}