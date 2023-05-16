import 'package:flutter/material.dart';
import 'package:unipay/screens/payments.dart';
import 'package:unipay/screens/profile.dart';

import '../widgets/homepage_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currIndex = 0;

  final tabs = [
    const HomePageItem(),
    Payments(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFD44C66),
          title: Text(
            "ＵＮＩＰＡＹ",
            style: TextStyle(color: Colors.white),
          )),
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: tabs[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_kanban),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Profile',
          ),
        ],
        fixedColor: const Color.fromARGB(255, 255, 129, 129),
        onTap: (index) {
          setState(() {
            _currIndex = index;
          });
        },
      ),
    );
  }
}
