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

$('#load-more-comments').click(function(e) {
    e.preventDefault();  // Prevent page refresh
  
    // get the url link that points to the next page
    $.get($(this).attr('href'), function(data) {
        console.log(data)
      $('#comments').append($(data).find('#comments').html());  // Append new comments
      $('#load-more-container').replaceWith($(data).find('#load-more-container'));  // Update the "Load More" button
    });
  });

// $(document).ready(function() {
//     var counter = 0
//     $('.like-btn').on('click', function() {
//       const commentId = $(this).data('comment-id');  // Get data attribute
//       const likeCountElement = $(`#like-count-${commentId}`);  // Select like count element
  
//       // Toggle "like" logic
//       if ($(this).hasClass('liked')) {
//         $(this).removeClass('liked');
//         $(this).html('Like <i class="fa-regular fa-thumbs-up"></i>');  
//         likeCountElement.text(parseInt(likeCountElement.text()) - 1);  // Update like count
//       } else {
//         $(this).addClass('liked');
//         $(this).html('Unlike');
//         likeCountElement.text(parseInt(likeCountElement.text()) + 1);  // Increment like count
//       }
//     });
//   });
  