import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Pages/FavoritePage.dart';
import 'package:flutter_application_3/Pages/OrderPage.dart';
import 'package:flutter_application_3/widgets/getuserdetails.dart';

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

  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  /// get DocIDs
  Future<List<String>> getDocIDs() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    List<String> docIDs = [];
    snapshot.docs.forEach((document) {
      String docID = document.reference.id;
      if (!docIDs.contains(docID)) {
        docIDs.add(docID);
      }
    });
    return docIDs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed In as " + user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurpleAccent[200],
              child: Text(
                "Đăng xuất",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: getDocIDs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Đã xảy ra lỗi');
                  } else {
                    List<String> docIDs = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: GetUserName(documentId: docIDs[index]),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
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
        currentIndex: 3,
      ),
    );
  }
}
