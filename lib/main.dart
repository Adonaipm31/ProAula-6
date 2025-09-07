import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PriceQRPage(),
    );
  }
}

class PriceQRPage extends StatelessWidget {
  const PriceQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "PriceQR",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person, size: 50),
              ),
              const SizedBox(height: 10),
              const Text(
                "Negocio",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Vendedor autorizado desde 2020",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Lista de productos
              const ProductTile(
                icon: Icons.shopping_bag_outlined,
                name: "Producto N.",
                price: 1000,
              ),
              const ProductTile(
                icon: Icons.egg_outlined,
                name: "Producto N.",
                price: 2000,
              ),
              const ProductTile(
                icon: Icons.restaurant_outlined,
                name: "Producto N.",
                price: 3000,
              ),
              const ProductTile(
                icon: Icons.radio_button_unchecked,
                name: "Producto N.",
                price: 4000,
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar navegación o acción
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("About me"),
                      content: Text("Esta es la sección del vendedor."),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "About me",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final int price;

  const ProductTile({
    super.key,
    required this.icon,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 12),
              Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          Text(
            "\$$price",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}