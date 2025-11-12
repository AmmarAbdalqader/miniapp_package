import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TaxiView extends StatelessWidget {
  final Function(String data) onSuccess;

  const TaxiView({super.key, required this.onSuccess});

  Future<void> requestCamera() async {
    var status = await Permission.camera.request();
    if (status.isDenied) {
      print('Camera permission denied');
      ///re-ask
      status = await Permission.camera.request();
    }
    else if (status.isPermanentlyDenied){
      bool opened = await openAppSettings();
      if (!opened) {
        print('Could not open app settings.');
      }
    }
  }

  Future<void> sendEvent() async {}

  Future<void> closeApp() async {}

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Taxi app'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: closeApp,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_, __) => const Divider(),
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (_, index) => Row(
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
                              Text("40 Mins . 3.6 KM",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  height: 1.3),
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
                        onPressed: () => onSuccess("ammar"),
                        child: Text("Choose trip"))
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: requestCamera,
              label: const Text('camera'),
              icon: const Icon(Icons.camera_alt),
            ),
          ],
        ),
        persistentFooterButtons: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: sendEvent,
                  label: const Text('Yalla!'),
                  icon: const Icon(Icons.check_circle_rounded),
                ),
              ),
            ],
          ),
        ],
      );
}
