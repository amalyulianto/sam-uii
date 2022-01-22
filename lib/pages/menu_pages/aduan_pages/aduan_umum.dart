import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/models/user_model.dart';
import 'package:sam_uii/providers/auth_provider.dart';
import 'package:sam_uii/providers/complaint_provider.dart';
import '../../../pages/menu_pages/aduan_pages/isi_aduan_page.dart';
import '../../../widgets/aduan_card.dart';
import '../../../widgets/daftar_aduan_icon.dart';

import '../../../theme.dart';

class AduanUmum extends StatelessWidget {
  loadCopmlaints(
    BuildContext context,
    String token,
    String id,
  ) async {
    await Provider.of<ComplaintProvider>(context, listen: false)
        .getComplaints(token, id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IsiAduanPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return ListView(
      children: [
        SizedBox(
          height: 12,
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/icon_aduan.png',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Center(
          child: Text(
            'Aduan Umum',
            style: textMain.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Highlight Aduan',
            style: textMain.copyWith(
              color: Colors.white,
              fontSize: 16,
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
              AduanCard(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Daftar Aduan Umum',
            style: textMain.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DaftarAduanIcon(
                  text: 'Key-In',
                  onTap: () async {
                    await loadCopmlaints(
                      context,
                      user.authToken,
                      '3',
                    );
                  }),
              DaftarAduanIcon(
                  text: 'SPP',
                  onTap: () async {
                    await loadCopmlaints(
                      context,
                      user.authToken,
                      '4',
                    );
                  }),
              DaftarAduanIcon(
                  text: 'KKN',
                  onTap: () async {
                    await loadCopmlaints(
                      context,
                      user.authToken,
                      '5',
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
