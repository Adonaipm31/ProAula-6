import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QRHomePage(),
    );
  }
}

class QRHomePage extends StatelessWidget {
  const QRHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.qr_code, size: 32),
                  Text(
                    "PriceQR",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // QR CODE (usa qr_flutter)
            QrImageView(
              data: "https://example.com", // aquí va el contenido del QR
              version: QrVersions.auto,
              size: 250.0,
            ),

            const SizedBox(height: 40),

            // BOTÓN ESCANÉAME
            ElevatedButton(
              onPressed: () {
                // Aquí puedes abrir un scanner o lógica propia
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Escanéame",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}