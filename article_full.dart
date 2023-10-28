import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'author.dart';
import 'articles.dart';

class ArticleDetail extends StatefulWidget {
  final Article article;
  final Author author;

  const ArticleDetail({Key? key, required this.article, required this.author})
      : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  bool showContent = false;

  @override
  void initState() {
    super.initState();
    // Delay showing content for a smooth animation
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        showContent = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: showContent
                    ? 0
                    : -MediaQuery.of(context)
                        .size
                        .height, // Slide content in/out
                child: AnimatedOpacity(
                  opacity: showContent ? 1.0 : 0.0, // Fade content in/out
                  duration: Duration(milliseconds: 500),
                  child: ContentWidget(
                      article: widget.article, author: widget.author),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class ContentWidget extends StatefulWidget {
  final Article article;
  final Author author;

  const ContentWidget({Key? key, required this.article, required this.author})
      : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildPhoto(widget.article.url),
      buildWriting(widget.article, widget.author)
    ]);
  }

  Widget buildWriting(Article article, Author author) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft, // Align the content to the left
          padding: const EdgeInsets.only(top: 5, left: 12, bottom: 9),
          child: Text(
            article.title,
            style: TextStyle(
              color: Color(0xff111111),
              fontSize: 25,
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w900,
            ),
          )),
      Container(
          width: 315,
          height: 54,
          alignment: Alignment.centerLeft,
          padding:
              const EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 4),
          child: Text(
            author.fullName,
            style: TextStyle(
              color: Color(0xff878484),
              fontSize: 12,
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w400,
            ),
          )),
      Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
          child: Text(
            article.contents,
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 14,
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w600,
            ),
          ))
    ]);
  }

  Widget buildPhoto(String url) {
    return Stack(
      children: [
        // Background image
        Image.network(
          url, // Replace with your image URL or use AssetImage for local images
          fit: BoxFit.cover, // Adjust the fit as needed
          width: double.infinity,
          height: double.infinity,
        ),
        // Row of SVGs overlapped on top
        Positioned(
          top: 20, // Adjust the top position as needed
          left: 20, // Adjust the left position as needed
          right: 20, // Adjust the right position as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 2, // Border width
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/arrow_back_icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 2, // Border width
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/bookmark_selected_icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
