class GameCardData {
  const GameCardData({
    required this.name,
    required this.attack,
    required this.life,
    required this.rarity,
    required this.description,
  });

  final String name;
  final int attack;
  final int life;
  final int rarity;
  final String description;

  factory GameCardData.fromMap(Map<String, dynamic> row) {
    return GameCardData(
      name: _requiredString(row, 'name'),
      attack: _requiredInt(row, 'attack'),
      life: _requiredInt(row, 'life'),
      rarity: _requiredInt(row, 'rarity'),
      description: _requiredString(row, 'description'),
    );
  }

  static String _requiredString(Map<String, dynamic> row, String column) {
    final value = row[column];
    if (value is String) return value;
    throw FormatException('La colonne "$column" doit contenir du texte.');
  }

  static int _requiredInt(Map<String, dynamic> row, String column) {
    final value = row[column];
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) {
      final parsed = int.tryParse(value);
      if (parsed != null) return parsed;
    }
    throw FormatException('La colonne "$column" doit contenir un entier.');
  }
}
