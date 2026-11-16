
class Reservacion {
  final String idReservacion;
  final String codigoReserva;
  final String idUsuario;
  final String idVuelo;
  final String pasajeroNombre;
  final String asiento;
  final String zonaAsiento;
  final String tarifaSeleccionada;
  final double totalPagado;
  final String metodo;
  final DateTime fechaReserva;
  final bool correoEnviado;
  final Map<String, dynamic> cancelacion;

  Reservacion({
    required this.idReservacion,
    required this.codigoReserva,
    required this.idUsuario,
    required this.idVuelo,
    required this.pasajeroNombre,
    required this.asiento,
    required this.zonaAsiento,
    required this.tarifaSeleccionada,
    required this.totalPagado,
    required this.metodo,
    required this.fechaReserva,
    required this.correoEnviado,
    required this.cancelacion,
  });

  factory Reservacion.fromMap(Map<String, dynamic> map) {
    return Reservacion(
      idReservacion: map['id_reservacion'] ?? '',
      codigoReserva: map['codigo_reserva'] ?? '',
      idUsuario: map['id_usuario'] ?? '',
      idVuelo: map['id_vuelo'] ?? '',
      pasajeroNombre: map['pasajero_nombre'] ?? '',
      asiento: map['asiento'] ?? '',
      zonaAsiento: map['zona_asiento'] ?? '',
      tarifaSeleccionada: map['tarifa_seleccionada'] ?? '',
      totalPagado: (map['total_pagado'] ?? 0).toDouble(),
      metodo: map['metodo'] ?? '',
      fechaReserva: map['fecha_reserva'] is DateTime
          ? map['fecha_reserva']
          : (map['fecha_reserva'] as dynamic).toDate(),
      correoEnviado: map['correo_enviado'] ?? false,
      cancelacion: Map<String, dynamic>.from(
          map['cancelacion'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_reservacion': idReservacion,
      'codigo_reserva': codigoReserva,
      'id_usuario': idUsuario,
      'id_vuelo': idVuelo,
      'pasajero_nombre': pasajeroNombre,
      'asiento': asiento,
      'zona_asiento': zonaAsiento,
      'tarifa_seleccionada': tarifaSeleccionada,
      'total_pagado': totalPagado,
      'metodo': metodo,
      'fecha_reserva': fechaReserva,
      'correo_enviado': correoEnviado,
      'cancelacion': cancelacion,
    };
  }
}
