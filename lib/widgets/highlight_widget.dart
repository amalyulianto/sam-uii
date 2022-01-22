import 'package:flutter/material.dart';
import 'package:sam_uii/theme.dart';

class HighlightWidget extends StatelessWidget {
  const HighlightWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 190,
          height: 100,
          margin: EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          width: 190,
          child: Text('Judul Highlight Informasi',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textMain.copyWith(color: Colors.white)),
        )
      ],
    );
  }
}
