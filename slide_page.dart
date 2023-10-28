import 'package:flutter/material.dart';

class SlidePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;
  final Offset beginOffset;
  final Offset endOffset;

  SlidePageRoute({
    required this.builder,
    required this.beginOffset,
    required this.endOffset,
  });

  @override
  final Duration transitionDuration = const Duration(milliseconds: 500);

  @override
  final bool opaque = true;

  @override
  final bool barrierDismissible = true;

  @override
  final Color barrierColor = Colors.black;

  @override
  final String barrierLabel = '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const curve = Curves.easeInOut;
    var tween = Tween<Offset>(begin: beginOffset, end: endOffset)
        .chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
