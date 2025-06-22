import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String profImage;
  final String username;
  final DateTime datePublished;
  final String postUrl;
  final String postId;
  final likes;

  const Post({
    required this.description,
    required this.username,
    required this.datePublished,
    required this.likes,
    required this.postId,
    required this.postUrl,
    required this.uid,
    required this.profImage,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "profImage": profImage,
    "postUrl": postUrl,
    "postId": postId,
    "description": description,
    "datepublished": datePublished,
    "likes": likes,
  };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'] ?? '',
      postUrl: snapshot['postUrl'] ?? '',
      postId: snapshot['postId'] ?? '',
      description: snapshot['description'] ?? '',
      datePublished: snapshot['datePublished'] ?? [],
      profImage: snapshot['profImage'] ?? [],
      uid: snapshot['uid'] ?? '',
      likes: snapshot['likes'] ?? '',
    );
  }
}
