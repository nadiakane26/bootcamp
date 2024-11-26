// import jquery from "jquery";
// window.jQuery = jquery;
// window.$ = jquery;

import "add_jquery";

$(document).ready(function () {
    // Slide Toggle 
    const toggleButton = $("#toggle");
    const hideShowDiv = $("#main-content");
  
    toggleButton.click(function () {
      hideShowDiv.slideToggle(function () {
        // Update button text based on visibility
        toggleButton.text(hideShowDiv.is(":visible") ? "Hide Content" : "Show Content");
      });
    });
  
    // Load more comments 
    $('#load-more-comments').click(function(e) {
        e.preventDefault();  // Prevent page refresh

      // get the url link that points to the next page
    $.get($(this).attr('href'), function(data) {
        // console.log(data)
      $('#comments').append($(data).find('#comments').html());  // Append new comments
      $('#load-more-container').replaceWith($(data).find('#load-more-container'));  // Update the "Load More" button
      });
    });
  });
  
