import 'package:flutter/material.dart';
import '../widgets/notification_tile.dart';

import '../theme.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,
          // centerTitle: true,
          title: Text(
            'Notifikasi',
            style: textMain.copyWith(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: kColorGradient1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
