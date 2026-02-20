class ItemModel {
  final String id;
  final String name;
  final int weight;
  final int value;
  final String asset;

  const ItemModel({
    required this.id,
    required this.name,
    required this.weight,
    required this.value,
    required this.asset,
  });

  ItemModel copyWith({
    String? id,
    String? name,
    int? weight,
    int? value,
    String? asset,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      value: value ?? this.value,
      asset: asset ?? this.asset,
    );
  }
}
