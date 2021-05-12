import 'package:dragablegridview_flutter/dragablegridviewbin.dart';

List<Media> mediaList = [
  Media(id: '1', longURL: 'assets/images/dogs/dog1.jpeg', order: 1),
  Media(id: '2', longURL: 'assets/images/dogs/dog2.jpeg', order: 2),
  Media(id: '3', longURL: 'assets/images/dogs/dog3.jpeg', order: 3),
  Media(id: '4', longURL: 'assets/images/dogs/dog4.jpeg', order: 4),
  Media(id: '5', longURL: 'assets/images/dogs/dog5.jpeg', order: 5),
  Media(id: '6', longURL: 'assets/images/dogs/dog6.jpeg', order: 6),
];

class Media extends DragAbleGridViewBin{
  String id;
  int order;
  String longURL;

  Media({
    required this.id,
    required this.longURL,
    required this.order,
  });

  factory Media.fromJson(Map<String, dynamic> data) {
    return Media(id: data['id'], longURL: data['long_url'], order: 1);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "order": order,
    };
  }
}

class UserMedia {
  List<Media> userMedia;

  UserMedia({required this.userMedia});

  factory UserMedia.fromJson(Map<String, dynamic> data) {
    return UserMedia(
      userMedia: List<Media>.from(
        data['user_media'].map((e) => Media.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "media": List<dynamic>.from(
        userMedia.map((e) => e.toJson()),
      ),
    };
  }
}

class MediaResponse {
  bool success;
  UserMedia data;
  MediaResponse({
    required this.data,
    required this.success,
  });

  factory MediaResponse.fromJson(Map<String, dynamic> data) {
    return MediaResponse(
      success: data['success'],
      data: UserMedia.fromJson(data['data']),
    );
  }
}
