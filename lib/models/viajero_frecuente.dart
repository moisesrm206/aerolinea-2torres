/// Datos embebidos del programa de viajero frecuente de un cliente.
class ViajeroFrecuente {
  final String? numeroViajero;      // Ej: 2T-FF-123456
  final String? nivel;              // Plata, Oro, Diamante, etc.
  final int? millasAcumuladas;
  final DateTime? fechaInscripcion;
  final bool? activo;
  final String? codigoAerolinea;    // Ej: 2T

  ViajeroFrecuente({
    this.numeroViajero,
    this.nivel,
    this.millasAcumuladas,
    this.fechaInscripcion,
    this.activo,
    this.codigoAerolinea,
  });

  factory ViajeroFrecuente.fromMap(Map<String, dynamic> map) {
    return ViajeroFrecuente(
      numeroViajero: map['numero_viajero'],
      nivel: map['nivel'],
      millasAcumuladas: map['millas_acumuladas'] is int
          ? map['millas_acumuladas']
          : (map['millas_acumuladas'] as num?)?.toInt(),
      fechaInscripcion: map['fecha_inscripcion'] is DateTime
          ? map['fecha_inscripcion']
          : (map['fecha_inscripcion'] != null
              ? DateTime.tryParse(map['fecha_inscripcion'].toString())
              : null),
      activo: map['activo'],
      codigoAerolinea: map['codigo_aerolinea'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (numeroViajero != null) 'numero_viajero': numeroViajero,
      if (nivel != null) 'nivel': nivel,
      if (millasAcumuladas != null) 'millas_acumuladas': millasAcumuladas,
      if (fechaInscripcion != null) 'fecha_inscripcion': fechaInscripcion,
      if (activo != null) 'activo': activo,
      if (codigoAerolinea != null) 'codigo_aerolinea': codigoAerolinea,
    };
  }
}
