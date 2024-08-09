class TradingSignal {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<dynamic> criteria;

  TradingSignal({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory TradingSignal.fromJson(Map<String, dynamic> json) {
    return TradingSignal(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: json['criteria'],
    );
  }
}
