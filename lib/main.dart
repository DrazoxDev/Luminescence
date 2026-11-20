import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:luminescence/AppStyle.dart';
import 'package:luminescence/Collections/CollectionView.dart';
import 'package:luminescence/Combat/FightFirstPage.dart';
import 'package:luminescence/Gacha/GachaPage.dart';
import 'package:luminescence/Missions/QuestsPage.dart';
import 'package:luminescence/User/ProfilPage.dart';
import 'package:luminescence/User/SettingsPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// void main() {
//   runApp(const MainApp());
// }
Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hcipjhebepaaeqxordxj.supabase.co',
    publishableKey: 'sb_publishable_nqIJ_feh-ZZ-KTqXMktykQ_vaP1uY0K',
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define named routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cards': (context) => Collectionview(),
        '/profil': (context) => Profilpage(),
        '/gacha': (context) => Gachapage(),
        '/settings': (context) => Settingspage(),
        '/quests': (context) => Questspage(),
        '/fights': (context) => Fightfirstpage(),


      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: LayoutGrid(
            areas: '''
              cards   cards   cards   profil  profil
              gacha   gacha   fight   fight   fight
              gacha   gacha   fight   fight   fight
              quests  quests  quests  quests  param
            ''',
            columnSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
            rowSizes: [1.fr, 1.fr, 1.fr, 1.fr],
            columnGap: 10,
            rowGap: 10,
            children: [
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Text('Invoquer une carte', style: Appstyle.menuTitre),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/gacha');
                  print("Tapped on Gacha");
                },
              ).inGridArea('gacha'),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: Text('Participer à un combat', style: Appstyle.menuTitre),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/fights');
                  print("Tapped on Fight");
                },
              ).inGridArea('fight'),

              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Text('Visionner les missions', style: Appstyle.menuTitre),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/quests');
                  print("Tapped on Quest");
                },
              ).inGridArea('quests'),

              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                  ),
                  child: Text('Voir sa collection de carte', style: Appstyle.menuTitre),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/cards');
                  print("Tapped on Cards");
                },
              ).inGridArea('cards'),

              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Text('Consulter son profil', style: Appstyle.menuTitre),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/profil');
                  print("Tapped on Profil");
                },
              ).inGridArea('profil'),

              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pink,
                  ),
                  child: Text('Consulter ses paramètres', style: Appstyle.menuTitre),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                  print("Tapped on Settings");
                },
              ).inGridArea('param'),
            ],
          ),
        ),
      ),
    );
  }
}
