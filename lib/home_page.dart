import 'package:animation_design_example/pos.dart';
import 'package:animation_design_example/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<Widget> _weatherPage = [];
final List<Pos> _posList = [];
Size size;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController()..addListener(_onScroll);
    for(int i = 0; i < 4; i++) {
      var newPos = Pos(i);
      _weatherPage.add(
        ChangeNotifierProvider.value(value: newPos, child: WeatherPage(),)
      );
      _posList.add(newPos);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    double pagePos = _controller.page;
    _posList[pagePos.truncate().toInt()].setPosition(pagePos);
  }

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _weatherPage,
      ),
    );
  }
}
