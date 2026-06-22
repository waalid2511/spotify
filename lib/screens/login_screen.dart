import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpotifyColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Placeholder for Spotify Logo
              const Icon(
                Icons.music_note, // Using a music note as a placeholder icon
                color: SpotifyColors.white,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'Log in to Spotify',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: SpotifyColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              _buildSocialButton(
                icon: Icons.g_mobiledata,
                text: 'Continue with Google',
                onPressed: () => _navigateToMain(context),
              ),
              const SizedBox(height: 16),
              _buildSocialButton(
                icon: Icons.facebook,
                text: 'Continue with Facebook',
                onPressed: () => _navigateToMain(context),
              ),
              const SizedBox(height: 16),
              _buildSocialButton(
                icon: Icons.apple,
                text: 'Continue with Apple',
                onPressed: () => _navigateToMain(context),
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () => _navigateToMain(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: SpotifyColors.white,
                  side: const BorderSide(color: SpotifyColors.lightGrey),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: SpotifyColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign up for free',
                    style: TextStyle(
                      color: SpotifyColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: SpotifyColors.white,
        side: const BorderSide(color: SpotifyColors.lightGrey),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24), // Balance the icon size
        ],
      ),
    );
  }

  void _navigateToMain(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }
}
