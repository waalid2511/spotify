import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/widgets/album_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2A2A2A), // Lighter grey for top gradient
            SpotifyColors.background,
          ],
          begin: Alignment.topLeft,
          end: FractionalOffset(0.0, 0.3),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(context),
            ),
            SliverToBoxAdapter(
              child: _buildFilters(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              sliver: _buildRecentGrid(),
            ),
            SliverToBoxAdapter(
              child: _buildSection('To get you started', [
                {'title': 'Daily Mix 1', 'subtitle': 'Made for You', 'image': 'assets/images/album_cover_1.png'},
                {'title': 'Discover Weekly', 'subtitle': 'New music updated every Friday.', 'image': 'assets/images/album_cover_2.png'},
                {'title': 'Release Radar', 'subtitle': 'Catch up on the latest releases.', 'image': 'assets/images/album_cover_1.png'},
                {'title': 'On Repeat', 'subtitle': 'Songs you love right now.', 'image': 'assets/images/album_cover_2.png'},
              ]),
            ),
            SliverToBoxAdapter(
              child: _buildSection('More of what you like', [
                {'title': 'Top Gaming Tracks', 'subtitle': 'Level up with the best gaming music.', 'image': 'assets/images/album_cover_1.png'},
                {'title': 'Rock Classics', 'subtitle': 'Rock legends & epic songs that continue to inspire generations.', 'image': 'assets/images/album_cover_2.png'},
                {'title': 'All Out 2010s', 'subtitle': 'The biggest songs of the 2010s.', 'image': 'assets/images/album_cover_1.png'},
                {'title': 'Soft Pop Hits', 'subtitle': 'Listen to easy songs from your favorite artists!', 'image': 'assets/images/album_cover_2.png'},
              ]),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 32),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Good morning',
              style: TextStyle(
                color: SpotifyColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: SpotifyColors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.history, color: SpotifyColors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: SpotifyColors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildFilterChip('All', true),
          const SizedBox(width: 8),
          _buildFilterChip('Music', false),
          const SizedBox(width: 8),
          _buildFilterChip('Podcasts', false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? SpotifyColors.primaryGreen : SpotifyColors.darkGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? SpotifyColors.black : SpotifyColors.white,
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildRecentGrid() {
    final List<Map<String, String>> recents = [
      {'title': 'Liked Songs', 'image': 'assets/images/album_cover_1.png'},
      {'title': 'Daily Mix 1', 'image': 'assets/images/album_cover_2.png'},
      {'title': 'Top 50 - Global', 'image': 'assets/images/album_cover_1.png'},
      {'title': 'Discover Weekly', 'image': 'assets/images/album_cover_2.png'},
      {'title': 'Lofi Beats', 'image': 'assets/images/album_cover_2.png'},
      {'title': 'Chill Vibes', 'image': 'assets/images/album_cover_1.png'},
    ];

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return RecentItemCard(
            title: recents[index]['title']!,
            imageUrl: recents[index]['image']!,
          );
        },
        childCount: recents.length,
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              color: SpotifyColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return AlbumCard(
                title: items[index]['title']!,
                subtitle: items[index]['subtitle'],
                imageUrl: items[index]['image']!,
                size: 140,
              );
            },
          ),
        ),
      ],
    );
  }
}
