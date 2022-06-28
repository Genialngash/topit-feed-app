//posts in each challenge
class Post  {
  String? title;
  String? sId;
  int? coin;
  String? description;
  bool? comments;
  String? songUrl;
  String? songName;
  String? imageUrl;
  String? mediaType;
  bool? isLive;
  bool? isLiveEnded;
  String? thumbnailUrl;
  bool? isHighlight;
  bool? isPrivate;
  List<dynamic>? votes;
  List<String>? applauds;

  // void setController({VideoPlayerController? controller}) {
  //   vController = controller;
  // }

  Post(
      {this.title,
      this.sId,
      this.coin,
      this.isLive,
      this.isLiveEnded,
      this.description,
      this.comments,
      this.songUrl = '',
      this.imageUrl = '',
      this.thumbnailUrl = '',
      this.mediaType = '',
      this.songName = '',
      this.isHighlight,
      this.isPrivate,
      this.votes,
      this.applauds,
  
      });

  get totalapplauds {
    if (applauds == null) {
      return 0;
    } else {
      return applauds!.length;
    }
  }

  

  get totalvotes {
    if (votes == null) {
      return 0;
    } else {
      return votes!.length;
    }
  }

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isLive = json['isLive'] ?? false;
    isLiveEnded = json['isLiveEnded'] ?? true;
    sId = json['_id'];
    coin = json['coin'] ?? 0;
    description = json['description'] ?? '';
    comments = json['comments'] ?? true;
    songUrl = json['songUrl'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    mediaType = json['mediaType'];
    votes = json['votes'] ?? [];
    songName = json['songName'] ?? '';
    thumbnailUrl = json['thumbnailUrl'] ?? '';
    applauds = json['applauds'].cast<String>() ?? [];
    isHighlight = json['isHighlight'] ?? false;
    isPrivate = json['isPrivate'] ?? false;

    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['_id'] = sId;
    data['coin'] = coin;
    data['description'] = description;
    data['comments'] = comments;
    data['songUrl'] = songUrl;
    data['songName'] = songName;
    data['applauds'] = applauds;
    data['thumbnailUrl'] = thumbnailUrl;
    data['isHighlight'] = isHighlight;

   
    return data;
  }

  

//
}
