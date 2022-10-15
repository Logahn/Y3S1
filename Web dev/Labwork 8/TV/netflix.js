
function mov() {
  function movie_rating(movie_name, rating) {
    this.movie_name = movie_name;
    this.rating = rating;
    document.write('<h3>' + movie_name + '</h3>' + "<ul><li>"+"Рейтинг фильма: " + rating  + "<br>");
  }

  function movie_desc(director, year, cost) {
    this.director = director;
    this.year = year;
    this.cost = cost;
    document.write(
        "<li>Режиссер фильма: " + director + "<br>" +
        "<li>Год выхода фильма: " + year + "<br>" +
        "<li>Стоимость производства фильма: $"+ cost + " миллион"+ "<br>" + "</ul>"
    );
  }

  //! Instances
  movie_rating_1 = new movie_rating("Game of Thrones", "9.0/10");
  movie_desc_1 = new movie_desc("David Benioff", "2011", "520");

  movie_rating_2 = new movie_rating("Pirates of the Caribbean: On Stranger Tides", "8.9/10");
  movie_desc_2 = new movie_desc("Rocky Mcdonald", "2011", "379");

  movie_rating_3 = new movie_rating("Avengers: Age of Ultron", "8.5/10");
  movie_desc_3 = new movie_desc("Cruz Hart", "2015", "365");

  movie_rating_4 = new movie_rating("John Carter", "7.6/10");
  movie_desc_4 = new movie_desc("Daisie Molloy", "2017", "295");

  movie_rating_5 = new movie_rating("The Lion King", "7.3/10");
  movie_desc_5 = new movie_desc("Ariya Bauer", "2009", "124");

  movie_rating_6 = new movie_rating("Spectre", "8.4/10");
  movie_desc_6 = new movie_desc("Shahid Edge", "2018", "245");

  movie_rating_7 = new movie_rating("Thor: Love and Thunder", "5.3/10");
  movie_desc_7 = new movie_desc("Hoorain Berg", "2020", "65");

  movie_rating_8 = new movie_rating("Maleficent", "8.9/10");
  movie_desc_8 = new movie_desc("Sheena Leech", "2022", "109");

  movie_rating_9 = new movie_rating("Avatar", "4.7/10");
  movie_desc_9 = new movie_desc("Joy Hicks", "2011", "321");

  movie_rating_10 = new movie_rating("Man of Steel", "8.6/10");
  movie_desc_10 = new movie_desc("Leonardo Townsend", "2017", "460");
}
