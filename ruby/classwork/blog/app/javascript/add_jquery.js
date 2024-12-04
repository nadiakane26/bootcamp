// import jquery from "jquery";
// window.jQuery = jquery;
// window.$ = jquery;

console.log("Using jquery")
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

    // Get request for the URL link that points to the next page
    $.get($(this).attr('href'), function(data) {
      
        // console.log(data)
    //     <div id="load-more-container">
    //     <a id="load-more-comments" 
    //     class="btn btn-primary" data-remote="true" 
    //     href="/articles/10?page=5">Load More</a>
    //   </div> 
        // Finds the new comments in html format of the data  
      $('#comments').append($(data).find('#comments').html());  // Append new comments
      $('#load-more-container').replaceWith($(data).find('#load-more-container'));  // Update the "Load More" button
    })
    .fail(function () {
      $('#comments').append('<p class="error-message">Failed to load comments. Please try again later.</p>');
    });
  });

  });
