import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/models/user_model.dart';
import 'package:sam_uii/providers/auth_provider.dart';
import 'package:sam_uii/providers/news_provider.dart';
import '../../widgets/category_button.dart';
import '../../widgets/news_tile.dart';

import '../../theme.dart';
import '../empty_state.dart';
import '../notification_page.dart';

class PapanInformasiPage extends StatefulWidget {
  @override
  _PapanInformasiPageState createState() => _PapanInformasiPageState();
}

class _PapanInformasiPageState extends State<PapanInformasiPage> {
  @override
  Widget build(BuildContext context) {
    NewsProvider newsProvider = Provider.of<NewsProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,

          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          title: Text(
            'Papan Informasi',
            style: textMain.copyWith(color: Colors.black),
          ),
          // automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ));
              },
            ),
          ],
        ),
        backgroundColor: kColorGradient1,
        body: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<NewsProvider>(context, listen: false)
                .getInfoLem(user.authToken);
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      CategoryButton(
                        text: 'All',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryButton(
                        text: 'Webinar',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryButton(
                        text: 'Berita',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryButton(
                        text: 'Expo',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CategoryButton(
                        text: 'Beasiswa',
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                newsProvider.papanInformasi.length != 0
                    ? Column(
                        children: newsProvider.papanInformasi
                            .map(
                              (news) => NewsTile(
                                title: news.title,
                                content: news.content,
                                createdAt: news.createdAt.toString(),
                                image:
                                    news.image != null ? news.image.url : null,
                              ),
                            )
                            .toList())
                    : EmptyState(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
