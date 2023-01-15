import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/screen/favorite_list_screen.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: padding, top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  'images/icons/menu_bar.svg',
                  height: 32,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: padding, top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoriteListScreen(),
                          ));
                    },
                    icon: Icon(Icons.favorite_outline)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Simple way to find \nTasty food',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
