import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/widgets/show_more_button.dart';

class Content extends StatelessWidget {
  final Widget child;
  const Content({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          child,
          SizedBox(
            width: 20,
          ),
          ShowMoreButton(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
