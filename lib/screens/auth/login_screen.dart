import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';
import '../../widgets/figma_asset.dart';
import '../mobile/home_cliente_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberSession = true;
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _continue() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeClienteScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F7FD),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 64,
                child: Row(
                  children: [
                    const FigmaAsset(
                      'plane.svg',
                      size: 28,
                      color: Color(0xFF16654E),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Aerolíneas 2Torres',
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: const Color(0xFF164C3B),
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'México · ES',
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF587267),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 232,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'lib/assets/figma/costa_de_cancun.png',
                        fit: BoxFit.cover,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0xD9163E30)],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 22,
                        right: 22,
                        bottom: 22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TU PRÓXIMO DESTINO TE ESPERA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Vuelve a sentirlo.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Qué bueno verte',
                style: AppTextStyles.headlineLarge.copyWith(
                  color: const Color(0xFF173C31),
                  fontSize: 27,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Inicia sesión y lleva tus viajes contigo.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: const Color(0xFF587267),
                ),
              ),
              const SizedBox(height: 20),
              _FieldLabel(
                label: 'Usuario o correo electrónico',
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'ejemplo@email.com',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14),
                      child: FigmaAsset(
                        'user_round.svg',
                        size: 19,
                        color: Color(0xFF16654E),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _FieldLabel(
                label: 'Contraseña',
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _passwordVisible = !_passwordVisible),
                      icon: FigmaAsset(
                        'eye_off.svg',
                        size: 20,
                        color: const Color(0xFF587267),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _rememberSession,
                    onChanged: (value) =>
                        setState(() => _rememberSession = value ?? false),
                    activeColor: const Color(0xFF16654E),
                    visualDensity: VisualDensity.compact,
                  ),
                  Text(
                    'Recordarme',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF173C31),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Olvidé mi contraseña',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF16654E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 54,
                child: FilledButton.icon(
                  onPressed: _continue,
                  icon: const FigmaAsset(
                    'arrow_right.svg',
                    size: 19,
                    color: Color(0xFF173C31),
                  ),
                  label: const Text('Iniciar sesión'),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFC8E8D5),
                    foregroundColor: const Color(0xFF173C31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 14, color: Color(0xFF587267)),
                    children: [
                      TextSpan(text: '¿Es tu primera vez?  '),
                      TextSpan(
                        text: 'Crea una cuenta',
                        style: TextStyle(
                          color: Color(0xFF16654E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FigmaAsset(
                    'shield_check.svg',
                    size: 15,
                    color: Color(0xFF587267),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Tus datos viajan seguros con nosotros.',
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF587267),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(color: const Color(0xFF587267)),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
