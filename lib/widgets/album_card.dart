import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class AlbumCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subtitle;
  final double size;
  final bool isCircular;

  const AlbumCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.size = 140,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
              image: DecorationImage(
                image: imageUrl.startsWith('http') 
                    ? NetworkImage(imageUrl) as ImageProvider
                    : AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: SpotifyColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: const TextStyle(
                color: SpotifyColors.lightGrey,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ]
        ],
      ),
    );
  }
}

class RecentItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecentItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SpotifyColors.darkGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          imageUrl.startsWith('http')
              ? Image.network(
                  imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: SpotifyColors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
