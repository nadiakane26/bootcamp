const books = {
    book1: { title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Fiction" },
    book2: { title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction" },
    book3: { title: "1984", author: "George Orwell", genre: "Science Fiction" },
    book4: { title: "Pride and Prejudice", author: "Jane Austen", genre: "Fiction" },
    book5: { title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy" }
};

// Always have to have $(document).ready(function () 
$(document).ready(function (){  // jQuery $(function{})
    
    $("#countBooksButton").click(function () {
        // Get the single value an array of values
        const genre = $("#genreSelector").val()
        // console.log(genre);
        const count = countBooksByGenre(books, genre);

        $("#result").text(`Number of books in ${genre}: ${count}`);

    });
   
    function countBooksByGenre(books, genre) {

        var count = 0
        for (var book in books) {
            // console.log(books[book] prints book1, book2, etc...

            console.log(`book is ${typeof book}`)
            // console.log(typeof book[object])
            // console.log(typeof book[object].genre)
            if (books[book].genre === genre) {
                count++
            }

        }
       return count; 
    };
});