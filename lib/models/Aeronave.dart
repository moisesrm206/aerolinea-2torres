
class Aeronave {
  final String idAeronave;
  final String modelo;
  final int capacidadTotal;
  final String estado;
  final Map<String, dynamic> configuracionCabina;

  Aeronave({
    required this.idAeronave,
    required this.modelo,
    required this.capacidadTotal,
    required this.estado,
    Map<String, dynamic>? configuracionCabina,
  }) : configuracionCabina = configuracionCabina ?? {};

  factory Aeronave.fromMap(Map<String, dynamic> map) {
    return Aeronave(
      idAeronave: map['id_aeronave'] ?? '',
      modelo: map['modelo'] ?? '',
      capacidadTotal: map['capacidad_total'] ?? 0,
      estado: map['estado'] ?? '',
      configuracionCabina:
      Map<String, dynamic>.from(
          map['configuracion_cabina'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_aeronave': idAeronave,
      'modelo': modelo,
      'capacidad_total': capacidadTotal,
      'estado': estado,
      'configuracion_cabina': configuracionCabina,
    };
  }
}
