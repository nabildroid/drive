import 'package:flutter/material.dart';

import 'home/home.dart';

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);
  final _key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _key,
        initialRoute: "/",
        onGenerateRoute: (route) {
          print(route);
          if (route.name == "/") {
            return MaterialPageRoute(builder: (_) => Home());
          }
          return MaterialPageRoute(builder: (_) => Scaffold());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomBottomNavigationBar(_key),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigation;
  const CustomBottomNavigationBar(
    this.navigation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width - 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home),
          IconButton(
            icon: Icon(Icons.abc_outlined),
            onPressed: () {
              print("hello world");
              navigation.currentState?.pushNamed("/cxcx");
            },
          ),
          Icon(Icons.home),
          Icon(Icons.home),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFFC4C4C4),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
