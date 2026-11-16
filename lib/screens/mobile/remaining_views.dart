import 'package:flutter/material.dart';

import '../../styles/dark/dark_colors.dart';
import '../../styles/light/light_colors.dart';

enum DesignTheme { light, dark }

class DesignViewSpec {
  const DesignViewSpec(this.title, this.subtitle, this.sections);

  final String title;
  final String subtitle;
  final List<String> sections;
}

const remainingDesignViews = <DesignViewSpec>[
  DesignViewSpec(
    'Resultados de vuelos',
    'Elige el horario que mejor te funciona',
    ['Fechas disponibles', 'Vuelos directos', 'Precio por adulto'],
  ),
  DesignViewSpec('Detalle de vuelo y reserva', 'MEX → CUN · 18 nov 2026', [
    'Resumen del vuelo',
    'Pasajeros',
    'Equipaje',
  ]),
  DesignViewSpec('Selección de asientos', 'Elige tu lugar a bordo', [
    'Mapa de asientos',
    'Asiento seleccionado',
    'Resumen',
  ]),
  DesignViewSpec('Reserva confirmada', 'Tu viaje está listo', [
    'Código de reserva',
    'Itinerario',
    'Acciones de viaje',
  ]),
  DesignViewSpec('Mis vuelos', 'Cada viaje, en un solo lugar', [
    'Próximos',
    'Historial',
    'Detalles del viaje',
  ]),
  DesignViewSpec('Detalle de reserva cancelada', 'La reserva fue cancelada', [
    'Estado de reserva',
    'Reembolso',
    'Gestión de reserva',
  ]),
  DesignViewSpec(
    'Pase de abordar electrónico',
    'Presenta este pase en el aeropuerto',
    ['Datos del pase', 'Horario de embarque', 'Código de acceso'],
  ),
  DesignViewSpec('Estadísticas personales', 'Tus viajes resumidos', [
    'Resumen de vuelos',
    'Indicadores de viaje',
    'Destinos visitados',
  ]),
  DesignViewSpec('Facturación', 'Solicita la factura de tu viaje', [
    'Datos de la reserva',
    'Correo de recepción',
    'Acción',
  ]),
  DesignViewSpec('Datos fiscales', 'Completa los datos de facturación', [
    'Información fiscal',
    'Uso de CFDI',
    'Correo de entrega',
  ]),
  DesignViewSpec('Factura emitida', 'Tu factura está lista', [
    'Datos de factura',
    'Archivos disponibles',
    'Acciones',
  ]),
  DesignViewSpec('Pago de tu reserva', 'MEX → CUN · 18 nov 2026', [
    'Resumen del vuelo',
    'Elige cómo pagar',
    'Total a pagar',
  ]),
  DesignViewSpec('Pago en efectivo', 'Genera una referencia de pago', [
    'Estado del pago',
    'Referencia',
    'Cómo pagar en efectivo',
  ]),
  DesignViewSpec('Transferencia bancaria', 'Consulta los datos de la cuenta', [
    'Estado del pago',
    'Datos bancarios',
    'Pasos',
  ]),
  DesignViewSpec('Procesando tu pago', 'Validando tu pago', [
    'Comprobación de pago',
    'Estado de la reserva',
    'Confirmación',
  ]),
  DesignViewSpec('Pago con PayPal', 'Autorización de pago', [
    'Elige cómo pagar',
    'Autorización',
    'Resumen del pago',
  ]),
  DesignViewSpec(
    'Cancelación y reembolsos',
    'Gestiona la devolución de tu reserva',
    ['Reserva', 'Medio de devolución', 'Plazo'],
  ),
  DesignViewSpec(
    'Mi perfil y documentos',
    'Tus datos, listos para el próximo viaje',
    ['Información personal', 'Documento de viaje', 'Tus preferencias'],
  ),
  DesignViewSpec(
    'Aerolíneas 2Torres Club',
    'Tu programa de viajero frecuente',
    ['Nivel actual', 'Puntos', 'Beneficios'],
  ),
  DesignViewSpec('Inscripción al club', 'Empieza a disfrutar beneficios', [
    'Datos de inscripción',
    'Preferencias',
    'Confirmación',
  ]),
  DesignViewSpec('Confirmar cancelación', 'Revisa antes de cancelar', [
    'Detalle de reserva',
    'Motivo',
    'Confirmar cancelación',
  ]),
  DesignViewSpec('Check-in · Datos del pasajero', 'Prepara tu viaje', [
    'Pasajero',
    'Documento',
    'Confirmar datos',
  ]),
  DesignViewSpec('Check-in completado', 'Ya estás listo para volar', [
    'Pase de abordar',
    'Equipaje',
    'Siguiente paso',
  ]),
  DesignViewSpec('Pago rechazado', 'No se aprobó tu pago', [
    'Motivo',
    'Reintentar pago',
    'Ayuda',
  ]),
];

class DesignCatalogScreen extends StatelessWidget {
  const DesignCatalogScreen({super.key, this.theme = DesignTheme.light});

  final DesignTheme theme;

  @override
  Widget build(BuildContext context) {
    final colors = _Colors.from(theme);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        foregroundColor: colors.text,
        title: const Text('Vistas del diseño'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        itemCount: remainingDesignViews.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final spec = remainingDesignViews[index];
          return ListTile(
            tileColor: colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: colors.border),
            ),
            title: Text(
              spec.title,
              style: TextStyle(color: colors.text, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              spec.subtitle,
              style: TextStyle(color: colors.muted),
            ),
            trailing: Icon(Icons.chevron_right, color: colors.primary),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DesignViewScreen(spec: spec, theme: theme),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DesignViewScreen extends StatelessWidget {
  const DesignViewScreen({
    super.key,
    required this.spec,
    this.theme = DesignTheme.light,
  });

  final DesignViewSpec spec;
  final DesignTheme theme;

  @override
  Widget build(BuildContext context) {
    final colors = _Colors.from(theme);
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        foregroundColor: colors.text,
        title: Text(spec.title),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        children: [
          Text(spec.subtitle, style: TextStyle(color: colors.muted)),
          const SizedBox(height: 20),
          for (final section in spec.sections) ...[
            _SectionCard(title: section, colors: colors),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            style: FilledButton.styleFrom(
              backgroundColor: colors.accent,
              foregroundColor: colors.text,
              minimumSize: const Size.fromHeight(54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.colors});

  final String title;
  final _Colors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colors.text,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: colors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.border),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'Información de ejemplo',
              style: TextStyle(color: colors.muted),
            ),
          ),
        ],
      ),
    );
  }
}

class _Colors {
  const _Colors({
    required this.background,
    required this.surface,
    required this.primary,
    required this.text,
    required this.muted,
    required this.border,
    required this.accent,
  });

  factory _Colors.from(DesignTheme theme) {
    if (theme == DesignTheme.dark) {
      return const _Colors(
        background: DarkColors.background,
        surface: DarkColors.surface,
        primary: DarkColors.primary,
        text: DarkColors.text,
        muted: DarkColors.muted,
        border: DarkColors.border,
        accent: DarkColors.accent,
      );
    }
    return const _Colors(
      background: LightColors.background,
      surface: LightColors.surface,
      primary: LightColors.primary,
      text: LightColors.text,
      muted: LightColors.muted,
      border: LightColors.border,
      accent: LightColors.accent,
    );
  }

  final Color background;
  final Color surface;
  final Color primary;
  final Color text;
  final Color muted;
  final Color border;
  final Color accent;
}
