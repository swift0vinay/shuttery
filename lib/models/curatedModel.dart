class CuratedModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  int id;
  SrcModel src;

  CuratedModel(
      {this.photographer,
      this.photographer_id,
      this.photographer_url,
      this.id,
      this.src});

  factory CuratedModel.fromMap(Map<String, dynamic> jsonData) {
    return CuratedModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer: jsonData['photographer'],
      photographer_id: jsonData['photographer_id'],
      photographer_url: jsonData['photographer_url'],
      id: jsonData['id']
    );
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({this.original, this.small, this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData['original'],
        small: jsonData['small'],
        portrait: jsonData['portrait']);
  }
}
