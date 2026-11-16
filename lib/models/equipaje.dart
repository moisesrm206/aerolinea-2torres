
class Equipaje {
  final String idEquipaje;
  final String idReservacion;
  final String tipo;
  final double pesoKg;
  final double cargoAdicional;
  final String estadoRetiro;

  Equipaje({
    required this.idEquipaje,
    required this.idReservacion,
    required this.tipo,
    required this.pesoKg,
    required this.cargoAdicional,
    required this.estadoRetiro,
  });

  factory Equipaje.fromMap(Map<String, dynamic> map) {
    return Equipaje(
      idEquipaje: map['id_equipaje'] ?? '',
      idReservacion: map['id_reservacion'] ?? '',
      tipo: map['tipo'] ?? '',
      pesoKg: (map['peso_kg'] ?? 0).toDouble(),
      cargoAdicional: (map['cargo_adicional'] ?? 0).toDouble(),
      estadoRetiro: map['estado_retiro'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_equipaje': idEquipaje,
      'id_reservacion': idReservacion,
      'tipo': tipo,
      'peso_kg': pesoKg,
      'cargo_adicional': cargoAdicional,
      'estado_retiro': estadoRetiro,
    };
  }
}
