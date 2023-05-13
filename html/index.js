let currentspeed = 0
let timer = 0
let timer2 = 0
let text = document.getElementById("currentspeed");
let text2 = document.getElementById("maxspeed");
let text3 = document.getElementById("zerosix");
let text4 = document.getElementById("zerohundred");


$(function () {
    $('#container').hide();
    window.addEventListener('message', function(event) {
        item = event.data;
        if (item.type === "ui") {
            $('#container').show();
        }else if (item.type === "ui_close") {
            $('#container').hide();
        } 
         currentspeed = item.currentspeed
        if (currentspeed >= 0) {
            text.innerText = 'CURRENT SPEED : ' + parseInt(item.currentspeed) + ' KMH';
            text2.innerText = 'MAX SPEED : ' + parseInt(item.vehiclemaxspeed) + ' KMH';
            text3.innerText = '0-60 KMH : ' + item.timer + ' s';
            text4.innerText =  '0-100 KMH : ' + item.timer2 + ' s';
        } else {
            text.innerText = 'CURRENT SPEED : 0 ' + 'KMH';
            text2.innerText = 'MAX SPEED : 0 ' + ' KMH';
            text3.innerText = '0-60 KMH : 0 ' + ' s';
            text4.innerText =  '0-100 KMH : 0 ' + ' s';
        }

    })
})



    