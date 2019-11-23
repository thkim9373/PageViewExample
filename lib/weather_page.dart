import 'package:animation_design_example/home_page.dart';
import 'package:animation_design_example/sigma.dart';
import 'package:animation_design_example/weather_backround.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final double blur = 8;

class WeatherPage extends StatefulWidget {
  final Sigma _sigma = new Sigma();

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  ScrollController _controller;

  _onScrolled() {
    widget._sigma.setSigma(_controller.offset / size.height * blur);
  }

  @override
  void initState() {
    _controller = ScrollController()..addListener(_onScrolled);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ChangeNotifierProvider.value(
          value: widget._sigma,
          child: new WeatherBackground(),
        ),
        ListView(
          controller: _controller,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black26,
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "21℃",
                  textScaleFactor: 8,
                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black26,
              width: size.width,
              height: size.height * 0.75,
            )
          ],
        )
      ],
    );
  }
}
