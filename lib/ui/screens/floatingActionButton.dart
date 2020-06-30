import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:unit_converter_app/constant.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  @override
  _FloatingActionButtonWidgetState createState() =>
      _FloatingActionButtonWidgetState();
  Function getMap;
  FloatingActionButtonWidget(this.getMap);
}

class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 260));

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "Weights",
          iconColor: Colors.white,
          bubbleColor: Colors.red,
          icon: FontAwesomeIcons.weight,
          titleStyle: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          onPress: () {
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: "Lengths",
          iconColor: Colors.white,
          bubbleColor: Colors.red,
          icon: FontAwesomeIcons.rulerVertical,
          titleStyle: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          onPress: () {
            _animationController.reverse();
          },
        ),
        //Floating action menu item
        Bubble(
          title: "Money  ",
          iconColor: Colors.white,
          bubbleColor: Colors.red,
          icon: FontAwesomeIcons.dollarSign,
          titleStyle: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          onPress: () {
            widget.getMap(currencyMap);
            _animationController.reverse();
            setState(() {});
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () {
        bool x = _animationController.isCompleted;
        x ? _animationController.reverse() : _animationController.forward();

        x = !_animationController.isCompleted;
        setState(() {});
      },

      // Floating Action button Icon color
      iconColor: Colors.red,

      // Flaoting Action button Icon
      icon: AnimatedIcons.menu_arrow,
    );
  }
}
