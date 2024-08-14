import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';
import '../widgets/custom_appbar.dart'; // Ajusta la ruta según sea necesario

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: article.title,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen aleatoria del artículo
                Container(
                  height: 200, // Ajusta el tamaño según sea necesario
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/800/600?random=${DateTime.now().millisecondsSinceEpoch}', // URL de una imagen aleatoria
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 16.0), // Espacio entre la imagen y el texto
                // Descripción del artículo
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      article.body,
                      style: TextStyle(
                          fontSize: 16), // Ajusta el estilo según sea necesario
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[800], // Fondo azul
                shape: BoxShape.circle, // Forma circular
              ),
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white, // Ícono blanco
                  size: 30,
                ),
                onPressed: () {
                  // Acción para el icono de editar (actualmente no hace nada)
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
