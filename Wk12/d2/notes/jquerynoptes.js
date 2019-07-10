
// document.addEventListener("DOMContentLoaded", function () { // this is the vanilla way of doing things
//   $(document).on("ready", function () {}) //jquery way of doin g thing
$(function () { // jquery shortcvut on doing this
    const $li = ${"li"};  ///---- 1document ready call back

    // this will select all the lis in side the html file

    $li.on("click", function (e){
        let const $li = $(e.currentTarget);
        $li.toggleClass("complete"); // toggleClass swithces on and off
    })// having a event reader that will search for the instance of when it is
    // clicked 
    

    $(".todo-form").on("submit", function (e) {
        e.preventDefault();
        const $form = $(e.currentTarget);
        const $input = $form.find("#todo-text");
        const text = $input.val()    

        $("<li>").text(text).appendTo($(".todo-list")); //-------- 4. using it to create html element
        $input.val("")
    })

    $(".todo-list").on("click", "li", function (e) { //----- 2using jQuery as selector
        let const $li = $(e.currentTarget); //--- 3using jQuery as a wrapper
        $li.toggleClass("complete"); // toggleClass swithces on and off
    })// having a event reader that will search for the instance of when it is
    // clicked

})

<li data-whatever="S">  // can be easily accesssed with jQuery</li>



$("li:first-child").data("whatever",);