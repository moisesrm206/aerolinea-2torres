
class Pago {
  final String idPago;
  final String idReservacion;
  final String idUsuario;
  final String metodo;
  final String ultimosDigitos;
  final double monto;
  final String moneda;
  final String estado;
  final DateTime fechaPago;

  Pago({
    required this.idPago,
    required this.idReservacion,
    required this.idUsuario,
    required this.metodo,
    required this.ultimosDigitos,
    required this.monto,
    required this.moneda,
    required this.estado,
    required this.fechaPago,
  });

  factory Pago.fromMap(Map<String, dynamic> map) {
    return Pago(
      idPago: map['id_pago'] ?? '',
      idReservacion: map['id_reservacion'] ?? '',
      idUsuario: map['id_usuario'] ?? '',
      metodo: map['metodo'] ?? '',
      ultimosDigitos: map['ultimos_digitos'] ?? '',
      monto: (map['monto'] ?? 0).toDouble(),
      moneda: map['moneda'] ?? 'MXN',
      estado: map['estado'] ?? '',
      fechaPago: map['fecha_pago'] is DateTime
          ? map['fecha_pago']
          : (map['fecha_pago'] as dynamic).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_pago': idPago,
      'id_reservacion': idReservacion,
      'id_usuario': idUsuario,
      'metodo': metodo,
      'ultimos_digitos': ultimosDigitos,
      'monto': monto,
      'moneda': moneda,
      'estado': estado,
      'fecha_pago': fechaPago,
    };
  }
}
