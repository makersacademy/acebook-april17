
$(document).ready(function(){
    var thisUrl = window.location.pathname;
    $(`.sidenav > a[href$="${thisUrl}"]`).contents().unwrap().wrap("<p></p>");
});
