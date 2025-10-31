class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
