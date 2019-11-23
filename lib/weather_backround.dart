import 'dart:ui';

import 'package:animation_design_example/home_page.dart';
import 'package:animation_design_example/pos.dart';
import 'package:animation_design_example/sigma.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Consumer<Pos>(
          builder: (context, pos, child) {
            return Positioned.fill(
              child: Transform.translate(
                offset: Offset((size.width / 2) * pos.curPos, 0),
                child: Image.asset(
                  "assets/city${pos.curPage}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Consumer<Sigma>(
          builder: (context, sigma, child) {
            return Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigma.value, sigmaY: sigma.value),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
