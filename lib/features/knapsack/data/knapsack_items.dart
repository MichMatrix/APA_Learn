import '../../../../l10n/app_localizations.dart';
import 'models/item_model.dart';

class KnapsackItems {
  static const items = <ItemModel>[
    ItemModel(id: 'coin', name: 'Coin', weight: 1, value: 3, asset: 'assets/items/coin.png'),
    ItemModel(id: 'gem', name: 'Gem', weight: 2, value: 8, asset: 'assets/items/gem.png'),
    ItemModel(id: 'book', name: 'Book', weight: 3, value: 5, asset: 'assets/items/book.png'),
    ItemModel(id: 'phone', name: 'Phone', weight: 2, value: 6, asset: 'assets/items/phone.png'),
    ItemModel(id: 'watch', name: 'Watch', weight: 1, value: 4, asset: 'assets/items/watch.png'),
    ItemModel(id: 'tablet', name: 'Tablet', weight: 3, value: 7, asset: 'assets/items/tablet.png'),
    ItemModel(id: 'kindle', name: 'Kindle', weight: 2, value: 5, asset: 'assets/items/kindle.png'),
    ItemModel(id: 'headphone', name: 'Headphone', weight: 2, value: 4, asset: 'assets/items/headphone.png'),
    ItemModel(id: 'glass_vr', name: 'VR', weight: 4, value: 9, asset: 'assets/items/glass_vr.png'),
    ItemModel(id: 'console', name: 'Console', weight: 5, value: 10, asset: 'assets/items/console.png'),
  ];

  static String nameOf(AppLocalizations t, ItemModel item) {
    switch (item.id) {
      case 'coin':
        return t.knapsackItemCoin;
      case 'gem':
        return t.knapsackItemGem;
      case 'book':
        return t.knapsackItemBook;
      case 'phone':
        return t.knapsackItemPhone;
      case 'watch':
        return t.knapsackItemWatch;
      case 'tablet':
        return t.knapsackItemTablet;
      case 'kindle':
        return t.knapsackItemKindle;
      case 'headphone':
        return t.knapsackItemHeadphone;
      case 'glass_vr':
        return t.knapsackItemVR;
      case 'console':
        return t.knapsackItemConsole;
      default:
        return item.name; 
    }
  }
}
