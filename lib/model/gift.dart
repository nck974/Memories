class Gift {
  final String name;
  final String conditions;

  Gift({
    required this.name,
    required this.conditions,
  });

  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      name: json['name'],
      conditions: json['conditions'],
    );
  }
}
