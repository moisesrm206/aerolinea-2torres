import 'package:flutter/material.dart';

import '../../styles/app_text_styles.dart';
import '../../widgets/figma_asset.dart';
import 'remaining_views.dart';

class HomeClienteScreen extends StatefulWidget {
  const HomeClienteScreen({super.key});

  @override
  State<HomeClienteScreen> createState() => _HomeClienteScreenState();
}

class _HomeClienteScreenState extends State<HomeClienteScreen> {
  bool _roundTrip = false;

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF0B1426);
    const panel = Color(0xFF142239);
    const border = Color(0xFF315778);
    const text = Color(0xFFEDF3FA);
    const muted = Color(0xFFA5B4C8);
    const accent = Color(0xFF5DDBD3);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 66,
                      child: Row(
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hola, viajero',
                                style: TextStyle(color: muted, fontSize: 13),
                              ),
                              SizedBox(height: 3),
                              Text(
                                '¿A dónde volamos?',
                                style: TextStyle(
                                  color: text,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: panel,
                              shape: BoxShape.circle,
                              border: Border.all(color: border),
                            ),
                            child: const Center(
                              child: FigmaAsset(
                                'bell.svg',
                                size: 22,
                                color: text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _SearchCard(
                      panel: panel,
                      border: border,
                      text: text,
                      muted: muted,
                      accent: accent,
                      roundTrip: _roundTrip,
                      onRoundTripChanged: (value) =>
                          setState(() => _roundTrip = value),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Un cambio de aire',
                          style: TextStyle(
                            color: text,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Ver destinos',
                          style: TextStyle(
                            color: accent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 178,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'lib/assets/figma/mar_caribe.png',
                              fit: BoxFit.cover,
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Color(0xCC0B1426),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 20,
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'EL CARIBE TE LLAMA',
                                    style: TextStyle(
                                      color: muted,
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Cancún, a tu ritmo',
                                    style: TextStyle(
                                      color: text,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Playas infinitas. Nuevas historias.',
                                    style: TextStyle(color: text, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const FigmaAsset(
                          'headset.svg',
                          size: 20,
                          color: accent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Estamos contigo antes, durante y después.',
                          style: AppTextStyles.caption.copyWith(color: muted),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _BottomNavigation(
              onItemSelected: (index) {
                if (index == 0) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DesignCatalogScreen(
                      theme: index == 2 ? DesignTheme.dark : DesignTheme.light,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({
    required this.panel,
    required this.border,
    required this.text,
    required this.muted,
    required this.accent,
    required this.roundTrip,
    required this.onRoundTripChanged,
  });

  final Color panel;
  final Color border;
  final Color text;
  final Color muted;
  final Color accent;
  final bool roundTrip;
  final ValueChanged<bool> onRoundTripChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _TripOption(
                    label: 'Solo ida',
                    selected: !roundTrip,
                    color: accent,
                    onTap: () => onRoundTripChanged(false),
                  ),
                ),
                Expanded(
                  child: _TripOption(
                    label: 'Ida y vuelta',
                    selected: roundTrip,
                    color: accent,
                    onTap: () => onRoundTripChanged(true),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _RouteField(
            label: 'Origen',
            value: 'Ciudad de México · MEX',
            icon: 'plane_takeoff.svg',
            text: text,
            muted: muted,
          ),
          const SizedBox(height: 12),
          _RouteField(
            label: 'Destino',
            value: 'Cancún · CUN',
            icon: 'plane_landing.svg',
            text: text,
            muted: muted,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _InfoField(
                  label: 'Salida',
                  value: '18 nov 2026',
                  icon: 'calendar_days.svg',
                  text: text,
                  muted: muted,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoField(
                  label: 'Pasajeros',
                  value: '1 adulto',
                  icon: 'user_round.svg',
                  text: text,
                  muted: muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Color(0xFF08252D)),
              label: const Text('Buscar vuelos'),
              style: FilledButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: const Color(0xFF08252D),
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
        ],
      ),
    );
  }
}

class _TripOption extends StatelessWidget {
  const _TripOption({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFF08252D) : const Color(0xFFA5B4C8),
            fontSize: 13,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _RouteField extends StatelessWidget {
  const _RouteField({
    required this.label,
    required this.value,
    required this.icon,
    required this.text,
    required this.muted,
  });
  final String label;
  final String value;
  final String icon;
  final Color text;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: muted, fontSize: 12)),
        const SizedBox(height: 6),
        Container(
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              FigmaAsset(icon, size: 19, color: const Color(0xFF5DDBD3)),
              const SizedBox(width: 12),
              Text(value, style: TextStyle(color: text, fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoField extends StatelessWidget {
  const _InfoField({
    required this.label,
    required this.value,
    required this.icon,
    required this.text,
    required this.muted,
  });
  final String label;
  final String value;
  final String icon;
  final Color text;
  final Color muted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: muted, fontSize: 12)),
        const SizedBox(height: 5),
        Row(
          children: [
            FigmaAsset(icon, size: 20, color: const Color(0xFF5DDBD3)),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                value,
                style: TextStyle(
                  color: text,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({required this.onItemSelected});

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    const muted = Color(0xFFA5B4C8);
    const text = Color(0xFFEDF3FA);
    const accent = Color(0xFF5DDBD3);
    const panel = Color(0xFF142239);
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: panel,
        border: Border(top: BorderSide(color: Color(0xFF34465E))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            label: 'Inicio',
            icon: 'home.svg',
            selected: true,
            accent: accent,
            text: text,
            muted: muted,
            onTap: () => onItemSelected(0),
          ),
          _NavItem(
            label: 'Mis vuelos',
            icon: 'tickets_plane.svg',
            accent: accent,
            text: text,
            muted: muted,
            onTap: () => onItemSelected(1),
          ),
          _NavItem(
            label: 'Actividad',
            icon: 'chart.svg',
            accent: accent,
            text: text,
            muted: muted,
            onTap: () => onItemSelected(2),
          ),
          _NavItem(
            label: 'Perfil',
            icon: 'user_round.svg',
            accent: accent,
            text: text,
            muted: muted,
            onTap: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.accent,
    required this.text,
    required this.muted,
    required this.onTap,
    this.selected = false,
  });
  final String label;
  final String icon;
  final Color accent;
  final Color text;
  final Color muted;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? accent : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: FigmaAsset(
                icon,
                size: 21,
                color: selected ? const Color(0xFF08252D) : muted,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? text : muted,
                fontSize: 11,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
