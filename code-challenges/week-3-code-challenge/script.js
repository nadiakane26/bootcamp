function saveFormData(){
    event.preventDefault();
    var list = $("form").serializeArray();
    console.log(list);
}
/*$(function () {
    // add click function & logic for AJAX request here
    // do not forget to hide API key 
});

*/

/* $("#search").click(function () {
    var title = $("#title").val();
    var genre = $("#genre").val();
    var year = $("#year").val();

    movieData = {
        title:title,
        genre:genre,
        year:year
    }
});
*/

/*
function saveFormData() {
    //Check to see if local storage already exists
     if (localStorage.movieData) {
        var movieData = JSON.parse(localStorage.movieData);
        console.log(movieData);
    }
    else {
        var movieData = {

        }
    }
        
    //Prevents the submit button from refreshing the page
    event.preventDefault();

    //Converts the form data into a list of objects
    var movieData = $("movie-form").serializeArray();
    console.log(movieData);
    */

    /*
    //Store form data into a user object
    
    var movie = {
        title: movieData[0].value,
        genre: movieData[1].value,
        year: movieData[2].value,
    }
    if (movieExist(movie)) {
        alert("That movie already exists!");
    }
    else {
        movieList.push(movie)
    }

    localStorage.movieTitle = JSON.stringify(movieTitle)
    localStorage.genre = JSON.stringify(genre);
    localStorage.year = JSON.stringify(year);
    console.log(movieData)
}
    

function movieExist(movie) {
    for (var i = 0; i < movieList.length; i++) {
        if (movieList[i].movieTitle == movieList.genre == movie.genre) {
            return true;
        }
    }
    return false;
}
              
*/