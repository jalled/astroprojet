import '../model/story_model.dart';
import '../model/user_model.dart';

const User user = User(
  name: 'presence.fit',
  profileImageUrl:
      'https://images.hindustantimes.com/img/2022/03/20/1600x900/Virgo_(1)_1647797094427_1647797132508.jpg',
);

const List<Story> stories = [
  Story(
    url:
        'https://www.astro-seek.com/seek-images/tarostrology-tarot-astrology-thumb.jpg',
    media: MediaType.image,
    user: user,
    duration: Duration(seconds: 5),
  ),
  Story(
    url: 'assets/icon2.svg',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
  ),
  Story(
    url: 'assets/icon2.svg',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
  ),
  Story(
    url:
        'https://www.astro-seek.com/seek-images/tarostrology-tarot-astrology-thumb.jpg',
    media: MediaType.image,
    duration: Duration(seconds: 5),
    user: user,
  ),
  Story(
    url: 'assets/icon2.svg',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
  ),
];
List<UserStoryList> storyListUser = [
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit 1',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit 2',
        profileImageUrl:
            'https://www.iwmbuzz.com/wp-content/uploads/2021/02/5-myths-rumours-about-zodiac-sign-virgo.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit 3',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit 4',
        profileImageUrl:
            'https://res.cloudinary.com/medoucine/image/upload/%24wpsize_!large!,w_683,h_1024,c_scale/v1/photo-1516589178581-6cd7833ae3b2',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit 5',
        profileImageUrl: 'https://www.diana-voyance.fr/images/compat_amour.png',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'The Flutter Pro fit 6',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
];

class UserStoryList {
  List<Story> story;
  User user;

  UserStoryList({required this.story, required this.user});
}
