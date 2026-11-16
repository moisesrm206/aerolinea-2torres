
class Vuelo {
  final String idVuelo;
  final String numeroVuelo;
  final String idAeronave;

  final Map<String, dynamic> origen;
  final Map<String, dynamic> destino;

  final DateTime fechaSalida;
  final DateTime fechaLlegada;

  final int duracionMin;
  final double distanciaKm;

  final String puerta;
  final String horaEmbarque;
  final String climaPuerta;
  final String estado;

  final Map<String, dynamic> tarifas;
  final List<String> tripulacionIds;
  final List<String> asientosOcupados;

  Vuelo({
    required this.idVuelo,
    required this.numeroVuelo,
    required this.idAeronave,
    required this.origen,
    required this.destino,
    required this.fechaSalida,
    required this.fechaLlegada,
    required this.duracionMin,
    required this.distanciaKm,
    required this.puerta,
    required this.horaEmbarque,
    required this.climaPuerta,
    required this.estado,
    required this.tarifas,
    required this.tripulacionIds,
    required this.asientosOcupados,
  });

  factory Vuelo.fromMap(Map<String, dynamic> map) {
    return Vuelo(
      idVuelo: map['id_vuelo'] ?? '',
      numeroVuelo: map['numero_vuelo'] ?? '',
      idAeronave: map['id_aeronave'] ?? '',
      origen: Map<String, dynamic>.from(map['origen'] ?? {}),
      destino: Map<String, dynamic>.from(map['destino'] ?? {}),
      fechaSalida: _fecha(map['fecha_salida']),
      fechaLlegada: _fecha(map['fecha_llegada']),
      duracionMin: map['duracion_min'] ?? 0,
      distanciaKm: (map['distancia_km'] ?? 0).toDouble(),
      puerta: map['puerta'] ?? '',
      horaEmbarque: map['hora_embarque'] ?? '',
      climaPuerta: map['clima_puerta'] ?? '',
      estado: map['estado'] ?? '',
      tarifas: Map<String, dynamic>.from(map['tarifas'] ?? {}),
      tripulacionIds: List<String>.from(map['tripulacion_ids'] ?? []),
      asientosOcupados: List<String>.from(map['asientos_ocupados'] ?? []),
    );
  }

  static DateTime _fecha(dynamic valor) {
    if (valor is DateTime) return valor;
    if (valor != null && valor is dynamic && valor.toDate != null) {
      return valor.toDate();
    }
    return DateTime.tryParse(valor?.toString() ?? '') ?? DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'id_vuelo': idVuelo,
      'numero_vuelo': numeroVuelo,
      'id_aeronave': idAeronave,
      'origen': origen,
      'destino': destino,
      'fecha_salida': fechaSalida,
      'fecha_llegada': fechaLlegada,
      'duracion_min': duracionMin,
      'distancia_km': distanciaKm,
      'puerta': puerta,
      'hora_embarque': horaEmbarque,
      'clima_puerta': climaPuerta,
      'estado': estado,
      'tarifas': tarifas,
      'tripulacion_ids': tripulacionIds,
      'asientos_ocupados': asientosOcupados,
    };
  }
}
