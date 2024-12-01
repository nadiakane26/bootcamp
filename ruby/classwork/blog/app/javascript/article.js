// console.log("This is article.js")

// Slide toggle Solution

// Can't use jquery (yet)
document.addEventListener("DOMContentLoaded", () => {
    const toggleButton = document.getElementById("toggle");
    const hideShowDiv = document.getElementById("main-content");
  
   
    toggleButton.addEventListener("click", () => {
      // Toggle the visibility of the #hide-show div
      if (hideShowDiv.style.display === "none") {
        hideShowDiv.style.display = "block"; // Show the content
        toggleButton.textContent = "Hide Content"
      } else {
        hideShowDiv.style.display = "none"; // Hide the content
        toggleButton.textContent = "Show Content"
      }
    });
  });
  