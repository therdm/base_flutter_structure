class SampleResponse {
  bool? success;
  int? totalPhotos;
  String? message;
  int? offset;
  int? limit;
  List<PhotosData>? photos;

  SampleResponse({this.success, this.totalPhotos, this.message, this.offset, this.limit, this.photos});

  SampleResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    totalPhotos = json['total_photos'];
    message = json['message'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['photos'] != null) {
      photos = <PhotosData>[];
      json['photos'].forEach((v) {
        photos!.add(PhotosData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['total_photos'] = totalPhotos;
    data['message'] = message;
    data['offset'] = offset;
    data['limit'] = limit;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhotosData {
  String? description;
  String? url;
  String? title;
  int? id;
  int? user;

  PhotosData({this.description, this.url, this.title, this.id, this.user});

  PhotosData.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    url = json['url'];
    title = json['title'];
    id = json['id'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['url'] = url;
    data['title'] = title;
    data['id'] = id;
    data['user'] = user;
    return data;
  }
}
