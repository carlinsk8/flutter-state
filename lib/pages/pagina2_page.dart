import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina 2'),
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
                final usuario = new Usuario(
                    nombre: 'Carlos',
                    edad: 30,
                    profeciones: ['Programador', 'Skater']);
                BlocProvider.of<UsuarioBloc>(context).add(
                  ActivarUsuario(usuario),
                );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context).add(
                  CambiarEdad(20),
                );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir profeción',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context).add(
                  AgregarProfeccion('Nueva profecion'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
