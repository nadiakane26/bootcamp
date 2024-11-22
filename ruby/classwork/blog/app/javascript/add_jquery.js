// import jquery from "jquery";
// window.jQuery = jquery;
// window.$ = jquery;

import "add_jquery";

$(document).ready(function () {
    const toggleButton = $("#toggle");
    const hideShowDiv = $("#main-content");

    toggleButton.click(function () {
        hideShowDiv.slideToggle(function () {
            // This callback runs after the animation completes
            toggleButton.text(hideShowDiv.is(":visible") ? "Hide Content" : "Show Content");
        });
    });
});

// Dynamic content loading for comments
$('#load-comments').on('click', function () {
    const categoryId = $('#load-comments').data('category');
    const articleId = $('#load-comments').data('article');

    // console.log('categoryId:', categoryId);  // Debugging line
    // console.log('articleId:', articleId);    // Debugging line

    const url = `/categories/${categoryId}/articles/${articleId}/comments`;
    console.log($.getJSON(url));

    $.getJSON(url, function(data){
        console.log(data);
        // Append the new comments to the container #comments
        // Loop through the comments and append them to the #comments container
        data.forEach(comment => {
            $('#comments').append("");
        });
    })
        // add .fail callback to handle error messaging
        .fail(function () {
            $('#comments').append('<p class="error-message">Failed to load comments. Please try again later.</p>');
        });
});