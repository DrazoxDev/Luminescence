import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: Container(
        //   child: LayoutGrid(
        //     areas: '''
        //       cards   cards   cards   profil  profil
        //       gacha   gacha   fight   fight   fight
        //       gacha   gacha   fight   fight   fight
        //       quests  quests  quests  quests  param
        //     ''',
        //     columnSizes: [1.fr,1.fr,1.fr,1.fr,1.fr],
        //     rowSizes: [1.fr,1.fr,1.fr,1.fr],

        //     children: [
        //       new OutlinedButton(
        //         child: const Text('Invoquer une carte'),
        //         onPressed: () {
        //           debugPrint('Received click');
        //         },
        //       ).inGridArea('gacha'),
        //       new OutlinedButton(
        //         child: const Text('Participer à un combat'),
        //         onPressed: () {
        //           debugPrint('Received click');
        //         },
        //       ).inGridArea('fight'),
        //       new OutlinedButton(
        //         child: const Text('Visionner les missions'),
        //         onPressed: () {
        //           debugPrint('Received click');
        //         },
        //       ).inGridArea('quests'),
        //       new OutlinedButton(
        //         child: const Text('Voir sa collection de carte'),
        //         onPressed: () {
        //           debugPrint('Received click');
        //         },
        //       ).inGridArea('cards'),
        //       new OutlinedButton(
        //         child: const Text('Consulter son profil'),
        //         onPressed: () {
        //           debugPrint('Received click');
        //         },
        //       ).inGridArea('profil'),
        //       new OutlinedButton(
        //         child: const Text('Consulter ses paramètres'),
        //         onPressed: () {
        //           debugPrint('Received click');
        //         },
        //       ).inGridArea('param'),
        //     ],
        //   ),
        // )

        body: Container(
          child: LayoutGrid(
            areas: '''
              cards   cards   cards   profil  profil
              gacha   gacha   fight   fight   fight
              gacha   gacha   fight   fight   fight
              quests  quests  quests  quests  param
            ''',
            columnSizes: [1.fr,1.fr,1.fr,1.fr,1.fr],
            rowSizes: [1.fr,1.fr,1.fr,1.fr],
            
            children: [
              new Container(
                child: Text('Gacha'),
                color: Colors.green,
                alignment: Alignment.center,
              ).inGridArea('gacha'),
              new Container(
                child: Text('Gacha'),
                color: Colors.yellow,
                alignment: Alignment.center,
              ).inGridArea('fight'),
              new Container(
                child: Text('Gacha'),
                color: Colors.red,
                alignment: Alignment.center,
              ).inGridArea('quests'),
              new Container(
                child: Text('Gacha'),
                color: Colors.purple,
                alignment: Alignment.center,
              ).inGridArea('cards'),
              new Container(
                child: Text('Gacha'),
                color: Colors.blue,
                alignment: Alignment.center,
              ).inGridArea('profil'),
              new Container(
                child: Text('Gacha'),
                color: Colors.pink,
                alignment: Alignment.center,
              ).inGridArea('param'),
            ],
          ),
        )
      ),
    );
  }
}
