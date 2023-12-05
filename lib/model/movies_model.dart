class MoviesModel {
  String name;
  String movieCover;
  String movieTrailerImage;
  String sinopsis;
  String actor;
  String director;
  String rating;
  String tanggalTayang;
  String ageRestriction;
  String movieDuration;
  List<String> theatres;

  MoviesModel({
    required this.name,
    required this.movieCover,
    required this.theatres,
    required this.movieTrailerImage,
    required this.sinopsis,
    required this.actor,
    required this.ageRestriction,
    required this.director,
    required this.movieDuration,
    required this.rating,
    required this.tanggalTayang,
  });

  static List<MoviesModel> getMovies() {
    List<MoviesModel> movies = [];
    movies.add(
      MoviesModel(
        movieCover: 'assets/images/Mulan.jpg',
        movieTrailerImage: 'assets/images/MulanDetail.jpg',
        name: "Mulan",
        theatres: ["CGV", "XXI"],
        sinopsis:
            "To keep her ailing father from serving in the Imperial Army, a fearless young woman disguises herself as a man and battles northern invaders in China.",
        actor: "Liu Yifei, Donnie Yen, Gong Li, Jet Li, Jason Scott Lee",
        director: "Niki Caro",
        rating: "5.8/10",
        tanggalTayang: "September 3 2020",
        ageRestriction: "13+",
        movieDuration: "1h 55m",
      ),
    );
    movies.add(
      MoviesModel(
        movieCover: 'assets/images/YATAOME1.jpg',
        movieTrailerImage: 'assets/images/YATAOME6.jpg',
        name: "You Are the Apple of My Eye",
        theatres: ["CGV"],
        sinopsis:
            "In Japan in the early 2000s Kosuke Mizushima is a popular yet childish high school student living a comfortable life. He wants to start a relationship with his classmate, but she's a serious honors student.",
        actor: "Yuki Yamada, Honoka Matsumoto, Asuka Saito",
        director: "Yasuo Hasegawa",
        rating: "6.1/10",
        tanggalTayang: "October 5 2018",
        ageRestriction: "18+",
        movieDuration: "1h 54m",
      ),
    );
    movies.add(
      MoviesModel(
        movieCover: 'assets/images/TL10Y.jpg',
        movieTrailerImage: 'assets/images/TL10Y2.webp',
        name: "The Last 10 Years",
        theatres: ["XXI"],
        sinopsis:
            "Twenty-year-old Matsuri Takabayashi learns that she only has ten years to live due to an incurable disease. She decides to not dwell on her life and not to fall in love, but she meets Kazuto Manabe at a school reunion.",
        actor: "Nana Komatsu, Kentaro Sakaguchi, Yuki Yamada, Nao Honda",
        director: "Michihito Fuji",
        rating: "6.8/10",
        tanggalTayang: "March 4 2022",
        ageRestriction: "18+",
        movieDuration: "2h 4m",
      ),
    );
    movies.add(
      MoviesModel(
        movieCover: 'assets/images/BabyDriver.jpg',
        movieTrailerImage: 'assets/images/BabyDriver2.jpg',
        name: "Baby Driver",
        theatres: ["CGV", "XXI"],
        sinopsis:
            "After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.",
        actor: "Ansel Elgort, Jon Bernthal, Jon Hamm, Eiza Gonzalez",
        director: "Edgar Wright",
        rating: "7.6/10",
        tanggalTayang: "June 28 2017",
        ageRestriction: "20+",
        movieDuration: "1h 53m",
      ),
    );
    return movies;
  }
}
