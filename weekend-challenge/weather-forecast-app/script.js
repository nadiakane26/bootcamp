// Default Saint Paul to be displayed
$(document).ready(function () {

    var URL;
    const defaultCity = "Saint Paul"; 

    // Set the API URL for the default city
    URL = `https://api.openweathermap.org/data/2.5/weather?q=${defaultCity}&appid=${apiKey}&units=imperial`;
    
    // Display weather for the default city on page load
    displayWeather(URL); 

    // Trigger search on search icon click
    $(".fa-search").click(function () {
        var location = $("#location").val(); // Get the input and trim spaces
        // Validate the input first
        if (location === "") {
            $("#weather-info").text("Please enter a city name or zip code.");
            return;
        }

        // Generate the API URL based on input (zip code or city name)
        if ($.isNumeric(location)) { // If it's a numeric input (zip code)
            URL = `https://api.openweathermap.org/data/2.5/weather?zip=${location}&appid=${apiKey}&units=imperial`;
        } else { // Assume it's a city name
            URL = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${apiKey}&units=imperial`;
        }
        displayWeather(URL); // 
    });

    // Trigger search when Return/Enter key is pressed inside the input field
    $("#location").keypress(function (e) {
        if (e.which === 13) { // 13 is the Enter key
            $(".fa-search").trigger('click'); // Trigger the search icon click event
        }
    });
});

function displayWeather(URL) {
    $.ajax({
        url: URL,
        method: 'GET',
        success: function (data) {
            // Display the city name
            $("#city-name").text(`${data.name}`); 

            // Update weather info
            $("#temperature").text(`${data.main.temp.toFixed(0)}˚`); // Round the temperature
            $("#weather-cond").text(`${data.weather[0].main}: ${data.weather[0].description}`);
            $("#humidity").text(`${data.main.humidity}%`);
            $("#wind-speed").text(`${data.wind.speed} mph`);

            // Using the weather icons from OpenWeather API
            const icon = data.weather[0].icon;
            const iconSrc = `https://openweathermap.org/img/wn/${icon}@4x.png`;  // URL for the icon
            $("#weather-icon").attr("src", iconSrc); // Set the icon and show it
            
            // Set background gradient based on weather
            setBackgroundGradient(data.weather[0].main);

            // Get the timezone offset from the API response
            const timezoneOffset = data.timezone; // This is in seconds
            
            // Calculate and display the local time
            displayLocalTime(timezoneOffset);
        },
        error: function (xhr) {
            var status = xhr.status;
            var errorMessage = xhr.responseJSON ? xhr.responseJSON.message : "An unknown error occurred.";
            $("#error-message").text(`Error retrieving weather data: ${status} - ${errorMessage}`);
        }
    });
}

function setBackgroundGradient(weatherMain) {
    const gradients = {
        Clear: "linear-gradient(180deg, #ffffff, #ffa500)", // orange
        Clouds: "linear-gradient(180deg, #0097ff, #ffffff)", // blue
        Snow: "linear-gradient(180deg, #dfe6e9, #d2d2d2)", // light gray
        Thunderstorm: "linear-gradient(180deg, #707070, #ffffff)", // dark gray
        Rain: "linear-gradient(180deg, #9f9f9f, #ffffff)", // gray
        Drizzle: "linear-gradient(180deg, #9f9f9f, #ffffff)", // gray
        Mist: "linear-gradient(180deg, #9f9f9f, #636e72)", // gray
    };

    // Apply the gradient background 
    document.body.style.backgroundImage = gradients[weatherMain];
}

function displayLocalTime(offsetInSeconds) {
    // Get the current UTC time
    const utcNow = new Date();

    // Convert offset from seconds to milliseconds
    const offsetInMilliseconds = offsetInSeconds * 1000; // Correct conversion

    // Create a new Date object for the local time
    const localTime = new Date(utcNow.getTime() + offsetInMilliseconds);

    // Format date and time separately
    const date = localTime.toUTCString().split(' ').slice(0, 4).join(' ');  // Extract "Tue, 22 Oct 2024"
    
    // toLocaleString outputs the wrong
    // Extract hours and minutes only
    const time = localTime.toISOString().slice(11,16);
    
    // Update the date and time display
    document.getElementById('date-time').innerHTML = `${date}<br>${time}`;
}

