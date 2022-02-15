import 'package:social_network/models/post.dart';
import 'package:social_network/models/story.dart';
import 'package:social_network/models/user.dart';

final List<Post> posts = [
  Post(
    author: users[0],
    imageUrl:
        'https://images.unsplash.com/photo-1618742635442-be3ac353a7e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1250&q=80',
    likesCount: 12,
    commentsCount: 5,
    caption: 'This is a beautiful day in Portland!',
  ),
  Post(
    author: users[1],
    likesCount: 5,
    commentsCount: 0,
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  ),
  Post(
    author: users[2],
    commentsCount: 10,
    locationTag: 'Portland, OR',
  ),
  Post(
    author: users[3],
    imageUrl:
        'https://images.unsplash.com/photo-1632243985694-aebda88eb37d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1132&q=80',
  ),
  Post(
    author: users[4],
    likesCount: 5,
    commentsCount: 6,
    imageUrl:
        'https://images.unsplash.com/photo-1643720375812-7a09248a4f52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  ),
];

const List<User> users = [
  User(
    name: 'Fredrick Hendrickson',
    imageUrl:
        'https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1187&q=80',
  ),
  User(
    name: 'Pink Floyd',
    imageUrl:
        'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
  ),
  User(
    name: 'Sister Jamie',
    imageUrl:
        'https://images.unsplash.com/photo-1627910002390-9312430eabf3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1195&q=80',
  ),
  User(
    name: 'Jaylah',
    imageUrl:
        'https://images.unsplash.com/photo-1635594824570-47c9e38095eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
  ),
  User(
    name: 'Mayweather Hurricane',
    imageUrl:
        'https://images.unsplash.com/photo-1541576980233-97577392db9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1184&q=80',
  ),
];

const User currentUser = User(
  name: 'Current User',
  imageUrl:
      'https://images.unsplash.com/photo-1490650034439-fd184c3c86a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
);

final List<Story> stories = [
  Story(
    id: 'storyIdA',
    imageUrl:
        'https://images.unsplash.com/photo-1601572420755-16a9f0677102?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    author: users[0],
  ),
  Story(
    id: 'storyIdB',
    imageUrl:
        'https://images.unsplash.com/photo-1530519486016-6ebc8a343be5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    author: users[1],
  ),
  Story(
    id: 'storyIdC',
    imageUrl:
        'https://images.unsplash.com/photo-1591079759943-d860fa280b9c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    author: users[2],
  ),
  Story(
    id: 'storyIdD',
    imageUrl:
        'https://images.unsplash.com/photo-1511627916459-4c0c5863603c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    author: users[3],
  ),
  Story(
    id: 'storyIdE',
    imageUrl:
        'https://images.unsplash.com/photo-1602169376841-fc7c79742eb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    author: users[4],
  ),
];
