import 'package:flutter/material.dart';
import '../cliente/home_cliente_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _correoCtrl = TextEditingController(text: 'cliente@2torres.com');
  final _passCtrl = TextEditingController(text: '123456');
  String _rolSeleccionado = 'cliente';

  void _entrar() {
    if (_rolSeleccionado == 'cliente') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeClienteScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vista de $_rolSeleccionado lista para construir'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 36,
                        backgroundColor: Color(0xFFE3F2FD),
                        child: Icon(Icons.flight_takeoff,
                            size: 40, color: Color(0xFF0D47A1)),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Aerolíneas 2Torres',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      const Text(
                        'Sistema Integral de Gestión Aérea',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 24),
                      SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(
                              value: 'cliente',
                              label: Text('Cliente'),
                              icon: Icon(Icons.person)),
                          ButtonSegment(
                              value: 'empleado',
                              label: Text('Staff'),
                              icon: Icon(Icons.badge)),
                          ButtonSegment(
                              value: 'admin',
                              label: Text('Admin'),
                              icon: Icon(Icons.admin_panel_settings)),
                        ],
                        selected: {_rolSeleccionado},
                        onSelectionChanged: (val) {
                          setState(() => _rolSeleccionado = val.first);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _correoCtrl,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: _entrar,
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Ingresar al Sistema',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}