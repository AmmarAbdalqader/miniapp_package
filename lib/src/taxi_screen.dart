import 'package:flutter/material.dart';

class TaxiAppWidget extends StatelessWidget {
  final String userId;

  const TaxiAppWidget({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Text(userId);
  }
}
