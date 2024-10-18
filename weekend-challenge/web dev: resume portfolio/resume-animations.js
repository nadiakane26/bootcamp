// Toggle function by selecting the caret for more details of Experiences and Projects
$('.toggle-icon').click(function () {
    const $sectionTitle = $(this).closest('.section-title');
    let $sectionDesc;

    // Check if there is a <p> tag present (Experiences)
    if ($sectionTitle.next('p').length > 0) {
        // If <p> exists, find the section description after <p>
        $sectionDesc = $sectionTitle.next('p').next('.section-desc');
    } else {
        // If no <p> exists, directly find the section description (Projects)
        $sectionDesc = $sectionTitle.next('.section-desc');
    }

    // Toggle the visibility of the section description
    $sectionDesc.slideToggle();

    // Toggle the 'active' class on the clicked job title
    $sectionTitle.toggleClass('active');

    // Check if the job title has the 'active' class and update the icon accordingly
    if ($sectionTitle.hasClass('active')) {
        $(this).text('▼');  // When expanded, arrow points down
    } else {
        $(this).text('▲');  // When collapsed, arrow points up
    }
});

// Hobbies icon wave animation
$('.hobbies img').hover(
    function () {
        // Mouse hover over to move up the icon up
        $(this).stop().animate({ top: '-20px' }, "slow");
    },
    function () {
        // Return to original position
        $(this).stop().animate({ top: '0' }, "slow");
    }
);
// Change between light and dark-theme
$("#theme-toggle").click(function () {
    var element = document.body;
    element.classList.toggle("dark-mode");
});

// Last updated div with current date and time

document.getElementById('last-updated-date').textContent = new Date().toLocaleString();