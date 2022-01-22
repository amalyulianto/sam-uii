import 'package:flutter/material.dart';

import '../theme.dart';

class AduanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: 300,
        height: 145,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text(
              'Aduan SPP',
              style: textMain.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Isi singkat dari aduan tersebut. akan diambil dari aduan yang paling sering muncul/terjadi.',
              textAlign: TextAlign.center,
              style: textMain,
              maxLines: 4,
            )
          ],
        ),
      ),
    );
  }
}
