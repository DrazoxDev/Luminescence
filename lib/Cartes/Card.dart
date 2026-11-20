import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Text(
                "Attaque : 10 Vie : 10",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 150,
              height: 200,
              child: Image(
                image: NetworkImage(
                  "https://thumbs.dreamstime.com/b/dessin-anim%C3%A9-en-noir-et-blanc-du-monstre-mal-art-de-mauvais-264453832.jpg",
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Text(
                    "Ceci est la description de la carte car la carte est stylé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
