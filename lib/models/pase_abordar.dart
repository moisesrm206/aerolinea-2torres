
class PaseAbordar {
  final String idPase;
  final String idReservacion;
  final String grupoAbordaje;
  final String codigoQr;
  final String estadoCheckin;
  final DateTime fechaEmision;

  PaseAbordar({
    required this.idPase,
    required this.idReservacion,
    required this.grupoAbordaje,
    required this.codigoQr,
    required this.estadoCheckin,
    required this.fechaEmision,
  });

  factory PaseAbordar.fromMap(Map<String, dynamic> map) {
    return PaseAbordar(
      idPase: map['id_pase'] ?? '',
      idReservacion: map['id_reservacion'] ?? '',
      grupoAbordaje: map['grupo_abordaje'] ?? '',
      codigoQr: map['codigo_qr'] ?? '',
      estadoCheckin: map['estado_checkin'] ?? '',
      fechaEmision: map['fecha_emision'] is DateTime
          ? map['fecha_emision']
          : (map['fecha_emision'] as dynamic).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_pase': idPase,
      'id_reservacion': idReservacion,
      'grupo_abordaje': grupoAbordaje,
      'codigo_qr': codigoQr,
      'estado_checkin': estadoCheckin,
      'fecha_emision': fechaEmision,
    };
  }
}
