class ModelsClass {
  final String name;
  final String nameKr;
  final String dateOfBirth;
  final int height;
  final int weight;
  final String hairColor;
  final String eyeColor;
  final String mainPhotoUrl;
  final List<String> portfolioPhotoUrl;

  ModelsClass({
    required this.name,
    required this.nameKr,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.hairColor,
    required this.eyeColor,
    required this.mainPhotoUrl,
    required this.portfolioPhotoUrl,
  });

  factory ModelsClass.fromJson(Map<String, dynamic> json) {
    final portfolioPhotoString = json['portfolio_photo'] as String;
    final portfolioPhotoList = portfolioPhotoString.split(', ');

    return ModelsClass(
      name: json['name'],
      nameKr: json['name_kyr'],
      dateOfBirth: json['date_of_birth'],
      height: json['height_cm']?? 0,
      weight: json['weight_kg'] ?? 0,
      hairColor: json['hair_color'] ?? '',
      eyeColor: json['eye_color'] ?? '',
      mainPhotoUrl: json['main_photo'],
      portfolioPhotoUrl: portfolioPhotoList,
    );
  }
}
