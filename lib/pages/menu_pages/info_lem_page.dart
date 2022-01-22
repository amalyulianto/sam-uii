import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/models/user_model.dart';
import 'package:sam_uii/pages/empty_state.dart';
import 'package:sam_uii/providers/auth_provider.dart';
import '../../providers/news_provider.dart';
import '../../widgets/category_button.dart';
import '../../widgets/news_tile.dart';

import '../../theme.dart';
import '../notification_page.dart';

class InfoLemPage extends StatefulWidget {
  @override
  _InfoLemPageState createState() => _InfoLemPageState();
}

class _InfoLemPageState extends State<InfoLemPage> {
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
          title: Text(
            'Info LEM UII',
            style: textMain.copyWith(color: Colors.black),
          ),
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
          child: ListView(
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
                      text: 'Info Utama',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CategoryButton(
                      text: 'Sejarah UII',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CategoryButton(
                      text: 'Ke-UII-an',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CategoryButton(
                      text: 'Wawasan',
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
              newsProvider.infoLem.length != 0
                  ? Column(
                      children: newsProvider.infoLem
                          .map(
                            (news) => NewsTile(
                              title: news.title,
                              content: news.content,
                              createdAt: news.createdAt.toString(),
                              image: news.image != null ? news.image.url : null,
                            ),
                          )
                          .toList())
                  : EmptyState(),
            ],
          ),
        ),
      ),
    );
  }
}
