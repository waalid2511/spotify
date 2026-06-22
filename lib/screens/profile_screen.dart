import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpotifyColors.background,
      appBar: AppBar(
        backgroundColor: SpotifyColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: SpotifyColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: SpotifyColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 32),
            _buildPlaylists(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('assets/images/profile_pic.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'ABDUL WALID THOHIR', // Will match any user
            style: TextStyle(
              color: SpotifyColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '23 Followers',
                style: TextStyle(
                  color: SpotifyColors.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '•',
                style: TextStyle(
                  color: SpotifyColors.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '45 Following',
                style: TextStyle(
                  color: SpotifyColors.lightGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: SpotifyColors.white,
              side: const BorderSide(color: SpotifyColors.lightGrey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            ),
            child: const Text('Edit profile', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: SpotifyColors.white,
              side: const BorderSide(color: SpotifyColors.lightGrey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            ),
            child: const Text('Share', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylists() {
    final List<Map<String, String>> playlists = [
      {'title': 'My Playlist #1', 'followers': '10 likes', 'image': 'assets/images/album_cover_1.png'},
      {'title': 'Chill', 'followers': '5 likes', 'image': 'assets/images/album_cover_2.png'},
      {'title': 'Workout', 'followers': '2 likes', 'image': 'assets/images/album_cover_1.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Playlists',
            style: TextStyle(
              color: SpotifyColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(
                playlists[index]['image']!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
              title: Text(
                playlists[index]['title']!,
                style: const TextStyle(
                  color: SpotifyColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Playlist • ${playlists[index]['followers']}',
                style: const TextStyle(
                  color: SpotifyColors.lightGrey,
                  fontSize: 14,
                ),
              ),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
