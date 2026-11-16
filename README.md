# Aerolíneas 2Torres
app móvil de escritorio/web para gestión de aerolínea (reservas, check-in, pagos, nómina).
- **Estado del proyecto** (ej. "En desarrollo" / "MVP").

1. Características (funcionalidades)

- Autenticación de usuarios (login con Firebase Auth)
- Gestión de vuelos y aeronaves
- Reservación de boletos
- Generación de pase de abordar con código QR
- Control de equipaje
- Registro de pagos
- Nómina y turnos de personal
- Gráficas/estadísticas con fl_chart
- Interfaz adaptable (móvil y escritorio)
2. Stack tecnológico
- Flutter SDK
- Firebase (Auth, Firestore)
- Provider (estado)
- fl_chart (gráficas)
- qr_flutter (códigos QR)
3. Requisitos previos
- Flutter SDK instalado (versión compatible con sdk: ^3.13.7)
- Un proyecto de Firebase creado
- Android Studio / VS Code con extensiones de Flutter
- Para iOS: Xcode y macOS
4. Instalación y configuración
Pasos:
    1. Clonar el repositorio.
    2. flutter pub get
    3. Configurar Firebase:
    - Crear proyecto en Firebase Console
    - Agregar app Android (google-services.json) y/o iOS (GoogleService-Info.plist)
    - Habilitar Auth y Firestore
    - Verificar que lib/firebase_options.dart coincida con tu proyecto
    4. Ejecutar: flutter run
7. Estructura del proyecto

- screens/ — pantallas (auth, cliente, desktop, mobile)
- services/ — lógica de negocio por dominio (vuelo, reservacion, pago, etc.)
- models/ — modelos de datos
- dao/ — acceso a datos (vacío por ahora)
- data/ — datos de prueba (mock_data.dart)
- main.dart — punto de entrada
8. Cómo ejecutar
Comandos comunes:
flutter pub get
flutter run
flutter run -d windows   # para escritorio
flutter build apk        # para Android
9. Rutas principales
- / → Login
- Home del cliente
- Pantallas de administración (vuelos, reservaciones, etc.)