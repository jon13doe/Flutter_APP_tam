class ModelClass {
  final String name;
  final String nameKyr;
  final String group;
  final String dateOfBirth;
  final String gender;
  final String height;
  final String weight;
  final String hairColor;
  final String eyeColor;
  final String clothingSize;
  final String shoeSize;
  final String mainPhoto;
  final List<String> portfolioPhotos;
  final List<String> otherPhotos;
  final String email;

  ModelClass({
    this.name = '',
    this.nameKyr = '',
    this.group = '',
    this.dateOfBirth = '',
    this.gender = '',
    this.height = '',
    this.weight = '',
    this.hairColor = '',
    this.eyeColor = '',
    this.clothingSize = '',
    this.shoeSize = '',
    this.mainPhoto = '',
    this.portfolioPhotos = const [],
    this.otherPhotos = const [],
    this.email = '',
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    final portfolioPhotoString = json['portfolio_photo'] as String;
    final portfolioPhotoList = portfolioPhotoString.split(', ');

    final otherPhotosString = json['other_photo'] as String;
    final otherPhotosList = otherPhotosString.split(', ');

    return ModelClass(
      name: json['name'] as String,
      nameKyr: json['name_kyr'] as String,
      group: json['group'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      gender: json['gender'] as String,
      height: json['height_cm'] as String,
      weight: json['weight_kg'] as String,
      hairColor: json['hair_color'] as String,
      eyeColor: json['eye_color'] as String,
      clothingSize: json['clothing_size'] as String,
      shoeSize: json['shoe_size'] as String,
      mainPhoto: json['main_photo'] as String,
      portfolioPhotos: portfolioPhotoList,
      otherPhotos: otherPhotosList,
      email: json['email'] as String,
    );
  }
}
