import 'package:flutter/material.dart';
import 'package:myapp/details.dart'; // Asegúrate de que esta ruta sea correcta para tu pantalla Details

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idCamionController = TextEditingController(); // Renombrado para claridad
  final _matriculaController = TextEditingController(); // Renombrado para claridad
  final _modelController = TextEditingController();
  final _marcaController = TextEditingController();
  final _capacidadController = TextEditingController();
  final _estadoController = TextEditingController();
  final _tipoController = TextEditingController();

  @override
  void dispose() {
    _idCamionController.dispose();
    _matriculaController.dispose();
    _modelController.dispose();
    _marcaController.dispose();
    _capacidadController.dispose();
    _estadoController.dispose();
    _tipoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Formulario"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _idCamionController,
              fieldName: "Id_Camion",
              myIcon: Icons.format_list_numbered_sharp,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _matriculaController,
              fieldName: "Matricula",
              myIcon: Icons.numbers,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _modelController,
              fieldName: "Modelo",
              myIcon: Icons.directions_bus,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _marcaController,
              fieldName: "Marca",
              myIcon: Icons.airport_shuttle,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _capacidadController,
              fieldName: "Capacidad de Pasajeros",
              myIcon: Icons.people,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _tipoController,
              fieldName: "Tipo de motor",
              myIcon: Icons.build,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),
            
            MyTextField(
              myController: _estadoController,
              fieldName: "Estado del Camion",
              myIcon: Icons.offline_pin,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 20.0),

            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              productName: _idCamionController.text,        // Mapea Id_Camion a productName
              productDescription: _matriculaController.text, // Mapea Matricula a productDescription
              model: _modelController.text,
              brand: _marcaController.text,
              capacity: _capacidadController.text,
              engineType: _tipoController.text,
              status: _estadoController.text,
            );
          }),
        );
      },
      child: Text(
        "Confirmar".toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }
}

// Custom Stateless Widget Class that helps re-usability
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}