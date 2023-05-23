import 'package:flutter/material.dart';
import 'package:flutter_application_3/Pages/FavoritePage.dart';
import 'package:flutter_application_3/Pages/OrderPage.dart';

import 'HomePage.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      // }
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoritePage(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(),
        ),
      );
    } else if (index == 3) {
      if (ModalRoute.of(context)?.settings.name == '/') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _onItemTapped(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            activeIcon: Icon(Icons.favorite_outlined),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            activeIcon: Icon(Icons.card_giftcard_outlined),
            label: "Đơn hàng",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_outline),
            label: "Tài Khoản",
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: 3,
      ),
    );
  }
}
