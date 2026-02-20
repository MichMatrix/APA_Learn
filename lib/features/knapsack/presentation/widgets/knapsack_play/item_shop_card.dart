import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/utils/extensions/context_media_query_ext.dart';
import '../../../data/models/item_model.dart';

class ItemShopCard extends StatelessWidget {
  final ItemModel item;

  const ItemShopCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const cardWidth = 120.0;
    final cardHeight = context.h * 0.178; 

    Widget card({required bool elevated}) => SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: _Card(item: item, elevated: elevated),
        );

    return Draggable<ItemModel>(
      data: item,
      feedback: Material(
        color: Colors.transparent,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(0.85)),
          child: Opacity(
            opacity: 0.92,
            child: card(elevated: true),
          ),
        ),
      ),

      childWhenDragging: Opacity(
        opacity: 0.35,
        child: card(elevated: false),
      ),

      child: card(elevated: false),
    );
  }
}

class _Card extends StatelessWidget {
  final ItemModel item;
  final bool elevated;

  const _Card({required this.item, this.elevated = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 14,
                  offset: const Offset(0, 10),
                )
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.asset,
            height: 46,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(Icons.inventory_2_outlined),
          ),
          const SizedBox(height: 10),
          Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.w900),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _MiniTag(icon: Icons.fitness_center_rounded, text: '${item.weight}'),
              const SizedBox(width: 3),
              _MiniTag(icon: Icons.star_rounded, text: '${item.value}', color: AppColors.success),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _MiniTag({
    required this.icon,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: c.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: c),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: c, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
