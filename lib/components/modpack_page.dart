import 'package:flutter/material.dart';
import 'package:lib_boloto_launcher/theme/boloto_theme.dart';
import 'dart:ui';
import 'package:lib_boloto_launcher/components/patch-notes-section.dart';

class ModpackData {
  final int id;
  final String title;
  final String description;
  final String logoPath;
  final String bgPath;

  ModpackData({
    required this.id,
    required this.title,
    required this.description,
    required this.logoPath,
    required this.bgPath,
  });
}

final List<ModpackData> modpacks = [
  ModpackData(
    id: 0,
    title: "Echoes Untamed",
    description:
        "A thrilling adventure awaits in Echoes Untamed. Explore vast worlds, conquer challenges, and uncover secrets. Join the journey today!",
    logoPath: "assets/images/echoes_logo.png",
    bgPath: "assets/images/echoes_bg.png",
  ),
];

class ModpackPage extends StatelessWidget {
  final int id;

  const ModpackPage({super.key, required this.id});

  ModpackData get modpack => modpacks.firstWhere((modpack) => modpack.id == id);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/echoes_bg.png',
                fit: BoxFit.cover,
              ),
            ),
            // Vignette overlay
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.8,
                    colors: const [
                      Color.fromRGBO(0, 0, 0, 0.0),
                      Color.fromRGBO(0, 0, 0, 0.55),
                    ],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),
            ),
            // Your foreground content
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  // Top area with logo
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/echoes_logo.png',
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Spacer to push play/info to bottom
                  Expanded(child: Container()),

                  // Bottom row: play + info + updates
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Play/info/description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                            label: Text("Play"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Odessa Server · 🟢 Online"),
                          const SizedBox(height: 4),
                          Container(
                            width: 500,
                            child: Text(
                              modpack.description,
                              style: TextStyle(
                                color: BolotoTheme.textOnDark,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Spacer(),

                      // Patch notes link
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 300,
                              color: BolotoTheme.background.withOpacity(0.3),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.update,
                                        color: BolotoTheme.textOnDark,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        "Recent Updates",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  PatchNotesSection(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
