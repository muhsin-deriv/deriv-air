class Market {
  final String key;
  final String displayName;

  Market({
    required this.key,
    required this.displayName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Market &&
        other.key == key &&
        other.displayName == displayName;
  }

  @override
  int get hashCode => key.hashCode ^ displayName.hashCode;
}
