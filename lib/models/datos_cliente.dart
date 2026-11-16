import 'package:aerolinea/models/preferencias_cliente.dart';
import 'package:aerolinea/models/viajero_frecuente.dart';

/// Datos específicos del cliente, embebidos dentro del documento de Usuario
/// en la colección `usuarios` de Firestore bajo la clave `datos_cliente`.
class DatosCliente {
  // Identificación
  final String? pasaporte;
  final String? nacionalidad;
  final String? tipoDocumento;
  final DateTime? fechaNacimiento;

  // Contacto
  final String? telefono;
  final String? emailContacto;
  final String? direccion;
  final String? ciudad;
  final String? pais;
  final String? contactoEmergencia;
  final String? telefonoEmergencia;

  // Viajero frecuente (embebido)
  final ViajeroFrecuente? viajeroFrecuente;

  // Preferencias (embebido)
  final PreferenciasCliente? preferencias;

  DatosCliente({
    this.pasaporte,
    this.nacionalidad,
    this.tipoDocumento,
    this.fechaNacimiento,
    this.telefono,
    this.emailContacto,
    this.direccion,
    this.ciudad,
    this.pais,
    this.contactoEmergencia,
    this.telefonoEmergencia,
    this.viajeroFrecuente,
    this.preferencias,
  });

  factory DatosCliente.fromMap(Map<String, dynamic> map) {
    return DatosCliente(
      pasaporte: map['pasaporte'],
      nacionalidad: map['nacionalidad'],
      tipoDocumento: map['tipo_documento'],
      fechaNacimiento: map['fecha_nacimiento'] is DateTime
          ? map['fecha_nacimiento']
          : (map['fecha_nacimiento'] != null
              ? DateTime.tryParse(map['fecha_nacimiento'].toString())
              : null),
      telefono: map['telefono'],
      emailContacto: map['email_contacto'],
      direccion: map['direccion'],
      ciudad: map['ciudad'],
      pais: map['pais'],
      contactoEmergencia: map['contacto_emergencia'],
      telefonoEmergencia: map['telefono_emergencia'],
      viajeroFrecuente: map['viajero_frecuente'] != null
          ? ViajeroFrecuente.fromMap(
              Map<String, dynamic>.from(map['viajero_frecuente']))
          : null,
      preferencias: map['preferencias'] != null
          ? PreferenciasCliente.fromMap(
              Map<String, dynamic>.from(map['preferencias']))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (pasaporte != null) 'pasaporte': pasaporte,
      if (nacionalidad != null) 'nacionalidad': nacionalidad,
      if (tipoDocumento != null) 'tipo_documento': tipoDocumento,
      if (fechaNacimiento != null) 'fecha_nacimiento': fechaNacimiento,
      if (telefono != null) 'telefono': telefono,
      if (emailContacto != null) 'email_contacto': emailContacto,
      if (direccion != null) 'direccion': direccion,
      if (ciudad != null) 'ciudad': ciudad,
      if (pais != null) 'pais': pais,
      if (contactoEmergencia != null) 'contacto_emergencia': contactoEmergencia,
      if (telefonoEmergencia != null)
        'telefono_emergencia': telefonoEmergencia,
      if (viajeroFrecuente != null) 'viajero_frecuente': viajeroFrecuente!.toMap(),
      if (preferencias != null) 'preferencias': preferencias!.toMap(),
    };
  }
}
