import 'dart:developer';

import 'package:graphql/client.dart';
import 'package:topit_feed_page/service/post_model.dart';

import '../core/constants.dart';
import 'graphql_client.dart';

class ApiService {
  List<Post> _allPosts = [];

  static List<String> _videos = [];

  final GraphQLClient _client = getGraphQLClient(token: testToken);

  ///  api call
  Future<List<String>> getVideos({int id = 0}) async {
    _videos = await getAllPosts();
    // No more videos
    if ((id >= _videos.length)) {
      return [];
    }

    await Future.delayed(const Duration(seconds: kLatency));

    if ((id + kNextLimit >= _videos.length)) {
      return _videos.sublist(id, _videos.length);
    }

    return _videos.sublist(id, id + kNextLimit);
  }

  getAllPosts() async {
    _allPosts = [];
    final response = await _client.query(
      QueryOptions(
        document: gql(getAllPostsquery),
      ),
    );
    for (var result in response.data!["getAllPosts"]) {
      _allPosts.add(Post.fromJson(result));

      if(result['mediaType']== 'video'){
      _videos.add(result['imageUrl']);
      log(result['imageUrl'].toString());


      }
    }

    return _videos;
  }

  String getAllPostsquery = r'''
query {
  getAllPosts(isChallenge:false) {
    _id
    userId
    description
    imageUrl
    songName
    mediaType
    isRemix
    challenges
    isChallenge
    duration
    songUrl
    votes
    comments
   relatedPostIds{
    _id
    }
    title
    applauds
    createdAt
    visibility
    isSponsored
    isLive
    isLiveEnded
    userId
    thumbnailUrl
    
  }
}
''';
}
