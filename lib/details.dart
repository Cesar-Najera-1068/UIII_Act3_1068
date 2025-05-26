import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String productName;        // Corresponde a Id_Camion
  final String productDescription; // Corresponde a Matricula
  final String model;              // Corresponde a Modelo
  final String brand;              // Corresponde a Marca
  final String capacity;           // Corresponde a Capacidad de Pasajeros
  final String engineType;         // Corresponde a Tipo de motor
  final String status;             // Corresponde a Estado del Camion

  const Details({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.model,
    required this.brand,
    required this.capacity,
    required this.engineType,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Detalles del Camión"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estirar la columna para que la tarjeta ocupe el ancho
          children: [
            Card(
              elevation: 5, // Sombra para la tarjeta
              margin: const EdgeInsets.symmetric(vertical: 10.0), // Margen alrededor de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Información del Camión",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade700,
                      ),
                    ),
                    const Divider(height: 20, thickness: 1.5, color: Colors.grey), // Separador
                    _buildDetailRow("Id del Camión:", productName),
                    _buildDetailRow("Matrícula:", productDescription),
                    _buildDetailRow("Modelo:", model),
                    _buildDetailRow("Marca:", brand),
                    _buildDetailRow("Capacidad de Pasajeros:", capacity),
                    _buildDetailRow("Tipo de Motor:", engineType),
                    _buildDetailRow("Estado del Camión:", status),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Vuelve a la pantalla anterior
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Volver",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para crear filas de detalle de forma consistente
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 18, color: Colors.black87),
          children: <TextSpan>[
            TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: " ${value.isEmpty ? 'N/A' : value}",
            ),
          ],
        ),
      ),
    );
  }
}