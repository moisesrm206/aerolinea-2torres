/// Preferencias de viaje y comunicación de un cliente.
class PreferenciasCliente {
  final String? asientoPreferido;          // Ventana, Pasillo, Cualquiera
  final String? comidaPreferida;           // Vegetariana, Vegana, Sin gluten, etc.
  final String? idiomaPreferido;           // es, en, etc.
  final bool? necesitaAsistencia;          // Silla de ruedas, ayuda al abordar, etc.
  final List<String>? canalesNotificacion; // email, sms, push
  final String? idiomaComunicacion;

  PreferenciasCliente({
    this.asientoPreferido,
    this.comidaPreferida,
    this.idiomaPreferido,
    this.necesitaAsistencia,
    this.canalesNotificacion,
    this.idiomaComunicacion,
  });

  factory PreferenciasCliente.fromMap(Map<String, dynamic> map) {
    return PreferenciasCliente(
      asientoPreferido: map['asiento_preferido'],
      comidaPreferida: map['comida_preferida'],
      idiomaPreferido: map['idioma_preferido'],
      necesitaAsistencia: map['necesita_asistencia'],
      canalesNotificacion: map['canales_notificacion'] != null
          ? List<String>.from(map['canales_notificacion'])
          : null,
      idiomaComunicacion: map['idioma_comunicacion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (asientoPreferido != null) 'asiento_preferido': asientoPreferido,
      if (comidaPreferida != null) 'comida_preferida': comidaPreferida,
      if (idiomaPreferido != null) 'idioma_preferido': idiomaPreferido,
      if (necesitaAsistencia != null) 'necesita_asistencia': necesitaAsistencia,
      if (canalesNotificacion != null)
        'canales_notificacion': canalesNotificacion,
      if (idiomaComunicacion != null) 'idioma_comunicacion': idiomaComunicacion,
    };
  }
}
