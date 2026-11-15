import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../auth/login_screen.dart';

class HomeClienteScreen extends StatefulWidget {
  const HomeClienteScreen({super.key});

  @override
  State<HomeClienteScreen> createState() => _HomeClienteScreenState();
}

class _HomeClienteScreenState extends State<HomeClienteScreen> {
  String _tipoViaje = 'Redondo';
  String _origenTexto = '';
  String _destinoTexto = '';

  final TextEditingController _origenCtrl = TextEditingController();
  final TextEditingController _destinoCtrl = TextEditingController();

  DateTime _fechaSalida = DateTime(2026, 11, 20);
  DateTime _fechaRegreso = DateTime(2026, 11, 27);

  int _adultos = 1;
  int _ninos = 0;
  int _bebes = 0;
  String _clase = 'Económica';

  final List _aeropuertos = [
    'Ciudad de México (MEX)',
    'Cancún (CUN)',
    'Guadalajara (GDL)',
    'Tijuana (TIJ)',
    'Monterrey (MTY)',
    'Madrid (MAD)',
  ];

  int get _totalPasajeros => _adultos + _ninos + _bebes;

  @override
  void dispose() {
    _origenCtrl.dispose();
    _destinoCtrl.dispose();
    super.dispose();
  }

  String _formatearFecha(DateTime fecha) {
    const meses = [
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
    ];
    return '${fecha.day} ${meses[fecha.month - 1]} ${fecha.year}';
  }

  void _intercambiarCiudades() {
    setState(() {
      final tempTexto = _origenCtrl.text;
      _origenCtrl.text = _destinoCtrl.text;
      _destinoCtrl.text = tempTexto;
      _origenTexto = _origenCtrl.text;
      _destinoTexto = _destinoCtrl.text;
    });
  }

  Future<void> _seleccionarFecha(bool esSalida) async {
    final elegida = await showDatePicker(
      context: context,
      initialDate: esSalida ? _fechaSalida : _fechaRegreso,
      firstDate: DateTime(2026, 11, 15),
      lastDate: DateTime(2027, 12, 31),
    );
    if (elegida != null) {
      setState(() {
        if (esSalida) {
          _fechaSalida = elegida;
          if (_fechaRegreso.isBefore(_fechaSalida)) {
            _fechaRegreso = _fechaSalida.add(const Duration(days: 3));
          }
        } else {
          _fechaRegreso = elegida;
        }
      });
    }
  }

