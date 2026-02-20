import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../data/models/item_model.dart';

class SelectedItemsRow extends StatelessWidget {
  final List<ItemModel> items;
  final void Function(ItemModel) onRemove;

  const SelectedItemsRow({
    super.key,
    required this.items,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    if (items.isEmpty) {
      return  Padding(
        padding: EdgeInsets.only(top: 6),
        child: Text(
          t.knapsackPlayNoItemSelected,
          style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w700),
        ),
      );
    }

    return SizedBox(
      height: 78,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final item = items[i];
          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => onRemove(item),
            child: Container(
              width: 74,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item.asset,
                    height: 34,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(Icons.inventory_2_outlined),
                  ),
                  const SizedBox(height: 3.5),
                  Text(
                    t.knapsackPlayTap,
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
