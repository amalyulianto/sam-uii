import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String content;
  final String createdAt;
  final String image;

  const NewsTile(
      {Key key,
      @required this.title,
      @required this.content,
      @required this.createdAt,
      @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'").parse(createdAt);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy\nhh:mm a');
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black54),
        // borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 16,
      ),
      margin: EdgeInsets.only(
        bottom: 10,
        // right: 12,
        // left: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textSubtitle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                outputDate,
                textAlign: TextAlign.center,
                maxLines: 2,
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
          Center(
            child: Image.network(
              image == null
                  ? 'https://lh3.googleusercontent.com//J6_coFbogxhRI9iM864NL_liGXvsQp2AupsKei7z0cNNfDvGUmWUy20nuUhkREQyrpY4bEeIBuc=rj-w300-h300-l95-c0xffffff'
                  : image,
              height: 200,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            content,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
