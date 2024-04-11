"use strict";

// Aidan Meyer, Jake Freed, Emilyo Garcia
// 21 April 2023

const firstTextFieldEl = document.querySelector("#value1");
const testButtonEl = document.querySelector('#test');

const formEl = document.querySelector('#valueForm');

let change_textfield = ()=> {
    firstTextFieldEl.setAttribute('value', 'NEW')
}

let allFilled = () => {
    if (firstTextFieldEl.value != "vanilla" || firstTextFieldEl.value != "chocolate" ) {
        alert('First text field must be vanilla or chocolate!');
        return false;
    }
}

formEl.onsubmit = allFilled;

testButtonEl.addEventListener('click', change_textfield);