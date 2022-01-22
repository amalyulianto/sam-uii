import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/providers/response_provider.dart';
import 'package:sam_uii/widgets/response_card.dart';
import '../../../theme.dart';
import '../../../widgets/news_tile.dart';
import '../../empty_state.dart';

class EvaluasiAduanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponseProvider responseProvider = Provider.of<ResponseProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,

          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          title: Text(
            'Evaluasi Aduan',
            style: textMain.copyWith(color: Colors.black),
          ),
        ),
        backgroundColor: kColorGradient1,
        body: responseProvider.responses.length != 0
            ? ListView(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                      children: responseProvider.responses
                          .map(
                            (news) => ResponseCard(
                              title: news.title,
                              content: news.content,
                              createdAt: news.createdAt.toString(),
                              imageUrl: news.imageUrl,
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
