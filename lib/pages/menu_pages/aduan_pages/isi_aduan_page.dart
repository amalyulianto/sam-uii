import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/pages/empty_state.dart';
import 'package:sam_uii/providers/complaint_provider.dart';
import '../../../widgets/isi_aduan_card.dart';

import '../../../theme.dart';

class IsiAduanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ComplaintProvider complaintProvider =
        Provider.of<ComplaintProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,

          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          title: Text(
            'Aduan',
            style: textMain.copyWith(color: Colors.black),
          ),
        ),
        backgroundColor: kColorGradient1,
        body: complaintProvider.complaints.length != 0
            ? ListView(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                      children: complaintProvider.complaints
                          .map(
                            (news) => IsiAduanCard(
                              title: news.title,
                              content: news.content,
                              createdAt: news.createdAt.toString(),
                            ),
                          )
                          .toList()),
                ],
              )
            : EmptyState(),
      ),
    );
  }
}
