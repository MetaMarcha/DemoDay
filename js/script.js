let acess_nav = document.querySelector('.acess_nav')

document.querySelector('#button_icon').onclick = () => {

    acess_nav.classList.toggle('active');
    navbar.classList.remove('active');
}

let navbar = document.querySelector('.navbar')

document.querySelector('#menu-btn').onclick = () => {

    navbar.classList.toggle('active');
    acess_nav.classList.remove('active');
}

let emojis = document.querySelector('.emojis')

document.querySelector('#icones').onclick = () =>{
    emojis.classList.toggle('active');
}

