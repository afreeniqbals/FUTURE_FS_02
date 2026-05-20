const switcher = document.getElementById("themeSwitcher");

/* =========================
   CHANGE THEME
========================= */

switcher.addEventListener("change", function(){

    const selectedTheme = this.value;

    document.body.className = selectedTheme;

    /* SAVE THEME */

    localStorage.setItem("crmTheme", selectedTheme);

});

/* =========================
   LOAD SAVED THEME
========================= */

window.onload = function(){

    const savedTheme = localStorage.getItem("crmTheme");

    if(savedTheme){

        document.body.className = savedTheme;

        switcher.value = savedTheme;
    }

};/**
 * 
 */