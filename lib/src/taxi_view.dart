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
      padding: EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) => Row(
        children: [
          Column(
            children: [
              Image.asset(
                height: 40,
                width: 40,
                fit: BoxFit.contain,
                'assets/logos/${index % 2 == 0 ? 'careem' : 'uber'}.png',
                package: 'miniapp_package',
              ),
              const SizedBox(height: 12),
              Image.asset(
                height: 80,
                width: 80,
                'assets/logos/${index % 2 == 1 ? 'sedan' : 'suv'}.png',
                package: 'miniapp_package',
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Trip type"),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    const SizedBox(width: 8),
                    Text("40 Mins . 3.6 KM", style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 13, color: Colors.black87, height: 1.3),
                    children: [
                      const TextSpan(text: 'approx '),
                      TextSpan(
                        text: '15 SR . ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const TextSpan(text: '5 mins away'),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => onSuccess("ammar"), child: Text("Choose trip"))
        ],
      ),
    ),
  );
}
