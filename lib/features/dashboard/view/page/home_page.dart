import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        onTap:(index)=>setState(()=>index = _currentIndex),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize),
            label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business),
            label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
            label: ""
          )
        ],
      ),
    );
  }
}
