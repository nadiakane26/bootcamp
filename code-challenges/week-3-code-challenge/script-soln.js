// Code runs only after the DOM is loaded
$(document).ready(function () {

    $('#movie-form').on('submit', function (event) {
        event.preventDefault() // prevents the default form submission, which would reload the page
        
        //Get form values
        const title = $('#title').val();
        const genre = $('#genre').val();
        const year = $('#year').val();
        
        //Create a movie object with the collected values
        const movie = { title, genre, year };

            /* {
        title: "Movie Title",  // e.g., "Inception"
        genre: "Movie Genre",  // e.g., "Sci-Fi"
        year: "2021"           // e.g., "2021"
        }
        */
        
        //Get movies from LocalStorage
        let movies = JSON.parse(localStorage.movies) || [];

        // Add the new movie
        movies.push(movie);
        
        // Store the updated movies array
        localStorage.movies =  JSON.stringify(movies);
        
        //Clear the form inputs
        $('#movie-form')[0].reset();
        
        displayMovies();
    });

    function displayMovies() {
        const movieList = $('#movie-list');
        movieList.empty(); //clear the current displayed list
        
        // Retrieves the updated movies from localStorage
        let movies = JSON.parse(localStorage.movies) || [];
        
        // Use for/in loop to iterate through each movie 
        for (let index in movies) {
            let movie = movies[index]
            // Creates a list item to display
            let listItem = $('<li></li>').text(`${movie.title} - (${movie.genre}, ${movie.year})`);
            movieList.append(listItem)
        }
    }
    

    $('#search').click(function () {

        // Retrieves the movie name entered in the input
        const movie = $('#search-movie').val()
        const URL = `https://www.omdbapi.com/?apikey=${API_KEY}&t=`

        // AJAX request to the OMDb API to fetch movie details
        $.ajax({
            url: URL + movie,
            method: "GET",
            success: function (data) {
                // Checks if the movie was found and display its information
                if (data.Response === "True") {
                    const movieInfo = `
                    <h3> Title: ${data.Title}</h3>
                    <p>Genre: ${data.Genre}</p>
                    <p>Year: ${data.Year}</p>
                    <img src =${data.Poster}></p>
                    `;
                    $("#movie-data").append(movieInfo)
                }
                else {
                    $("#movie-data").append("Movie not found")
                };
            },
            error: function (xhr) {
                var status = xhr.status;
                var errorMessage = xhr.responseJSON ? xhr.responseJSON.Error : "An unknown error occurred."
                $("#release-date").text(`Error retrieving movie data:  ${status}  -  ${errorMessage}`);
            }
        })
    })
})