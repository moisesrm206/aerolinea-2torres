import 'package:flutter/material.dart';

import '../../styles/dark/dark_colors.dart';
import '../../widgets/figma_asset.dart';

class GestionVuelosScreen extends StatefulWidget {
  const GestionVuelosScreen({super.key});

  @override
  State<GestionVuelosScreen> createState() => _GestionVuelosScreenState();
}

class _GestionVuelosScreenState extends State<GestionVuelosScreen> {
  String _selectedFilter = 'Todos los estados';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 56,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PageHeader(
                      onCreateSchedule: () =>
                          _showMessage('Nuevo horario de vuelo'),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 320, child: _OperationsSummary()),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _FlightList(
                            selectedFilter: _selectedFilter,
                            onFilterChanged: (value) {
                              setState(() => _selectedFilter = value);
                            },
                            onAction: _showMessage,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({required this.onCreateSchedule});

  final VoidCallback onCreateSchedule;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gestión de vuelos',
                style: TextStyle(
                  color: DarkColors.text,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  height: 1.28,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Aerolineas 2Torres · Centro de operaciones',
                style: TextStyle(
                  color: DarkColors.muted,
                  fontSize: 14,
                  height: 1.28,
                ),
              ),
            ],
          ),
        ),
        _HeaderIconButton(
          icon: const FigmaAsset('bell', size: 22),
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        FilledButton.icon(
          onPressed: onCreateSchedule,
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Crear horario de vuelo'),
          style: FilledButton.styleFrom(
            backgroundColor: DarkColors.primary,
            foregroundColor: const Color(0xFF08252D),
            minimumSize: const Size(206, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.icon, required this.onPressed});

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        style: IconButton.styleFrom(
          backgroundColor: DarkColors.surface,
          side: const BorderSide(color: DarkColors.border),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}

class _OperationsSummary extends StatelessWidget {
  const _OperationsSummary();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DarkColors.surface,
        border: Border.all(color: DarkColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _DateSelector(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: DarkColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'En tiempo real',
                      style: TextStyle(
                        color: DarkColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Actualizado 09:41',
                  style: TextStyle(color: DarkColors.muted, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const _StatusSummary(),
          ],
        ),
      ),
    );
  }
}

class _DateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: DarkColors.surface,
        border: Border.all(color: DarkColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const FigmaAsset(
            'calendar_days',
            size: 18,
            color: DarkColors.primary,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Hoy, 18 nov 2026',
              style: TextStyle(
                color: DarkColors.text,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 18, color: DarkColors.primary),
        ],
      ),
    );
  }
}

class _StatusSummary extends StatelessWidget {
  const _StatusSummary();

