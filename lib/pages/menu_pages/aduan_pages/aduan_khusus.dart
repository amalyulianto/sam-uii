import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/models/user_model.dart';
import 'package:sam_uii/pages/menu_pages/aduan_pages/isi_aduan_page.dart';
import 'package:sam_uii/providers/auth_provider.dart';
import 'package:sam_uii/providers/complaint_provider.dart';
import '../../../widgets/aduan_card.dart';
import '../../../widgets/daftar_aduan_button.dart';

import '../../../theme.dart';

class AduanKhusus extends StatelessWidget {
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
            'Aduan Khusus',
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
            'Daftar Aduan Khusus',
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
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DaftarAduanButton(
                text: 'Bullying',
                onTap: () async {
                  await loadCopmlaints(
                    context,
                    user.authToken,
                    '6',
                  );
                },
              ),
              DaftarAduanButton(
                text: 'Kekerasan Fisik',
                onTap: () async {
                  await loadCopmlaints(
                    context,
                    user.authToken,
                    '8',
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DaftarAduanButton(
                text: 'Kekerasan Seksual',
                onTap: () async {
                  await loadCopmlaints(
                    context,
                    user.authToken,
                    '9',
                  );
                },
              ),
              DaftarAduanButton(
                text: 'Ujaran Kebencian dan SARA',
                onTap: () async {
                  await loadCopmlaints(
                    context,
                    user.authToken,
                    '10',
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
