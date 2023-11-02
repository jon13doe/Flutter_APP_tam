class ModelsClass {
  final String name;
  final String nameKr;
  final String dateOfBirth;
  final String gender;
  final String height;
  final String weight;
  final String hairColor;
  final String eyeColor;
  final String clothingSize;
  final String shoeSize;
  final String mainPhotoUrl;
  final List<String> portfolioPhotoUrl;
  final List<String> otherPhotoUrl;

  ModelsClass({
    required this.name,
    required this.nameKr,
    required this.dateOfBirth,
    required this.gender,
    required this.height,
    required this.weight,
    required this.hairColor,
    required this.eyeColor,
    required this.clothingSize,
    required this.shoeSize,
    required this.mainPhotoUrl,
    required this.portfolioPhotoUrl,
    required this.otherPhotoUrl,
  });

  factory ModelsClass.fromJson(Map<String, dynamic> json) {
    final portfolioPhotoString = json['portfolio_photo'] as String;
  final otherPhotoString = json['other_photo'] as String;

  final portfolioPhotoList = portfolioPhotoString.split(', ');
  final otherPhotoList = otherPhotoString.split(', ');

    return ModelsClass(
      name: json['name'] as String,
      nameKr: json['name_kyr'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      gender: json['gender'] as String,
      height: json['height_cm'] as String,
      weight: json['weight_kg'] as String,
      hairColor: json['hair_color'] as String,
      eyeColor: json['eye_color'] as String,
      clothingSize: json['clothing_size'] as String,
      shoeSize: json['shoe_size'] as String,
      mainPhotoUrl: json['main_photo'] as String,
      portfolioPhotoUrl: portfolioPhotoList,
      otherPhotoUrl: otherPhotoList,
    );
  }
}
