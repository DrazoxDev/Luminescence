import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Cartes/Card.dart' as game_cards;
import '../Cartes/card_data.dart';

class CardsTestPage extends StatefulWidget {
  const CardsTestPage({super.key});

  @override
  State<CardsTestPage> createState() => _CardsTestPageState();
}

class _CardsTestPageState extends State<CardsTestPage> {
  late Future<List<GameCardData>> _cardsFuture;

  @override
  void initState() {
    super.initState();
    _cardsFuture = _loadCards();
  }

  Future<List<GameCardData>> _loadCards() async {
    final rows = await Supabase.instance.client
        .from('Card')
        .select('name, attack, life, rarity, description')
        .order('rarity')
        .limit(50);

    return rows
        .map((row) => GameCardData.fromMap(Map<String, dynamic>.from(row)))
        .toList(growable: false);
  }

  void _reloadCards() {
    setState(() {
      _cardsFuture = _loadCards();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test des cartes Supabase'),
        actions: [
          IconButton(
            onPressed: _reloadCards,
            tooltip: 'Recharger les cartes',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<GameCardData>>(
        future: _cardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 40),
                    const SizedBox(height: 12),
                    const Text(
                      'Impossible de charger les cartes depuis Supabase.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: _reloadCards,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
            );
          }

          final cards = snapshot.data!;
          if (cards.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Aucune carte visible depuis l’application. '
                  'Si la table contient des lignes, vérifie la policy SELECT '
                  'RLS pour le rôle anon.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.68,
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return game_cards.GameCard(card: cards[index]);
            },
          );
        },
      ),
    );
  }
}
