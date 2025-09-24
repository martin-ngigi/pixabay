class PixabayResponseModel {
  late int? total;
  late int? totalHits;
  late List<Hits>? hits;

  PixabayResponseModel({this.total, this.totalHits, this.hits});

  PixabayResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits?.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalHits'] = this.totalHits;
    final hits = this.hits;
    if (hits != null) {
      data['hits'] = hits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  late int? id;
  late String? pageURL;
  late String? type;
  late String? tags;
  late String? previewURL;
  late int? previewWidth;
  late int? previewHeight;
  late String? webformatURL;
  late int? webformatWidth;
  late int? webformatHeight;
  late String? largeImageURL;
  late int? imageWidth;
  late int? imageHeight;
  late int? imageSize;
  late int? views;
  late int? downloads;
  late int? collections;
  late int? likes;
  late int? comments;
  late int? userId;
  late String? user;
  late String? userImageURL;
  late bool? noAiTraining;
  late bool? isAiGenerated;
  late bool? isGRated;
  late bool? isLowQuality;
  late String? userURL;

  Hits(
      {this.id,
        this.pageURL,
        this.type,
        this.tags,
        this.previewURL,
        this.previewWidth,
        this.previewHeight,
        this.webformatURL,
        this.webformatWidth,
        this.webformatHeight,
        this.largeImageURL,
        this.imageWidth,
        this.imageHeight,
        this.imageSize,
        this.views,
        this.downloads,
        this.collections,
        this.likes,
        this.comments,
        this.userId,
        this.user,
        this.userImageURL,
        this.noAiTraining,
        this.isAiGenerated,
        this.isGRated,
        this.isLowQuality,
        this.userURL});

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
    noAiTraining = json['noAiTraining'];
    isAiGenerated = json['isAiGenerated'];
    isGRated = json['isGRated'];
    isLowQuality = json['isLowQuality'];
    userURL = json['userURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageURL'] = this.pageURL;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['previewURL'] = this.previewURL;
    data['previewWidth'] = this.previewWidth;
    data['previewHeight'] = this.previewHeight;
    data['webformatURL'] = this.webformatURL;
    data['webformatWidth'] = this.webformatWidth;
    data['webformatHeight'] = this.webformatHeight;
    data['largeImageURL'] = this.largeImageURL;
    data['imageWidth'] = this.imageWidth;
    data['imageHeight'] = this.imageHeight;
    data['imageSize'] = this.imageSize;
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    data['collections'] = this.collections;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['user_id'] = this.userId;
    data['user'] = this.user;
    data['userImageURL'] = this.userImageURL;
    data['noAiTraining'] = this.noAiTraining;
    data['isAiGenerated'] = this.isAiGenerated;
    data['isGRated'] = this.isGRated;
    data['isLowQuality'] = this.isLowQuality;
    data['userURL'] = this.userURL;
    return data;
  }
}