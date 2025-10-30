import 'package:flutter/material.dart';

class TaxiAppWidget extends StatelessWidget {
  final String userId;

  const TaxiAppWidget({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300, height: 400, color: Colors.cyan, child: Text(userId));
  }
}
