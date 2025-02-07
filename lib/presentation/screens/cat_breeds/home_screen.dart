import 'package:cats_app/presentation/providers/cat_breeds/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenProvider>().getCatBreeds();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Catbreeds')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
                hintText: 'Ingresa el nombre de la raza',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                // TODO(demanzanoc): Implement search
              },
            ),
            Consumer<HomeScreenProvider>(
              builder: (context, provider, child) {
                if (provider.isLoadingCatBreeds) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: provider.catBreeds.length,
                      itemBuilder: (context, index) {
                        final catBreed = provider.catBreeds[index];
                        // TODO(demanzanoc): Implement the correct item view
                        return ListTile(
                          title: Text(catBreed.name),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
