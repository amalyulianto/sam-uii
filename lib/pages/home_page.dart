import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/providers/response_provider.dart';
import '../models/user_model.dart';
import '../pages/menu_pages/aduan_pages/aduan_page.dart';
import '../pages/menu_pages/aduan_pages/evaluasi_aduan_page.dart';
import '../pages/menu_pages/info_lem_page.dart';
import '../pages/menu_pages/papan_informasi.dart';
import '../pages/notification_page.dart';
import '../pages/profile_page.dart';
import '../providers/auth_provider.dart';
import '../providers/news_provider.dart';
import '../widgets/aduan_card.dart';
import '../widgets/button_grid.dart';
import '../widgets/highlight_widget.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          title: Text(
            'Home',
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan',
                      style: textMain.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        ButtonGrid(
                          onTap: () async {
                            await Provider.of<NewsProvider>(context,
                                    listen: false)
                                .getInfoLem(user.authToken);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoLemPage(),
                              ),
                            );
                          },
                          text: 'Info LEM UII',
                        ),
                        Spacer(),
                        ButtonGrid(
                          onTap: () async {
                            await Provider.of<NewsProvider>(context,
                                    listen: false)
                                .getPapanInformasi(user.authToken);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PapanInformasiPage(),
                              ),
                            );
                          },
                          text: 'Papan Informasi',
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        ButtonGrid(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AduanPage(),
                              ),
                            );
                          },
                          text: 'Aduan',
                        ),
                        Spacer(),
                        ButtonGrid(
                          onTap: () async {
                            await Provider.of<ResponseProvider>(context,
                                    listen: false)
                                .getResponses(user.authToken);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EvaluasiAduanPage(),
                              ),
                            );
                          },
                          text: 'Evaluasi Aduan',
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Highlight Informasi',
                  style: textMain.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    HighlightWidget(),
                    HighlightWidget(),
                    HighlightWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Fun Fact UII',
                  style: textMain.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              AduanCard(),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
