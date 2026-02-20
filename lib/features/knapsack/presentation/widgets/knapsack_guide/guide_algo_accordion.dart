import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/utils/extensions/context_media_query_ext.dart';

class GuideAlgoAccordionItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> bullets;
  final String badge;
  final Color badgeColor;

  const GuideAlgoAccordionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.bullets,
    required this.badge,
    required this.badgeColor,
  });
}

class GuideAlgoAccordion extends StatelessWidget {
  final List<GuideAlgoAccordionItem> items;
  const GuideAlgoAccordion({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isSmall = context.isSmallPhone;

    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          _AlgoTile(item: items[i], dense: isSmall),
          if (i != items.length - 1) const SizedBox(height: 10),
        ]
      ],
    );
  }
}

class _AlgoTile extends StatelessWidget {
  final GuideAlgoAccordionItem item;
  final bool dense;

  const _AlgoTile({
    required this.item,
    required this.dense,
  });

  @override
  Widget build(BuildContext context) {
    final badgeBg = item.badgeColor.withOpacity(0.14);

    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: dense ? 12 : 14, vertical: 6),
          childrenPadding: EdgeInsets.fromLTRB(dense ? 12 : 14, 0, dense ? 12 : 14, 14),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          collapsedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          leading: Container(
            width: dense ? 40 : 44,
            height: dense ? 40 : 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(item.icon, color: AppColors.primary),
          ),
          title: Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              item.subtitle,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w700,
                height: 1.15,
              ),
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              item.badge,
              style: TextStyle(fontWeight: FontWeight.w900, color: item.badgeColor),
            ),
          ),
          children: [
            const SizedBox(height: 10),
            ...item.bullets.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  ', style: TextStyle(fontWeight: FontWeight.w900)),
                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(fontWeight: FontWeight.w700, height: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
