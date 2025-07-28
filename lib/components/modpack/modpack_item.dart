import 'package:flutter/material.dart';
import 'package:lib_boloto_launcher/pages.dart';
// import 'package:lib_boloto_launcher/theme/boloto_theme.dart';

class ModpackItem extends StatelessWidget {
  final PageType page;
  final String name;
  final PageType selected;
  final bool isClickable;
  bool get isSelected => page == selected;
  final void Function(PageType)? onTap;
  final String? imagePath;

  const ModpackItem({
    super.key,
    required this.page,
    required this.name,
    required this.selected,
    required this.onTap,
    this.imagePath,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: isClickable ? () => onTap?.call(page) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : Border.all(color: Colors.transparent),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              (isClickable
                  ? Image.asset(
                      imagePath ?? 'assets/images/echoes_icon.png',
                      width: 40,
                      height: 40,
                      color: isSelected
                          ? Theme.of(context).textTheme.bodyMedium?.color
                          : Colors.grey[300],
                    )
                  : Icon(Icons.av_timer, size: 40, color: Colors.grey)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Theme.of(context).textTheme.bodyMedium?.color
                        : Colors.grey[300],
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
