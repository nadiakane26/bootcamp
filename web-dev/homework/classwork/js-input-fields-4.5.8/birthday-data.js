// Check if there are any friends stored in local storage
if (localStorage.friends) {
    // Parse the JSON string into an array of friends
    var birthdayList = JSON.parse(localStorage.friends);
} else {
    // Initialize an empty array if no friends are found 
    var birthdayList = [];
}

function logBirthday() {
    // Get the form data as an array of key-value pairs
    var birthday = $('#birthday-form').serializeArray();

    // Create a friend object 
    var friend = {
        firstName: birthday[0].value,
        lastName: birthday[1].value,
        birthday: birthday[2].value.substring(5) // Ignore the year, starting with the 5th index in YYYY-MM-DD
    };
    
    // Add the new friend to the birthday list
    birthdayList.push(friend);
    
    // Store the updated list of friends in local storage as a JSON string
    localStorage.friends = JSON.stringify(birthdayList);
}

// Function to check for a birthday
function checkBirthday(event) {
    // Stop the form submission from refreshing the page
    event.preventDefault();
    
    // Get the input date from the form and ignore the year
    var date = $("#check-birthday").serializeArray();
    date = date[0].value.substring(5); // Ignore the year starting with the 5th index

    // Call function to check if the date exists in the birthday list
    doesDateExist(date);
}

// Check if a birthday exists for the given date
function doesDateExist(date) {
    // Loop through the birthday list
    for (var i = 0; i < birthdayList.length; i++) {
        // Check if the friend's birthday matches the input date
        if (birthdayList[i].birthday == date) {
            // Append the friend's name to the records and show it
            $("#record-birthdays").append(birthdayList[i].firstName + " " + birthdayList[i].lastName + "<br>").show();
        }
    }
}
