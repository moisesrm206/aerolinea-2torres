# Aerolíneas 2Torres

Aplicación multiplataforma (móvil, escritorio y web (pruebas rapidas)) para la gestión integral de una aerolínea. Permite administrar vuelos, reservaciones, pases de abordar con código QR, equipaje, pagos y nómina de personal.

> **Estado:** En desarrollo (MVP)

---

## 📋 Tabla de contenidos

- [Características](#-características)
- [Stack tecnológico](#-stack-tecnológico)
- [Capturas de pantalla](#-capturas-de-pantalla)
- [Requisitos previos](#-requisitos-previos)
- [Instalación y configuración](#-instalación-y-configuración)
- [Estructura del proyecto](#-estructura-del-proyecto)
- [Cómo ejecutar](#-cómo-ejecutar)
- [Rutas principales](#-rutas-principales)

---

## 🚀 Características

- **Autenticación de usuarios** mediante Firebase Auth (login).
- **Gestión de vuelos y aeronaves** (crear, consultar y administrar vuelos disponibles).
- **Reservación de boletos** para clientes.
- **Generación de pase de abordar** con código QR (`qr_flutter`).
- **Control de equipaje** asociado a cada reservación.
- **Registro de pagos** y seguimiento de transacciones.
- **Nómina y turnos** del personal de la aerolínea.
- **Gráficas y estadísticas** operativas con `fl_chart`.
- **Interfaz adaptable** para dispositivos móviles y escritorio.

---

## 🛠️ Stack tecnológico

| Tecnología | Uso |
|------------|-----|
| [Flutter](https://flutter.dev) | Framework multiplataforma (móvil, web, escritorio) |
| [Firebase Auth](https://firebase.google.com/products/auth) | Autenticación de usuarios |
| [Firebase Firestore](https://firebase.google.com/products/firestore) | Base de datos en la nube |
| [Provider](https://pub.dev/packages/provider) | Manejo de estado |
| [fl_chart](https://pub.dev/packages/fl_chart) | Gráficas y estadísticas |
| [qr_flutter](https://pub.dev/packages/qr_flutter) | Generación de códigos QR |

---

## 📸 Capturas de pantalla

> Agrega aquí imágenes o un GIF de la aplicación (pantalla de login, home del cliente, pase de abordar con QR, administración de vuelos, etc.).

```markdown
<!-- Ejemplo de cómo insertar una imagen:
![Login](screenshots/login.png)
![Home cliente](screenshots/home-cliente.png)
![Pase de abordar](screenshots/pase-abordar.png)
-->
```

---

## ⚙️ Requisitos previos

Antes de comenzar, asegúrate de tener instalado:

- **Flutter SDK** (compatible con `sdk: ^3.13.7`)
- Un proyecto de **Firebase** creado en [Firebase Console](https://console.firebase.google.com/)
- **Android Studio** o **VS Code** con las extensiones de Flutter y Dart
- (Opcional, para iOS) **Xcode y macOS**

---

## 📥 Instalación y configuración

Sigue estos pasos para poner el proyecto en marcha:

### 1. Clona el repositorio

```bash
gitclone https://github.com/moisesrm206/aerolinea-2torres.git
cd aerolinea-2torres
```

### 2. Instala las dependencias

```bash
flutter pub get
```

### 3. Configura Firebase

1. Crea un proyecto en [Firebase Console](https://console.firebase.google.com/).
2. Agrega tu aplicación:
   - **Android:** descarga el archivo `google-services.json` y colócalo en `android/app/`.
   - **iOS:** descarga el archivo `GoogleService-Info.plist` y colócalo en `ios/Runner/`.
3. Habilita los servicios que usa la app:
   - **Authentication** (método de inicio de sesión que vayas a usar).
   - **Cloud Firestore** (base de datos en modo prueba o producción).
4. Verifica que el archivo `lib/firebase_options.dart` contenga la configuración correcta de tu proyecto de Firebase.

### 4. Ejecuta la aplicación

```bash
flutter run
```

---

## 📁 Estructura del proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── firebase_options.dart     # Configuración de Firebase por plataforma
├── screens/                  # Pantallas de la interfaz
│   ├── auth/                 # Pantallas de autenticación (login)
│   ├── cliente/              # Pantallas del cliente
│   ├── desktop/              # Pantallas específicas de escritorio
│   └── mobile/               # Pantallas específicas de móvil
├── services/                 # Lógica de negocio por dominio
│   ├── aeronave_service.dart
│   ├── equipaje_service.dart
│   ├── nomina_turno_service.dart
│   ├── pago_service.dart
│   ├── pase_abordar_service.dart
│   ├── reservacion_service.dart
│   ├── user_service.dart
│   └── vuelo_service.dart
├── models/                   # Modelos de datos
│   ├── aeronave.dart
│   ├── auth_service.dart
│   ├── equipaje.dart
│   ├── nomina_turno.dart
│   ├── pago.dart
│   ├── pase_abordar.dart
│   ├── reservacion.dart
│   ├── usuario.dart
│   └── vuelo.dart
├── dao/                      # Acceso a datos (por implementar)
└── data/                     # Datos de prueba
    └── mock_data.dart
```

---

## ▶️ Cómo ejecutar

Comandos útiles:

```bash
# Obtener dependencias
flutter pub get

# Ejecutar en el dispositivo disponible
flutter run

# Ejecutar en Windows (escritorio)
flutter run -d windows

# Ejecutar en un emulador/dispositivo específico
flutter run -d <device_id>

# Construir APK para Android
flutter build apk

# Analizar código
flutter analyze

# Formatear código
flutter format .
```

---

## 🗺️ Rutas principales

| Ruta | Pantalla |
|------|----------|
| `/` | Pantalla de inicio de sesión (`LoginScreen`) |
| Home cliente | Panel principal del cliente con sus reservas y vuelos |
| Administración | Gestión de vuelos, reservaciones, pagos, nómina, etc. |