  static const _statuses = [
    ('1', 'Programados', DarkColors.primary),
    ('1', 'Retrasados', Color(0xFFF6C66F)),
    ('1', 'Cancelados', Color(0xFFFFACB1)),
    ('1', 'Salidos', Color(0xFF9DC6FF)),
    ('1', 'Llegados', Color(0xFFC7B6EF)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: DarkColors.surface,
        border: Border.all(color: DarkColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          for (final status in _statuses)
            Expanded(
              child: Column(
                children: [
                  Text(
                    status.$1,
                    style: TextStyle(
                      color: status.$3,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status.$2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: status.$3, fontSize: 10),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _FlightList extends StatelessWidget {
  const _FlightList({
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onAction,
  });

  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<String> onAction;

  static const _flights = [
    FlightData(
      number: 'AE 204',
      status: 'Programado',
      statusColor: DarkColors.primary,
      statusIcon: 'calendar_days',
      route: 'MEX → CUN',
      times: '10:30 → 13:45',
      cities: 'Ciudad de México · Cancún',
      note: 'Salida y llegada previstas · Puerta 12',
      aircraft: 'Aeronave pendiente',
      crew: 'Equipo 04 · 2 pilotos + 4 TCP',
      aircraftPending: true,
      editable: true,
    ),
    FlightData(
      number: 'AE 318',
      status: 'Retrasado',
      statusColor: Color(0xFFF6C66F),
      statusIcon: 'schedule',
      route: 'MEX → MTY',
      times: '10:00 → 11:40',
      cities: 'Ciudad de México · Monterrey',
      note: 'Antes 09:15 → 10:55 · +45 min · Revisión técnica',
      aircraft: 'A320 · XA-AEM',
      crew: 'Equipo pendiente',
      aircraftPending: false,
      editable: true,
    ),
    FlightData(
      number: 'AE 126',
      status: 'Cancelado',
      statusColor: Color(0xFFFFACB1),
      statusIcon: 'cancel',
      route: 'MEX → GDL',
      times: '11:15 → 12:35',
      cities: 'Ciudad de México · Guadalajara',
      note: 'Horario cancelado · Meteorología en destino',
      aircraft: 'Aeronave y tripulación liberadas',
      crew: '',
      aircraftPending: false,
      editable: false,
    ),
    FlightData(
      number: 'AE 410',
      status: 'Salido',
      statusColor: Color(0xFF9DC6FF),
      statusIcon: 'flight_takeoff',
      route: 'MEX → MID',
      times: '08:50 → 10:45',
      cities: 'Ciudad de México · Mérida',
      note: 'Salida real 08:52 · Llegada estimada 10:47',
      aircraft: 'A320 · XA-AEN',
      crew: 'Equipo 07 · 2 pilotos + 4 TCP',
      aircraftPending: false,
      editable: false,
    ),
    FlightData(
      number: 'AE 101',
      status: 'Llegado',
      statusColor: Color(0xFFC7B6EF),
      statusIcon: 'flight_land',
      route: 'GDL → MEX',
      times: '07:20 → 08:40',
      cities: 'Guadalajara · Ciudad de México',
      note: 'Llegada real 08:36 · En posición 24',
      aircraft: 'A320 · XA-AEP',
      crew: 'Equipo 02 · 2 pilotos + 4 TCP',
      aircraftPending: false,
      editable: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Vuelos de hoy · 5',
                style: TextStyle(
                  color: DarkColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            PopupMenuButton<String>(
              initialValue: selectedFilter,
              onSelected: onFilterChanged,
              color: DarkColors.surface,
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 'Todos los estados',
                  child: Text('Todos los estados'),
                ),
                PopupMenuItem(value: 'Programado', child: Text('Programado')),
                PopupMenuItem(value: 'Retrasado', child: Text('Retrasado')),
                PopupMenuItem(value: 'Cancelado', child: Text('Cancelado')),
              ],
              child: Row(
                children: [
                  Text(
                    selectedFilter,
                    style: const TextStyle(
                      color: DarkColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: DarkColors.primary,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Salida → llegada · Horas locales de cada aeropuerto',
          style: TextStyle(color: DarkColors.muted, fontSize: 11),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final flight in _flights)
              if (selectedFilter == 'Todos los estados' ||
                  flight.status == selectedFilter)
                _FlightCard(flight: flight, onAction: onAction),
          ],
        ),
      ],
    );
  }
}

class FlightData {
  const FlightData({
    required this.number,
    required this.status,
    required this.statusColor,
    required this.statusIcon,
    required this.route,
    required this.times,
    required this.cities,
    required this.note,
    required this.aircraft,
    required this.crew,
    required this.aircraftPending,
    required this.editable,
  });

  final String number;
  final String status;
  final Color statusColor;
  final String statusIcon;
  final String route;
  final String times;
  final String cities;
  final String note;
  final String aircraft;
  final String crew;
  final bool aircraftPending;
  final bool editable;
}

class _FlightCard extends StatelessWidget {
  const _FlightCard({required this.flight, required this.onAction});

  final FlightData flight;
  final ValueChanged<String> onAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DarkColors.surface,
          border: Border.all(color: DarkColors.border),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      flight.number,
                      style: const TextStyle(
                        color: DarkColors.text,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _StatusChip(flight: flight),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    flight.route,
                    style: const TextStyle(
                      color: DarkColors.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    flight.times,
                    style: const TextStyle(
                      color: DarkColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                flight.cities,
                style: const TextStyle(color: DarkColors.muted, fontSize: 11),
              ),
              const SizedBox(height: 4),
              Text(
                flight.note,
                style: const TextStyle(
                  color: DarkColors.muted,
                  fontSize: 11,
                  height: 1.28,
                ),
              ),
              const SizedBox(height: 12),
              const Divider(height: 1, color: Color(0xFF34465E)),
              const SizedBox(height: 8),
              if (flight.editable) ...[
                _ResourceRow(
                  icon: Icons.flight,
                  label: flight.aircraft,
                  color: flight.aircraftPending
                      ? const Color(0xFFF6C66F)
                      : DarkColors.muted,
                  action: flight.aircraftPending ? 'Asignar' : 'Cambiar',
                  onPressed: () =>
                      onAction('${flight.aircraft} · ${flight.number}'),
                ),
                _ResourceRow(
                  icon: Icons.people_outline,
                  label: flight.crew,
                  color: DarkColors.muted,
                  action: flight.crew == 'Equipo pendiente'
                      ? 'Asignar'
                      : 'Cambiar',
                  onPressed: () =>
                      onAction('${flight.crew} · ${flight.number}'),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.edit_outlined,
                        label: 'Modificar horario',
                        onPressed: () => onAction('Modificar ${flight.number}'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.delete_outline,
                        label: 'Eliminar horario',
                        color: const Color(0xFFFFACB1),
                        onPressed: () => onAction('Eliminar ${flight.number}'),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                _ResourceRow(
                  icon: Icons.flight,
                  label: flight.aircraft,
                  color: DarkColors.muted,
                ),
                if (flight.crew.isNotEmpty)
                  _ResourceRow(
                    icon: Icons.people_outline,
                    label: flight.crew,
                    color: DarkColors.muted,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.flight});

  final FlightData flight;

  @override
  Widget build(BuildContext context) {
    final background = Color.alphaBlend(
      flight.statusColor.withValues(alpha: 0.12),
      DarkColors.surface,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_statusIcon, size: 12, color: flight.statusColor),
          const SizedBox(width: 5),
          Text(
            flight.status,
            style: TextStyle(
              color: flight.statusColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  IconData get _statusIcon {
    switch (flight.statusIcon) {
      case 'schedule':
        return Icons.schedule;
      case 'cancel':
        return Icons.cancel_outlined;
      case 'flight_takeoff':
        return Icons.flight_takeoff;
      case 'flight_land':
        return Icons.flight_land;
      default:
        return Icons.calendar_today_outlined;
    }
  }
}

class _ResourceRow extends StatelessWidget {
  const _ResourceRow({
    required this.icon,
    required this.label,
    required this.color,
    this.action,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final String? action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: color == const Color(0xFFF6C66F)
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ),
          if (action != null)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF1B3047),
                foregroundColor: DarkColors.primary,
                minimumSize: const Size(0, 32),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: Text(action!),
            ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = DarkColors.primary,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: const BorderSide(color: Color(0xFF34465E)),
        minimumSize: const Size(0, 40),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }
}
