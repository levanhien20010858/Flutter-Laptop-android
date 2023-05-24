import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Pages/AccountPage.dart';
import 'package:flutter_application_3/Pages/FavoritePage.dart';

import 'CartPage.dart';
import 'HomePage.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoritePage(),
        ),
      );
    } else if (index == 2) {
      if (ModalRoute.of(context)?.settings.name == '/') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPage(),
          ),
        );
      }
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 69,
        title: Text(
          'Danh sách đơn hàng',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red, // Đặt màu của mũi tên quay lại
          size: 24,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.cart,
                      color: Colors.red,
                    ),
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [],
      ),
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
        currentIndex: 2,
      ),
    );
  }
}
