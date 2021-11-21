import 'package:flutter_app/app/models/fileProvider.dart';

class Muscle extends FileProvider {
  Muscle(
      {String name = '',
      this.latin = '',
      this.customMeridienId = '',
      this.mainImage = '',
      this.meridian = '',
      this.customMeridianKey = '',
      this.element = '',
      this.mainMuscle = '',
      this.correctionNLANTId = '',
      this.correctionNLPOSTId = '',
      this.correctionNVId = '',
      this.correctionBILATId = '',
      this.imageNLANT = '',
      this.imageNLPOST = '',
      this.imageNV = '',
      this.imageBILAT = '',
      this.imagePrefix = '',
      this.imageUpright = '',
      this.imageLying = '',
      this.movieUpright = '',
      this.movieLying = ''})
      : super(name: name);

  String latin;
  String customMeridienId;
  String mainImage;
  String meridian;
  String customMeridianKey;
  String element;
  String mainMuscle;
  String correctionNLANTId;
  String correctionNLPOSTId;
  String correctionNVId;
  String correctionBILATId;
  String imageNLANT;
  String imageNLPOST;
  String imageNV;
  String imageBILAT;
  String imagePrefix;
  String imageUpright;
  String imageLying;
  String movieUpright;
  String movieLying;

  @override
  String getName() {
    return "muscles";
  }

  Muscle generate(dynamic item) {
    return new Muscle(
      name: item["prefix"],
      latin: item["latin"],
      customMeridienId: item["custom_meridien_id"],
      mainImage: item["main_image"],
      meridian: item["meridian"],
      customMeridianKey: item["custom_meridian_key"],
      element: item["element"],
      mainMuscle: item["main_muscle"],
      correctionNLANTId: item["correction_NL_ANT_id"],
      correctionNLPOSTId: item["correction_NL_POST_id"],
      correctionNVId: item["correction_NV_id"],
      correctionBILATId: item["correction_BILAT_id"],
      imageNLANT: item["image_NL_ANT"],
      imageNLPOST: item["image_NL_POST"],
      imageNV: item["image_NV"],
      imageBILAT: item["image_BILAT"],
      imagePrefix: item["image_prefix"],
      imageUpright: item["image_upright"],
      imageLying: item["image_lying"],
      movieUpright: item["movie_upright"],
      movieLying: item["movie_lying"],
    );
  }

  @override
  Future<Muscle> get(String id, {String key = 'prefix'}) async {
    dynamic item = await super.get(id, key: key);

    item = generate(item);

    return item;
  }

  @override
  Future<List<Muscle>> read() async {
    List data = await super.read();
    List<Muscle> muscles = [];

    for (var item in data) {
      muscles.add(generate(item));
    }

    return muscles;
  }

  List<String> getImages() {
    return [
      this.imageNLANT,
      this.imageNLPOST,
      this.imageNV,
      this.imageBILAT,
      this.imagePrefix,
      this.imageUpright,
      this.imageLying
    ];
  }
}
