import 'package:cats_app/presentation/providers/cat_breeds/home_screen_provider.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
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
      body: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingCatBreeds) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Enter the breed name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (query) {
                    // TODO(demanzanoc): Implement search
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.catBreeds.length,
                    itemBuilder: (context, index) {
                      final catBreed = provider.catBreeds[index];
                      return CatBreedCard(catBreed: catBreed);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
