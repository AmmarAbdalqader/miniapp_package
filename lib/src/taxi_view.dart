import 'package:flutter/material.dart';

class TaxiView extends StatelessWidget {
  final Function(String data) onSuccess;
  const TaxiView({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => onSuccess("ammar"),
        child: ListView.separated(
          itemCount: 100,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => ListTile(
            title: Text("Title"),
            subtitle:
                Text('sub title sub title sub title sub title sub title '),
            leading: Image.asset('packages/miniapp_package/assets/logos/${index%2==0?'careem':'uber'}.png'),
          ),
        ),
      ),
    );
  }
}
