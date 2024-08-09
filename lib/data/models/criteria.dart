class Criteria {
  final String type;
  final String text;
  final Map<String, dynamic>? variable;

  Criteria({required this.type, required this.text, this.variable});

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return Criteria(
      type: json['type'],
      text: json['text'],
      variable: json['variable'],
    );
  }
}
