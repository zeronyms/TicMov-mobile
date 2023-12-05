import 'package:flutter/material.dart';
import 'package:movie_app/model/ads_image_model.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/pages/detail_movie_revisi.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<MoviesModel> movies = [];

  void _getInfo() {
    movies = MoviesModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    _getInfo();
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          _adsSection(),
          _searchBar(),
          const SizedBox(height: 30),
          _sedangTayangSection(),
          const SizedBox(height: 30),
          _trailerFilmSection(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  CarouselSlider _adsSection() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
      items: getImagePaths().map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              child: buildImageWidget(imagePath),
            );
          },
        );
      }).toList(),
    );
  }

  Column _trailerFilmSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
            // right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TRAILER FILM",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Selengkapnya",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Color.fromARGB(153, 0, 26, 57),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 17,
                      color: Color.fromARGB(153, 0, 26, 57),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 150,
          // color: Colors.grey,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                // color: Colors.red,
                width: 180,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            movies[index].movieTrailerImage,
                            width: 176,
                            height: 99,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Icon(
                              Icons.play_circle,
                              size: 35,
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      movies[index].name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: movies.length,
          ),
        )
      ],
    );
  }

  Column _sedangTayangSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SEDANG TAYANG",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Selengkapnya",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Color.fromARGB(153, 0, 26, 57),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 17,
                      color: Color.fromARGB(153, 0, 26, 57),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 220,
          // color: Colors.grey,
          child: ListView.separated(
            itemBuilder: (context, index) {
              // final MoviesModel movie = movies[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailMovie2(
                          movie: movies[index],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  // color: Colors.green,
                  width: 110,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          movies[index].movieCover,
                          height: 150,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            movies[index].name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (String theatre in movies[index].theatres)
                                Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Container(
                                    width: 23,
                                    height: 10,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 1,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: theatre == 'CGV'
                                          ? Colors.red
                                          : theatre == 'XXI'
                                              ? const Color.fromARGB(
                                                  255, 212, 124, 1)
                                              : Colors.transparent,
                                    ),
                                    child: Text(
                                      theatre,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 6,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.search),
          hintText: "Search Movie",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 32, 42, 68),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 32, 42, 68),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 33,
          ),
          label: 'Homepage',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.business,
            size: 33,
          ),
          label: 'Cinemas',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.confirmation_num,
            size: 33,
          ),
          label: 'Tickets',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 33,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue.shade900,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 32, 42, 68),
      elevation: 0,
      title: const Text(
        'TicMov',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
