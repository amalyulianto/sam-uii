import 'package:flutter/material.dart';

import '../theme.dart';

class IsiAduanCard extends StatelessWidget {
  final String title;
  final String content;
  final String createdAt;

  const IsiAduanCard({Key key, this.title, this.content, this.createdAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 16,
      ),
      margin: EdgeInsets.only(bottom: 16, right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textSubtitle.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                createdAt,
                style: textMain.copyWith(
                  color: Colors.black87,
                  fontSize: 10,
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(content),
        ],
      ),
    );
  }
}
