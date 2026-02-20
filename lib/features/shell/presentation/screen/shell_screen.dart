import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import '../../../../core/update/app_upgrade.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/colors/app_colors.dart';
import '../controller/app_settings_controller.dart';
import '../../../../core/navigation/shell_nav_controller.dart';

import '../../../home/presentation/home_screen.dart';
import '../../../profile/presentation/profile_screen.dart';
import '../../../settings/presentation/settings_screen.dart';


class ShellScreen extends StatefulWidget {
  final AppSettingsController settings;
  final ShellNavController nav;

  const ShellScreen({
    super.key,
    required this.settings,
    required this.nav,
  });

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final pages = <Widget>[
      HomeScreen(nav: widget.nav),
      const ProfileScreen(),
      SettingsScreen(settings: widget.settings),
    ];

    return UpgradeAlert(
      upgrader: AppUpgrade.upgrader(context: context),

      barrierDismissible: false,

      child: AnimatedBuilder(
        animation: widget.nav,
        builder: (_, __) {
          final index = widget.nav.index;

          return Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 260),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (child, animation) {
                final fade = FadeTransition(opacity: animation, child: child);
                final slide = SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.02, 0.02),
                    end: Offset.zero,
                  ).animate(animation),
                  child: fade,
                );
                return slide;
              },
              child: KeyedSubtree(
                key: ValueKey(index),
                child: pages[index],
              ),
            ),
            bottomNavigationBar: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                child: _FloatingNavBar(
                  selectedIndex: index,
                  onSelected: widget.nav.setIndex,
                  labels: (t.home, t.profile, t.settings),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class _FloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final (String, String, String) labels;

  const _FloatingNavBar({
    required this.selectedIndex,
    required this.onSelected,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: 68,
            backgroundColor: AppColors.surface,
            indicatorColor: AppColors.primary.withOpacity(0.12),

            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
              final selected = states.contains(MaterialState.selected);
              return TextStyle(
                fontFamily: 'Poppins',
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                fontSize: 12,
                color: selected ? AppColors.primary : AppColors.textMuted,
              );
            }),

            iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((states) {
              final selected = states.contains(MaterialState.selected);
              return IconThemeData(
                size: 24,
                color: selected ? AppColors.primary : AppColors.textMuted,
              );
            }),
          ),
          child: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelected,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home_rounded),
                label: labels.$1,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person_rounded),
                label: labels.$2,
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings_rounded),
                label: labels.$3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
