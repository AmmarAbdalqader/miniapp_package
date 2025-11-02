import 'package:flutter/material.dart';

class TaxiView extends StatelessWidget {
  final Function(String data) onSuccess;
  const TaxiView({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          itemCount: 100,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    height: 30,
                    width: 30,
                    'assets/logos/${index % 2 == 0 ? 'careem' : 'uber'}.png',
                    package: 'miniapp_package',
                  ),
                  const SizedBox(height: 12),
                  Image.asset(
                    height: 40,
                    width: 40,
                    'assets/logos/${index % 2 == 1 ? 'sedan' : 'suv'}.png',
                    package: 'miniapp_package',
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("Title"),
                    Text('sub title sub title sub title sub title sub title '),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => onSuccess("ammar"), child: Text("Let's Go"))
            ],
          ),
        ),
      );
}
