import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/constants.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      child: Icon(
        Icons.arrow_forward,
        color: primaryColor,
      ),
    );
  }
}