  void _abrirSelectorPasajerosYClase() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            Widget contadorFila(
                String titulo, String subtitulo, int valor, Function(int) onChanged,
                {int min = 0}) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(titulo,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        Text(subtitulo,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton.outlined(
                          onPressed: valor > min
                              ? () {
                                  setModalState(() => onChanged(valor - 1));
                                  setState(() {});
                                }
                              : null,
                          icon: const Icon(Icons.remove, size: 18),
                        ),
                        SizedBox(
                          width: 32,
                          child: Text(
                            '$valor',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton.outlined(
                          onPressed: _totalPasajeros < 9
                              ? () {
                                  setModalState(() => onChanged(valor + 1));
                                  setState(() {});
                                }
                              : null,
                          icon: const Icon(Icons.add, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            final clasesDisponibles = [
              {'nombre': 'Económica', 'desc': 'Tarifa base flexible'},
              {'nombre': 'Económica Premium', 'desc': 'Más espacio + equipaje'},
              {'nombre': 'Ejecutiva', 'desc': 'Asiento cama + sala VIP'},
              {'nombre': 'Primera', 'desc': 'Experiencia lujo total'},
            ];

            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              contentPadding: const EdgeInsets.all(24),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 600,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Pasajeros',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF061E47))),
                      const Divider(),
                      contadorFila('Adultos', '12+ años', _adultos,
                          (v) => _adultos = v,
                          min: 1),
                      contadorFila(
                          'Niños', '2 - 11 años', _ninos, (v) => _ninos = v),
                      contadorFila('Bebés', 'Menores de 2 años', _bebes,
                          (v) => _bebes = v),
                      const SizedBox(height: 16),
                      const Text('Clase de cabina',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF061E47))),
                      const Divider(),
                      ...clasesDisponibles.map((c) {
                        return RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(c['nombre']!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text(c['desc']!,
                              style: const TextStyle(fontSize: 12)),
                          value: c['nombre']!,
                          groupValue: _clase,
                          onChanged: (val) {
                            setModalState(() => _clase = val!);
                            setState(() {});
                          },
                        );
                      }),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton(
                          onPressed: () => Navigator.pop(context),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 14),
                          ),
                          child: const Text('Listo',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _construirCampoAeropuerto({
    required String etiqueta,
    required String sugerencia,
    required IconData icono,
    required TextEditingController controlador,
    required Function(String) alCambiar,
  }) {
    return SizedBox(
      width: 240,
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return _aeropuertos.map((e) => e.toString());
          }
          return _aeropuertos
              .map((e) => e.toString())
              .where((opcion) => opcion
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()));
        },
        onSelected: (String seleccion) {
          controlador.text = seleccion;
          alCambiar(seleccion);
        },
        fieldViewBuilder: (context, textController, focusNode, onFieldSubmitted) {
          // Sincronizar controlador externo si se intercambiaron ciudades
          if (textController.text != controlador.text) {
            textController.text = controlador.text;
          }
          return TextField(
            controller: textController,
            focusNode: focusNode,
            onChanged: (val) {
              controlador.text = val;
              alCambiar(val);
            },
            decoration: InputDecoration(
              labelText: etiqueta,
              hintText: sugerencia,
              prefixIcon: Icon(icono),
              suffixIcon: textController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        textController.clear();
                        controlador.clear();
                        alCambiar('');
                      },
                    )
                  : null,
              border: const OutlineInputBorder(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vuelosFiltrados = MockData.vuelos.where((v) {
      final origenCompleto =
          '${v['origen']['ciudad']} (${v['origen']['codigo']})'.toLowerCase();
      final destinoCompleto =
          '${v['destino']['ciudad']} (${v['destino']['codigo']})'.toLowerCase();

      final coincideOrigen = _origenTexto.trim().isEmpty ||
          origenCompleto.contains(_origenTexto.trim().toLowerCase());
      final coincideDestino = _destinoTexto.trim().isEmpty ||
          destinoCompleto.contains(_destinoTexto.trim().toLowerCase());

      return coincideOrigen && coincideDestino;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. NAVBAR + HERO BANNER
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF061E47), Color(0xFF0D47A1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 12,
                          children: [
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.flight_takeoff,
                                    color: Colors.amber, size: 30),
                                SizedBox(width: 10),
                                Text(
                                  'Aerolíneas 2Torres',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 8,
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.airplane_ticket,
                                      color: Colors.white),
                                  label: const Text('Mis Vuelos',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.qr_code,
                                      color: Colors.white),
                                  label: const Text('Check-in',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const LoginScreen()),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.white54),
                                  ),
                                  icon: const Icon(Icons.logout, size: 18),
                                  label: const Text('Salir'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Reserva vuelos con Aerolíneas 2Torres',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Escribe tu ciudad o código IATA para encontrar tu vuelo ideal.',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        const SizedBox(height: 20),

                        // 2. CAJA DE BÚSQUEDA CON CAMPOS DE TEXTO AUTOCOMPLETABLES
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ChoiceChip(
                                      label: const Text('Viaje redondo'),
                                      selected: _tipoViaje == 'Redondo',
                                      onSelected: (_) =>
                                          setState(() => _tipoViaje = 'Redondo'),
                                    ),
                                    const SizedBox(width: 8),
                                    ChoiceChip(
                                      label: const Text('Viaje sencillo'),
                                      selected: _tipoViaje == 'Sencillo',
                                      onSelected: (_) => setState(
                                          () => _tipoViaje = 'Sencillo'),
                                    ),
                                    const Spacer(),
                                    if (_origenTexto.isNotEmpty ||
                                        _destinoTexto.isNotEmpty)
                                      TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            _origenCtrl.clear();
                                            _destinoCtrl.clear();
                                            _origenTexto = '';
                                            _destinoTexto = '';
                                          });
                                        },
                                        icon:
                                            const Icon(Icons.refresh, size: 18),
                                        label: const Text('Limpiar'),
                                      ),
                                  ],
                                ),
                                const Divider(height: 20),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 12,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    _construirCampoAeropuerto(
                                      etiqueta: 'Origen',
                                      sugerencia: 'Ej. Ciudad de México o MEX',
                                      icono: Icons.flight_takeoff,
                                      controlador: _origenCtrl,
                                      alCambiar: (val) =>
                                          setState(() => _origenTexto = val),
                                    ),
                                    IconButton.filledTonal(
                                      onPressed: _intercambiarCiudades,
                                      tooltip: 'Intercambiar origen y destino',
                                      icon: const Icon(Icons.swap_horiz),
                                    ),
                                    _construirCampoAeropuerto(
                                      etiqueta: 'Destino',
                                      sugerencia: 'Ej. Cancún o CUN',
                                      icono: Icons.flight_land,
                                      controlador: _destinoCtrl,
                                      alCambiar: (val) =>
                                          setState(() => _destinoTexto = val),
                                    ),
                                    SizedBox(
                                      width: 155,
                                      child: InkWell(
                                        onTap: () => _seleccionarFecha(true),
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            labelText: 'Salida',
                                            prefixIcon: Icon(
                                                Icons.calendar_today,
                                                size: 18),
                                            border: OutlineInputBorder(),
                                          ),
                                          child: Text(
                                            _formatearFecha(_fechaSalida),
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_tipoViaje == 'Redondo')
                                      SizedBox(
                                        width: 155,
                                        child: InkWell(
                                          onTap: () => _seleccionarFecha(false),
                                          child: InputDecorator(
                                            decoration: const InputDecoration(
                                              labelText: 'Retorno',
                                              prefixIcon: Icon(
                                                  Icons.calendar_today,
                                                  size: 18),
                                              border: OutlineInputBorder(),
                                            ),
                                            child: Text(
                                              _formatearFecha(_fechaRegreso),
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      width: 215,
                                      child: InkWell(
                                        onTap: _abrirSelectorPasajerosYClase,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            labelText: 'Personas, clase',
                                            prefixIcon: Icon(Icons.person),
                                            suffixIcon:
                                                Icon(Icons.arrow_drop_down),
                                            border: OutlineInputBorder(),
                                          ),
                                          child: Text(
                                            '$_totalPasajeros, $_clase',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 3. LISTA DE VUELOS ADAPTABLE A MÓVIL Y WEB
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 12,
                        runSpacing: 4,
                        children: [
                          Text(
                            'Vuelos disponibles (${vuelosFiltrados.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF061E47),
                            ),
                          ),
                          Text(
                            '$_totalPasajeros ${_totalPasajeros == 1 ? 'pasajero' : 'pasajeros'} • Cabina $_clase',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (vuelosFiltrados.isEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Center(
                              child: Column(
                                children: [
                                  const Text(
                                    'No encontramos vuelos que coincidan con tu búsqueda.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 12),
                                  FilledButton(
                                    onPressed: () {
                                      setState(() {
                                        _origenCtrl.clear();
                                        _destinoCtrl.clear();
                                        _origenTexto = '';
                                        _destinoTexto = '';
                                      });
                                    },
                                    child: const Text('Mostrar todos los vuelos'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        ...vuelosFiltrados.map((vuelo) {
                          final esRetrasado = vuelo['estado'] == 'Retrasado';
                          final precioUnitario =
                              vuelo['tarifas'][_clase] as double;
                          final precioTotal = precioUnitario * _totalPasajeros;

                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final esMovil = constraints.maxWidth < 650;

                                  final infoVuelo = Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 6,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE3F2FD),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              'Vuelo ${vuelo['numero_vuelo']} • ${vuelo['aeronave']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF0D47A1),
                                              ),
                                            ),
                                          ),
                                          Chip(
                                            label: Text(
                                              vuelo['estado'],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                            backgroundColor: esRetrasado
                                                ? Colors.orange
                                                : Colors.green,
                                            visualDensity:
                                                VisualDensity.compact,
                                          ),
                                          Text(
                                            'Puerta ${vuelo['puerta']}',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(vuelo['origen']['codigo'],
                                                  style: const TextStyle(
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(vuelo['origen']['ciudad'],
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13)),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${vuelo['duracion_min']} min • Directo',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                                const Row(
                                                  children: [
                                                    Expanded(child: Divider()),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child: Icon(
                                                          Icons.flight_takeoff,
                                                          color: Color(
                                                              0xFF0D47A1)),
                                                    ),
                                                    Expanded(child: Divider()),
                                                  ],
                                                ),
                                                Text(
                                                  vuelo['fecha_salida'],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(vuelo['destino']['codigo'],
                                                  style: const TextStyle(
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(vuelo['destino']['ciudad'],
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          const Icon(Icons.luggage,
                                              size: 16, color: Colors.teal),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              vuelo['equipaje_incluido'],
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );

                                  final infoPrecio = Column(
                                    crossAxisAlignment: esMovil
                                        ? CrossAxisAlignment.stretch
                                        : CrossAxisAlignment.end,
                                    children: [
                                      if (esMovil) const Divider(height: 24),
                                      Row(
                                        mainAxisAlignment: esMovil
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.end,
                                        children: [
                                          if (esMovil)
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: Colors.amber.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(
                                                'Cabina $_clase',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.amber.shade900),
                                              ),
                                            ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              if (!esMovil)
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.amber.shade100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Text(
                                                    'Cabina $_clase',
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .amber.shade900),
                                                  ),
                                                ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '\$${precioTotal.toStringAsFixed(0)} MXN',
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF0D47A1),
                                                ),
                                              ),
                                              Text(
                                                _totalPasajeros > 1
                                                    ? '(\$${precioUnitario.toStringAsFixed(0)} c/u)'
                                                    : 'Impuestos incluidos',
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      SizedBox(
                                        width: esMovil
                                            ? double.infinity
                                            : 160,
                                        height: 42,
                                        child: FilledButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Vuelo ${vuelo['numero_vuelo']} seleccionado ($_totalPasajeros pax, $_clase)'),
                                              ),
                                            );
                                          },
                                          child: const Text('Elegir vuelo'),
                                        ),
                                      ),
                                    ],
                                  );

                                  if (esMovil) {
                                    return Column(
                                      children: [infoVuelo, infoPrecio],
                                    );
                                  }

                                  return Row(
                                    children: [
                                      Expanded(flex: 3, child: infoVuelo),
                                      Container(
                                        height: 110,
                                        width: 1,
                                        color: Colors.grey.shade300,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                      ),
                                      Expanded(flex: 1, child: infoPrecio),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}