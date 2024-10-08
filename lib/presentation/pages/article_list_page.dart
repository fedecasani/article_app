import 'package:flutter/material.dart';
import 'package:flutter_article_app/presentation/pages/article_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../blocs/article_bloc.dart';
import '../widgets/custom_appbar.dart';
import '../../core/theme_notifier.dart';
import '../utils/themes.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Articles',
        trailing: IconButton(
          icon: Icon(
            themeNotifier.getTheme().brightness == Brightness.dark
                ? Icons.wb_sunny
                : Icons.nightlight_round,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            themeNotifier.setTheme(
              themeNotifier.getTheme().brightness == Brightness.dark
                  ? lightTheme
                  : darkTheme,
            );
          },
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchProductData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error al cargar productos'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('No hay productos disponibles'));
              } else {
                final products = snapshot.data!;
                return SizedBox(
                  height: 250,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                    items: products.map((product) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    product['image'],
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '\$${product['price']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
                final isDarkMode =
                    Theme.of(context).brightness == Brightness.dark;

                if (state is ArticleLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ArticleLoaded) {
                  return ListView.separated(
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      final article = state.articles[index];
                      return Container(
                        color: isDarkMode ? Colors.grey[1000] : Colors.white,
                        child: ListTile(
                          title: Text(
                            article.title,
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue[900],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailPage(
                                  article: article,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color:
                          isDarkMode ? Colors.blueGrey[800] : Colors.blueGrey,
                      thickness: 1.0,
                      indent: 16.0,
                      endIndent: 16.0,
                    ),
                  );
                } else if (state is ArticleError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchProductData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => product as Map<String, dynamic>).toList();
    } else {
      throw Exception('Error al cargar datos de productos');
    }
  }
}
