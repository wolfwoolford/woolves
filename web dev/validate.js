/* Filename: validate.js
Target html: register.html
Purpose: validate registration form
Author: Tahnee Woolford S101534034
Date Written: 07/04/2017
Revisions: N/A
Credits:
*/
"use strict";

function validate() {

    var errMsg = "";
    var result = true;

/*gathering local variables from the form*/
     var firstname = document.getElementById("firstname").value;
     var lastname = document.getElementById("lastname").value;
     var age = document.getElementById("age").value;
     var partySize = document.getElementById("partySize").value;
     var is1day = document.getElementById("1day").checked;
     var is4day = document.getElementById("4day").checked;
     var is10day = document.getElementById("10day").checked;
     var human = document.getElementById("human").checked;
     var dwarf = document.getElementById("dwarf").checked;
     var elf = document.getElementById("elf").checked;
     var hobbit = document.getElementById("hobbit").checked;
     var beardLength = document.getElementById("beard").value;

    /*validate id=firstname*/
    if (!firstname.match(/^[a-zA-Z]+$/)){
        errMsg += "Your first name must not be blank, and must contain alpha characters\n";
        result = false;
    }

    /*validate id=surname*/
    if (!lastname.match(/^[a-zA-Z-]^$/)){
        errMsg += "Your last name must not be blank, and may only contact alpha characters and hyphens.\n";
        result = false;
    }
    
    /*validate id=age*/
    if (isNaN(age)) {
        errMsg += "Your age must be a number\n";
        result = false;
    }
    else if (age < 18) {
        errMsg += "You must be 18 or older.\n";
        result = false;
    }
    else if (age > 10000) {
        errMsg += "You must be younger than 10,000. \n";
        result = false;
    }
    else {
        var tempMsg = checkSpeciesAge(age);
        if (tempMsg != "") {
            errMsg += tempMsg;
            result = false;
        }
    }

    /*validate id=partySize*/
    if (isNaN(partySize)) {
        errMsg += "Your party size must be in numerals. \n";
        result = false;
    }
    else if (partySize < 1) {
        errMsg += "There must be at least one person in your party \n";
        result = false;
    }
    else if (partySize > 100) {
        errMsg += "You cannot have more than 100 people in your party. \n";
        result = false;
    }

    //validating food preference
    if (document.getElementById("food").value == "none") {
        errMsg += "You must select a food preference. \n";
        result = false;
    }
    
    //validating trip length preference
    if (!(is1day || is4day || is10day)) {
        errMsg += "Please select at least one trip. \n";
        result = false;
    }

    //validating species check
    if (!(human || elf || dwarf || hobbit)) {
        errMsg += "Please select your species. \n";
        result = false;
    }

    //validating beard check
    var beardTemp = checkSpeciesBeard(beardLength, age);
        if (beardTemp != "") {
            errMsg += beardTemp;
            result = false;
        }

    if (errMsg != ""){
        alert(errMsg);
    }

     if (result) {
        storeBooking(firstname, lastname, age, species, is1day, is4day, is10day)
     }

    return result;
}

function getSpecies() {
    var speciesName = "Unknown";
    var speciesArray = document.getElementById("species").getElementsByTagName("input");

    for (var i = 0; i < speciesArray.length; i++) {
        if (speciesArray[i].checked)
            speciesName = speciesArray[i].value;
    }
    return speciesName;
}

function checkSpeciesAge(age) {
    var errMsg = "";
    var species = getSpecies;
    switch(species) {
        case "Human":
            if (age > 120) {
                errMsg = "You cannot be a Human and over 120 \n";
            }
            break;
        case "Dwarf":
        case "Hobbit":
            if (age > 150) {
                errMsg = "You cannot be a" + species + " and over 150.\n";
            }
            break;
        case "Elf":
            break;
        default:
            errMsg = "We don't allow your kind on our tours. \n";
    }
    return errMsg;
}

function checkSpeciesBeard(beardLength, age) {
    var errMsg = "";
    var species = getSpecies();
    switch(species) {
        case "Human":
            break;
        case "Elf":
        case "Hobbit":
            if (beardLength > 0) {
                errMsg = "You cannot be a" + species + " and have a beard.\n";
            }
            break;
        case "Dwarf":
            if (beardLength < 12 && age > 30) {
                errMsg = "Dwarfs over the age of 30 must have a minimum beard length of 12 inches.\n";
            }
    }
    return errMsg;
}

function storeBooking(firstname, lastname, age, species, is1day, is4day, is10day) {
    var trip = "";
    if (is1day) trip = "1day";
    if (is4day) trip = "4day";
    if (is10day) trip = "10day";
    sessionStorage.trip = trip;
    sessionStorage.firstname = firstname;
    sessionStorage.lastname = lastname;
    sessionStorage.age = age;
    sessionStorage.species = species;
    
    alert ("Trip stored: " + sessionStorage.trip);
}

function prefill_form() {
    if(sessionStorage.firstname != undefined) {
        document.getElementById("firstname").value = sessionStorage.firstname;
    }
    if(sessionStorage.lastname != undefined) {
        document.getElementById("lastname").value = sessionStorage.lastname;
    }
    if(sessionStorage.age != undefined) {
        document.getElementById("age").value = sessionStorage.age;
    }
    if(sessionStorage.beard != undefined) {
        document.getElementById("beard").value = sessionStorage.beard;
    }
    if(sessionStorage.partySize != undefined) {
        document.getElementById("partySize").value = sessionStorage.partySize;
    }
    switch(localStorage.species) {
        case "Human":
            documet.getElementById("human").checked = true;
            break;
        case "Dwarf":
            documet.getElementById("dwarf").checked = true;
            break;
        case "Hobbit":
            documet.getElementById("hobbit").checked = true;
            break;
        case "Elf":
            documet.getElementById("elf").checked = true;
            break;
    }
}

function init() {
    var regForm = document.getElementById("regform"); /*get ref to the HTML getElementById*/
    regForm.onsubmit = validate; /*register the event listener*/
}
window.onload = init;