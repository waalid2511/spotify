import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // We only implement Home and Profile to match the request exactly, 
  // but to keep the navigation bar realistic, we add placeholder screens.
  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Search', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Your Library', style: TextStyle(color: Colors.white))),
    // Note: User wants Profile. Profile is usually accessed from the Home screen's top-left avatar,
    // but sometimes premium or something is on the right. 
    // We will build the ProfileScreen so it can be navigated to.
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpotifyColors.background,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: SpotifyColors.navBackground,
          selectedItemColor: SpotifyColors.white,
          unselectedItemColor: SpotifyColors.lightGrey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined), // closest to Your Library
              label: 'Your Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium_outlined), // premium
              label: 'Premium',
            ),
          ],
        ),
      ),
    );
  }
}
