import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

import 'package:lib_boloto_launcher/theme/boloto_theme.dart';

class PatchNote extends StatelessWidget {
  final String title;
  final String content;
  final String version;
  final String date;

  const PatchNote({
    super.key,
    required this.title,
    required this.content,
    required this.version,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: BolotoTheme.background.withOpacity(0.7),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(
                    color: BolotoTheme.secondaryAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(content, style: Theme.of(context).textTheme.bodyMedium),
                InkWell(
                  onTap: () async {
                    final url = Uri.parse("https://your-link.com");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: BolotoTheme.secondaryAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
