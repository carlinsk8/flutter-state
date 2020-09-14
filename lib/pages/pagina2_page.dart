import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

import 'package:estados_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.bloc<UsuarioCubit>();
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
                final user = new Usuario(
                    nombre: 'Carlos',
                    edad: 30,
                    profeciones: ['programador', 'skater']);
                usuarioCubit.seleccionarUsuario(user);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioCubit.cambairEdad(20);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Añadir profeción',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: usuarioCubit.agregarProfeccion,
            ),
          ],
        ),
      ),
    );
  }
}
