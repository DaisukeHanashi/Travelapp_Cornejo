import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main_page.dart';
import 'author.dart';

void main() {
  load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xfff3f4f6),
      ),
      home: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: TravelHomePage(),
          ),
          SliverAppBar(
            expandedHeight: 40, // Height of the sticky footer
            floating: true,
            pinned: true,
            backgroundColor: Color(0xffb6c0c8),
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Arrange the icons evenly
                children: [
                  SvgPicture.asset(
                      'assets/images/home_selected_icon.svg'), // Example: Use Icons.ac_unit as a placeholder
                  SvgPicture.asset(
                      'assets/images/bookmark_unselected_icon.svg'), // Example: Use Icons.access_alarm as a placeholder
                  SvgPicture.asset(
                      'assets/images/notification_unselected_icon.svg'), // Example: Use Icons.access_time as a placeholder
                  SvgPicture.asset(
                      'assets/images/profile_unselected_icon.svg'), // Example: Use Icons.accessibility as a placeholder
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
