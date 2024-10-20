var URL;

$("#search").click(function () {
    var location = $("#location").val();

    // Validate zip code (must be 5 digits)
    if ($.isNumeric(location) && location.length > 5) {
        $("#weather-info").text("Please enter a valid 5-digit zip code.");
        return; // Exit the function early
    }

    // If user entered a zip code
    if ($.isNumeric(location)) {
        URL = `https://api.openweathermap.org/data/2.5/weather?zip=${location}&appid=${apiKey}&units=imperial`;
    } else {
        URL = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${apiKey}&units=imperial`;
    }

    displayWeather(URL);
});

function displayWeather(URL) {
    $.ajax({
        url: URL,
        method: 'GET',
        success: function (data) {
            $("#weather-info").text(
                `Temperature: ${data.main.temp}°F,
                        Weather: ${data.weather[0].main},
                        Condition: ${data.weather[0].description},
                        Humidity: ${data.main.humidity}%
                        Wind Speed: ${data.wind.speed} mph`
            );
        },
        error: function (xhr) {
            var status = xhr.status;
            var errorMessage = xhr.responseJSON ? xhr.responseJSON.message : "An unknown error occurred.";
            $("#weather-info").text(`Error retrieving weather data: ${status} - ${errorMessage}`);
        }
    });
}