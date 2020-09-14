import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : Text('pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.usuario = new Usuario(
                    nombre: 'Carlos',
                    edad: 30,
                    profeciones: ['Programador', 'Skater']);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.cambiarEdad(31);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir profeción',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.agregarProferccion('Gamer aficinado');
              },
            ),
          ],
        ),
      ),
    );
  }
}
