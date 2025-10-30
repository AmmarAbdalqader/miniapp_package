import 'package:flutter/material.dart';

class TaxiView extends StatelessWidget {
  const TaxiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 100,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => ListTile(
          title: Text("Title"),
          subtitle: Text('sub title sub title sub title sub title sub title '),
          leading: Icon(Icons.car_crash),
        ),
      ),
    );
  }
}
