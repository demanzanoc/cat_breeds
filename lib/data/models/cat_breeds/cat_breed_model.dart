class CatBreedModel {
  final String name;
  final String origin;
  final String description;
  final String lifeSpan;
  final int adaptability;
  final int intelligence;
  final String image;

  CatBreedModel({
    required this.name,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    required this.image,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) => CatBreedModel(
        name: json['name'],
        origin: json['origin'],
        description: json['description'],
        lifeSpan: json['life_span'],
        adaptability: json['adaptability'],
        intelligence: json['intelligence'],
        image: json['image'] != null ? json['image']['url'] ?? '' : '',
      );
}
