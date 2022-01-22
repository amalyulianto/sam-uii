import 'package:flutter/material.dart';

import '../theme.dart';

class NotificationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      // width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.mail_outlined,
                color: kColorYellow,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mau asah skill dalam berorganisasi?',
                      style: textSubtitle.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '[Open Recruitment] yok asah skill kalian, dengan mengikuti Trial Adhikari UII',
                      // overflow: TextOverflow.,
                      style: textMain.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.white38,
          ),
        ],
      ),
    );
  }
}
