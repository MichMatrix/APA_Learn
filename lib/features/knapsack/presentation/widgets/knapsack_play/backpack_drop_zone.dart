import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/utils/extensions/context_media_query_ext.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../data/models/item_model.dart';

class BackpackDropZone extends StatefulWidget {
  final bool Function(ItemModel) onItemDropped;

  const BackpackDropZone({
    super.key,
    required this.onItemDropped,
  });

  @override
  State<BackpackDropZone> createState() => _BackpackDropZoneState();
}

class _BackpackDropZoneState extends State<BackpackDropZone>
    with SingleTickerProviderStateMixin {
  bool hovering = false;
  late final AnimationController _shake;
  late final Animation<double> _dx;

  @override
  void initState() {
    super.initState();
    _shake = AnimationController(vsync: this, duration: const Duration(milliseconds: 360));
    _dx = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _shake, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _shake.dispose();
    super.dispose();
  }

  void _reject() {
    _shake.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return DragTarget<ItemModel>(
      onWillAccept: (_) {
        setState(() => hovering = true);
        return true;
      },
      onLeave: (_) => setState(() => hovering = false),
      onAccept: (item) {
        setState(() => hovering = false);
        final ok = widget.onItemDropped(item);
        if (!ok) _reject();
      },
      builder: (_, __, ___) {
        return AnimatedBuilder(
          animation: _shake,
          builder: (_, __) {
            return Transform.translate(
              offset: Offset(_dx.value, 0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: hovering ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: hovering ? AppColors.primary.withOpacity(0.45) : AppColors.border,
                    width: hovering ? 2 : 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/knapsack/backpack.png',
                      height: context.h * 0.095,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.backpack_rounded, size: 120),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      hovering ? t.knapsackPlayDropHere : t.knapsackPlayDragItemstoTheBag,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
