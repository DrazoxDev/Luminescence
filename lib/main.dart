import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:luminescence/Collections/CollectionView.dart';
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
                  child: Text('Invoquer une carte'),
                ),
                onTap: () {
                  print("Tapped on Cards");
                },
              ).inGridArea('gacha'),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: Text('Participer à un combat'),
                ),
                onTap: () {
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
                  child: Text('Visionner les missions'),
                ),
                onTap: () {
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
                  child: Text('Voir sa collection de carte'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/cards');
                  print("Tapped on Gacha");
                },
              ).inGridArea('cards'),

              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Text('Consulter son profil'),
                ),
                onTap: () {
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
                  child: Text('Consulter ses paramètres'),
                ),
                onTap: () {
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
