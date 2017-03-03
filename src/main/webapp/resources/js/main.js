// $('body').scrollspy({ target: '.container-navbar' })
/*--------Mega Menu------------*/
/*$(document).ready(function(){
    $(".dropdown").hover(
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');
        }
    );
});*/
/*---------carousel-------------*/
$(document).ready(function () {
    $('#myCarousel').carousel();
    var winWidth = $(window).innerWidth();
    $(window).resize(function () {

        if ($(window).innerWidth() < winWidth) {
            $('.carousel-inner>.item>img').css({
                'min-width': winWidth, 'width': winWidth
            });
        }
        else {
            winWidth = $(window).innerWidth();
            $('.carousel-inner>.item>img').css({
                'min-width': '', 'width': ''
            });
        }
    });
});

/*---------Confirm Password----------*/
/*
function checkPasswordMatch() {
    var password = $('#password').val();
    var confirmPassword = $('#re-password').val();
    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("گذرواژه‌هایکسان نیستند!");
    else
        // $("#divCheckPasswordMatch").html("Passwords match.");
        $("#divCheckPasswordMatch").hide();

}
$(document).ready(function () {
    $("#password, #re-password").keyup(checkPasswordMatch);
});*/

/*-----Live Search-------*/
/*$(document).read(function () {
    $('#search-form').onkeyup(function () {
        var keywords = this.val();

    });

});*/

/*--------Modal Box-----------*/
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};

/*------Admin sidebar menu----*/
/*
$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active");
});*/
