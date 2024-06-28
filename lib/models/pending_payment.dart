Duration findDurationLeft(DateTime expiredAt) {
  var now = DateTime.now();
  var duration = expiredAt.difference(now);
  return duration;
}

class PendingPayment {
  final String id;
  final int amount;
  final Duration expiredAt;

  PendingPayment({
    required this.id,
    required this.amount,
    required this.expiredAt,
  });

  factory PendingPayment.fromJson(Map<String, dynamic> json) {
    return PendingPayment(
      id: json['_id'],
      amount: json['amount'],
      expiredAt: findDurationLeft(DateTime.parse(json['expiredAt'])),
    );
  }
}
