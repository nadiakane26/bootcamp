$(document).ready(function () {


    $('#movie-form').on('submit', function (event) {
        event.preventDefault()
        //Get form values
        const title = $('#title').val();
        const genre = $('#genre').val();
        const year = $('#year').val();
        
        //Create a movie object
        const movie = { title, genre, year };
        
        //Get movies from LocalStorage
        let movies = JSON.parse(localStorage.getItem('movies')) || [];

        // add the new movie to the array
        movies.push(movie);
        
        // Store the updated movies array back to
        localStorage.setItem('movies', JSON.stringify(movies))
        
        //Clear the form inputs
        $('#movie-form')[0].reset();

        displayMovies();
    });

    function displayMovies() {
        const movieList = $('#movie-list');
        movieList.empty(); //clear the list
        
        //get movies
        let movies = JSON.parse(localStorage.getItem('movies')) || [];
        
        //use for/in loop to iterate over movies
        for (let index in movies) {
            let movie = movies[index]
            let listItem = $('<li></li>').text(`${movie.title} - (${movie.genre}, ${movie.year})`);
            movieList.append(listItem)
        }
    }
    

    $('#search').click(function () {
        const movie = $('#search-movie').val()
        const URL = `https://www.omdbapi.com/?apikey=${API_KEY}&t=`

        $.ajax({
            url: URL + movie,
            method: "GET",
            success: function (data) {
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