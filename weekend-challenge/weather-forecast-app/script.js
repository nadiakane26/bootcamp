$(document).ready(function () {

    var URL;
    const defaultCity = "Saint Paul"; // Default city to be displayed

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

    // Trigger search when Enter key is pressed inside the input field
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

            $("#city-name").text(`${data.name}`); // Display the city name

            // Update weather info
            $("#temperature").text(`${data.main.temp.toFixed(0)}˚`); // Round the temperature
            $("#weather-cond").text(`${data.weather[0].main}: ${data.weather[0].description}`);

            // Update humidity and wind speed
            $("#humidity").text(`${data.main.humidity}%`);
            $("#wind-speed").text(`${data.wind.speed} mph`);

            // Weather icon from OpenWeather API
            const icon = data.weather[0].icon;
            const iconSrc = `https://openweathermap.org/img/wn/${icon}@4x.png`;  // URL for the icon
            console.log(iconSrc)
            $("#weather-icon").attr("src", iconSrc); // Set the icon and show it
            // Set background gradient based on weather
            setBackgroundGradient(data.weather[0].main);
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
        Snow: "linear-gradient(180deg, #dfe6e9, #b2bec3)", // gray
        Rain: "linear-gradient(180deg, #9f9f9f, #ffffff)", // gray
        Drizzle: "linear-gradient(180deg, #9f9f9f, #ffffff)", // gray
        Thunderstorm: "linear-gradient(180deg, #707070, #ffffff)", // gray
        Mist: "linear-gradient(180deg, #9f9f9f, #636e72)", // gray
    };

    // Get the gradient background based on the weather condition or use the default
    const gradient = gradients[weatherMain] || "linear-gradient(180deg, #ffffff, #f1f1f1)";

    // Apply the gradient background 
    document.body.style.backgroundImage = gradient;
}

function DateTime() {
    const optionsDate = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const optionsTime = { hour: '2-digit', minute: '2-digit', hour12: false }; // 24-hour format

    const now = new Date();
    const date = now.toLocaleDateString(undefined, optionsDate);
    const time = now.toLocaleTimeString(undefined, optionsTime);

    // Update the date and time display
    document.getElementById('date-time').innerHTML = `${date}<br>${time}`;
}

DateTime();