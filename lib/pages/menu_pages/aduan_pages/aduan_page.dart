import 'package:flutter/material.dart';
import '../../../pages/menu_pages/aduan_pages/add_aduan_page.dart';
import '../../../pages/menu_pages/aduan_pages/aduan_khusus.dart';
import '../../../pages/menu_pages/aduan_pages/aduan_umum.dart';

import '../../../theme.dart';

class AduanPage extends StatefulWidget {
  @override
  _AduanPageState createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
  int currentIndex = 0;

  Widget customBottomNav() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: kColorYellow,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: 'Aduan Umum',
                icon: Container(),
              ),
              BottomNavigationBarItem(
                label: 'Aduan Khusus',
                icon: Container(),
              ),
            ]),
      ),
    );
  }

  Widget addButton(int index) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddAduanPage(index: index),
          ),
        );
      },
      child: Image.asset(
        'assets/icon_add.png',
        width: 50.0,
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return AduanUmum();
      case 1:
        return AduanKhusus();

      default:
        return AduanUmum();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: addButton(currentIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        appBar: AppBar(
          backgroundColor: kColorYellow,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Aduan',
            style: textMain.copyWith(color: Colors.black),
          ),
        ),
        backgroundColor: kColorGradient1,
        body: body(),
      ),
    );
  }
}
