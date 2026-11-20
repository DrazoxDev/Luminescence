import 'package:flutter/material.dart';

import 'card_data.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.card});

  final GameCardData card;

  Color get _rarityColor => switch (card.rarity) {
    1 => const Color(0xFF8A9A9A),
    2 => const Color(0xFF54A66A),
    3 => const Color(0xFF5485D6),
    4 => const Color(0xFF9A5BD0),
    _ => const Color(0xFFE0A62E),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF24233B),
            _rarityColor.withValues(alpha: 0.55),
          ],
        ),
        border: Border.all(color: _rarityColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: _rarityColor, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Rareté ${card.rarity}',
                  style: TextStyle(
                    color: _rarityColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            card.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _stat('ATTAQUE', card.attack)),
              const SizedBox(width: 8),
              Expanded(child: _stat('VIE', card.life)),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              card.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white60, fontSize: 10),
          ),
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
