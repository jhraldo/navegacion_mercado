import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({
    super.key,
    required this.correo,
  });

  final String correo;

  final List<Map<String, String>> productores = const [
    {
      'nombre': 'Finca La Esperanza',
      'vereda': 'Vereda El Salado',
      'distancia': '2.5 km',
    },
    {
      'nombre': 'Huerta Doña Rosa',
      'vereda': 'Vereda La María',
      'distancia': '3.1 km',
    },
    {
      'nombre': 'Finca El Manantial',
      'vereda': 'Vereda El Tablazo',
      'distancia': '4.2 km',
    },
    {
      'nombre': 'Granja Los Alpes',
      'vereda': 'Vereda Las Palmas',
      'distancia': '5.0 km',
    },
    {
      'nombre': 'Cultivos San Isidro',
      'vereda': 'Vereda El Escobero',
      'distancia': '6.3 km',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5ED),
      appBar: AppBar(
        title: const Text('Mercado Campesino'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola, $correo',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Mercado campesino\ncerca de ti',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: '¿Qué estás buscando?',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Productores cerca de ti',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: productores.length,
                  itemBuilder: (context, index) {
                    final productor = productores[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: const Icon(
                            Icons.agriculture,
                            color: Colors.green,
                          ),
                        ),
                        title: Text(
                          productor['nombre']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${productor['vereda']} • ${productor['distancia']}',
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}