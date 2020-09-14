import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: usuarioService.existeUsuario
                ? usuarioService.removeUsuario
                : null,
          )
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario)
          : Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.near_me),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
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
          ListTile(title: Text('Nombre: ${this.usuario.nombre}')),
          ListTile(title: Text('Edad: ${this.usuario.edad}')),
          Text(
            'Profeciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...this
              .usuario
              .profeciones
              .map((profecion) => ListTile(title: Text(profecion)))
              .toList()
        ],
      ),
    );
  }
}
