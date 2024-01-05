class MovieModel {
  MovieModel({
      this.rank, 
      this.title, 
      this.thumbnail, 
      this.rating, 
      this.id, 
      this.year, 
      this.image, 
      this.bigImage, 
      this.description, 
      this.trailer, 
      this.trailerEmbedLink, 
      this.trailerYoutubeId, 
      this.genre, 
      this.director, 
      this.writers, 
      this.imdbid, 
      this.imdbLink,});

  MovieModel.fromJson(dynamic json) {
    rank = json['rank'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    rating = json['rating'];
    id = json['id'];
    year = json['year'];
    image = json['image'];
    bigImage = json['big_image'];
    description = json['description'];
    trailer = json['trailer'];
    trailerEmbedLink = json['trailer_embed_link'];
    trailerYoutubeId = json['trailer_youtube_id'];
    genre = json['genre'] != null ? json['genre'].cast<String>() : [];
    director = json['director'] != null ? json['director'].cast<String>() : [];
    writers = json['writers'] != null ? json['writers'].cast<String>() : [];
    imdbid = json['imdbid'];
    imdbLink = json['imdb_link'];
  }
  int? rank;
  String? title;
  String? thumbnail;
  String? rating;
  String? id;
  int? year;
  String? image;
  String? bigImage;
  String? description;
  String? trailer;
  String? trailerEmbedLink;
  String? trailerYoutubeId;
  List<String>? genre;
  List<String>? director;
  List<String>? writers;
  String? imdbid;
  String? imdbLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rank'] = rank;
    map['title'] = title;
    map['thumbnail'] = thumbnail;
    map['rating'] = rating;
    map['id'] = id;
    map['year'] = year;
    map['image'] = image;
    map['big_image'] = bigImage;
    map['description'] = description;
    map['trailer'] = trailer;
    map['trailer_embed_link'] = trailerEmbedLink;
    map['trailer_youtube_id'] = trailerYoutubeId;
    map['genre'] = genre;
    map['director'] = director;
    map['writers'] = writers;
    map['imdbid'] = imdbid;
    map['imdb_link'] = imdbLink;
    return map;
  }

}