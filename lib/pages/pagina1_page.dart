import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () => context.bloc<UsuarioCubit>().borrarUsuario(),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.near_me),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        print(state);
        if (state is UsuarioInitial) {
          return Center(
            child: Text('Noy hay información del usuario'),
          );
        } else if (state is UsuarioActivo) {
          return InformacionUsuario(state.usuario);
        } else {
          return Center(
            child: Text('No estado'),
          );
        }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text(
            'Profeciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profeciones
              .map(
                (e) => ListTile(title: Text(e)),
              )
              .toList()
        ],
      ),
    );
  }
}
