// Importa el paquete principal de Flutter para widgets y diseño de interfaces
import 'package:flutter/material.dart';

// Importa la página de notificaciones (archivo separado)
import 'notificaciones_pages.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Oculta la etiqueta "debug" en la esquina superior
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

/// Página de inicio (HomePage).
/// Se define como StatelessWidget porque la interfaz no tiene variables que cambien dinámicamente.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menú lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          children: const [
            // Encabezado del Drawer
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                "Menú",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            // Opciones del Drawer
            ListTile(title: Text("Perfil")),
            ListTile(title: Text("Configuración")),
          ],
        ),
      ),

      // Barra superior (AppBar)
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparente
        elevation: 0, // sin sombra
        iconTheme: const IconThemeData(color: Colors.black), // ícono del Drawer en negro
        actions: [
          // Botón circular de perfil en la esquina superior derecha
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFE9D7F7), // color de fondo del círculo
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {}, // acción vacía por ahora
            ),
          )
        ],
      ),

      extendBodyBehindAppBar: true, // permite que el body "suba" detrás del AppBar

      // 🔹 Cuerpo principal (Body)
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6EAFE), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Título principal
              const Text(
                "Bienvenido",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 30),

              // Botones de menú (Lugares, Platos, Eventos)
              _buildMenuButton(Icons.place, "Lugares", Colors.purple),
              const SizedBox(height: 15),
              _buildMenuButton(Icons.restaurant, "Platos Típicos", Colors.orange),
              const SizedBox(height: 15),
              _buildMenuButton(Icons.event, "Eventos", Colors.green),

              const SizedBox(height: 40),

              // Tarjeta de evento destacado
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications_active, color: Colors.deepPurple, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "🎉 Evento",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text("📍 Parque de la Ciudad", style: TextStyle(fontSize: 15)),
                          Text("📅 15/07/2024", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botón Asistente
              _bottomButton(context, Icons.chat_bubble_outline, "Asistente", Colors.purple),
              // Botón central (Escanear)
              _bottomButton(context, Icons.qr_code_scanner, "Escanear", Colors.black, isCenter: true),
              // Botón Notificaciones
              _bottomButton(context, Icons.notifications_none, "Notificaciones", Colors.pink),
            ],
          ),
        ),
      ),
    );
  }

  // Botón reutilizable del menú principal (Lugares, Platos, Eventos)
  Widget _buildMenuButton(IconData icon, String text, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, 
          foregroundColor: color, // ícono y texto con color
          elevation: 3,
          side: BorderSide(color: color, width: 1.5), // borde coloreado
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {}, // acción pendiente
        icon: Icon(icon),
        label: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /// Botones de la barra inferior
  /// - Reciben `context` para poder navegar entre páginas.
  /// - Según el `label`, realizan acciones específicas.
  Widget _bottomButton(BuildContext context, IconData icon, String label, Color color, {bool isCenter = false}) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {
          // Navega a la página de notificaciones
          if (label == "Notificaciones") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificacionesPage(),
              ),
            );
          }
        },
        icon: Icon(icon, color: color),
        label: Text(label, style: TextStyle(color: color)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}