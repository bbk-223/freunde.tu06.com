export class navButtonClass {
    nav_button_function(){
        let menu_button = document.getElementById('menuButton');
        let navbar_come = document.getElementById('navbar-come');
        let navbar_close = document.getElementById('close-navbar');
        let navbar_close_mobile = document.getElementById('close-navbar-mobile');

    
    menu_button.addEventListener('click', function(e){
        menu_button.classList.add('menuButtonMove');
        setTimeout(function(){
        navbar_come.classList.add('navbar-move');
        },300);
        setTimeout(function(){
            menu_button.classList.remove('menuButtonMove');
        },1000);
    });

    navbar_close.addEventListener('click',function(e){
        navbar_come.classList.remove('navbar-move');
    });

    navbar_close_mobile.addEventListener('click',function(e){
        navbar_come.classList.remove('navbar-move');
    });
    }
}