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

    // Get the URL link that points to the next page
    $.get($(this).attr('href'), function(data) {
      $('#comments').append($(data).find('#comments').html());  // Append new comments
      $('#load-more-container').replaceWith($(data).find('#load-more-container'));  // Update the "Load More" button
    })
    .fail(function () {
      $('#comments').append('<p class="error-message">Failed to load comments. Please try again later.</p>');
    });
  });


   // Like button click handler
   $(".like-btn").click(function (e) {
    e.preventDefault(); // Prevent default link behavior (page navigation)

    var button = $(this);
    var commentId = button.data("comment-id");  // Get the comment ID from the data attribute
    var likeCountElement = $("#like-count-" + commentId);  // Like count element to update
    var likeCount = parseInt(likeCountElement.text());  // Get the current like count

    // Send the AJAX request (PUT for like and DELETE for unlike)
    $.ajax({
      url: button.attr("href"),  // URL for the like action
      method: 'PUT',  // Use PUT to create a like
      dataType: 'json',
      success: function(response) {
        // Update the like count and button text based on response
        likeCountElement.text(response.likes_count);  // Update the like count display
        button.text(response.liked ? "Unlike" : "Like");  // Change button text to 'Unlike' or 'Like'

        // Optionally, toggle the button style or add a class for visual feedback
        if (response.liked) {
          button.addClass('liked'); // Optional: Add a 'liked' class to style it differently
        } else {
          button.removeClass('liked');
        }
      },
      error: function() {
        alert('Error updating like status!');
      }
    });
  });
});