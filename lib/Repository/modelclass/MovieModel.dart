
class MovieModel {
  int? rank;
  String? title;
  String? description;
  String? image;
  String? bigImage;
  List<String>? genre;
  String? thumbnail;
  String? rating;
  String? id;
  int? year;
  String? imdbid;
  String? imdbLink;

  MovieModel({this.rank, this.title, this.description, this.image, this.bigImage, this.genre, this.thumbnail, this.rating, this.id, this.year, this.imdbid, this.imdbLink});

  MovieModel.fromJson(Map<String, dynamic> json) {
    rank = json["rank"];
    title = json["title"];
    description = json["description"];
    image = json["image"];
    bigImage = json["big_image"];
    genre = json["genre"] == null ? null : List<String>.from(json["genre"]);
    thumbnail = json["thumbnail"];
    rating = json["rating"];
    id = json["id"];
    year = json["year"];
    imdbid = json["imdbid"];
    imdbLink = json["imdb_link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rank"] = rank;
    _data["title"] = title;
    _data["description"] = description;
    _data["image"] = image;
    _data["big_image"] = bigImage;
    if(genre != null) {
      _data["genre"] = genre;
    }
    _data["thumbnail"] = thumbnail;
    _data["rating"] = rating;
    _data["id"] = id;
    _data["year"] = year;
    _data["imdbid"] = imdbid;
    _data["imdb_link"] = imdbLink;
    return _data;
  }
}
