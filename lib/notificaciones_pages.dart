import 'package:flutter/material.dart';

class NotificacionesPage extends StatelessWidget {
  const NotificacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
          // Botón de regreso (flecha a la izquierda)
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior (HomePage)
          },
        ),
        title: const Text(
          "PriceQR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          // Ícono de perfil en la esquina derecha
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),

      // Cuerpo principal
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la sección
            const Text(
              "Notificaciones",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _buildNotificationCard(
              icon: Icons.pan_tool,
              vendedor: "Vendedor 1",
              precio: "\$1000",
            ),

            const SizedBox(height: 12),

            _buildNotificationCard(
              icon: Icons.local_drink,
              vendedor: "Vendedor 2",
              precio: "\$3500",
            ),

            const SizedBox(height: 12),

            _buildNotificationCard(
              icon: Icons.fastfood,
              vendedor: "Vendedor 3",
              promocion: "2x1 en hamburguesas",
              precio: "\$20.000",
            ),
          ],
        ),
      ),
    );
  }

  /// Widget reutilizable que construye una tarjeta de notificación
  /// Recibe:
  /// - [icon]: Icono que representa el producto/acción
  /// - [vendedor]: Nombre del vendedor
  /// - [precio]: Precio del producto
  /// - [promocion]: Texto opcional que muestra alguna oferta especial
  Widget _buildNotificationCard({
    required IconData icon,
    required String vendedor,
    required String precio,
    String? promocion,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Bordes redondeados
      ),
      child: ListTile(
        leading: Icon(icon, size: 30), // ícono a la izquierda
        title: Text(vendedor), 
        subtitle: promocion != null ? Text(promocion) : null, 
        trailing: Text(
          precio, 
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}