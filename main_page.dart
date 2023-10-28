import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'author.dart';
import 'slide_page.dart';
import 'article_full.dart';
import 'articles.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TravelHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 113,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 113,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 13,
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 13,
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 26,
                      child: Text(
                        'Monday, 3 October',
                        style: TextStyle(
                          color: Color(0xFF9397A0),
                          fontSize: 12,
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: SearchBar(),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Hashtags(),
        ),
        TravelPosts(),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Short For You',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your action when the "View All" button is pressed
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: Color(0xff5474FD), // Blue color
                      fontSize: 14,
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            )),
        ShortPosts(),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Stack(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search for articles...',
                ),
              ),
              Positioned(
                right: 10, // Adjust the right position as needed
                top: 12, // Adjust the top position as needed
                child: SvgPicture.asset(
                  'assets/images/search_icon.svg', // Replace with the path to your SVG icon
                  width: 24, // Set the width of the SVG icon
                  height: 24, // Set the height of the SVG icon
                  color: Colors.grey, // Set the icon color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Hashtags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTag('#Health'),
        _buildTag('#Music'),
        _buildTag('#Technology'),
        _buildTag('#Sports'),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff878585),
          fontSize: 12,
          fontFamily: 'Gellix',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }
}

class TravelPosts extends StatefulWidget {
  const TravelPosts({super.key});

  @override
  _TravelPost createState() => _TravelPost();
}

class _TravelPost extends State<TravelPosts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: authors.length, // Replace with the number of items you have
        itemBuilder: (BuildContext context, int index) {
          return buildPost(authors[index].articles[0].url, authors[index],
              authors[index].articles[0]);
        },
      ),
    );
  }

  Widget buildPost(String url, Author author, Article article) {
    return Container(
      width: 255,
      height: 304,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 160,
            margin:
                const EdgeInsets.only(right: 12, top: 12, bottom: 20, left: 12),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(8), // Adjust the radius as needed
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft, // Align the content to the left
              padding: EdgeInsets.only(
                  top: 4, left: 12), // Adjust the left padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      article.subtitle,
                      style: TextStyle(
                        color: Color(0xff111111),
                        fontSize: 18,
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Text(
                        author.fullName,
                        style: TextStyle(
                          color: Color(0xff111111),
                          fontSize: 12,
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          SlidePageRoute(
                            builder: (context) => ArticleDetail(
                                article: article,
                                author:
                                    author), // Replace with your actual Article
                            beginOffset: const Offset(
                                0.0, 1.0), // Entering from the bottom
                            endOffset: Offset.zero, // Exiting to the top
                          ),
                        );
                      },
                      child: Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            'assets/images/eye_icon.svg',
                            width: 24,
                            height: 24,
                            color: Color(0xff0e88d9),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    child: Text(
                      'Sep. 9, 2022',
                      style: TextStyle(
                        color: Color(0xff6e6d6d),
                        fontSize: 10,
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShortPosts extends StatefulWidget {
  const ShortPosts({super.key});

  @override
  _Shorts createState() => _Shorts();
}

class _Shorts extends State<ShortPosts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: authors.length, // Replace with the number of items you have
        itemBuilder: (BuildContext context, int index) {
          return buildShortPost(authors[index].articles[1].url, authors[index]);
        },
      ),
    );
  }

  Widget buildShortPost(String url, Author author) {
    return Container(
      width: 208,
      height: 88,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            margin: const EdgeInsets.only(right: 9, top: 5, left: 9),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(12), // Adjust the radius as needed
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft, // Align the column to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      author.articles[1].title,
                      style: TextStyle(
                        color: Color(0xff111111),
                        fontSize: 15,
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      author.fullName,
                      style: TextStyle(
                        color: Color(0xff111111),
                        fontSize: 14,
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
