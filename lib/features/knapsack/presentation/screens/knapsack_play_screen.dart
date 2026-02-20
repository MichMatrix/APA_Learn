import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../app/routes/routes.dart';
import '../../../../l10n/app_localizations.dart';

import '../../controller/knapsack_controller.dart';
import '../../data/models/item_model.dart';
import '../../data/models/knapsack_difficulty.dart';
import '../../data/models/shop_offer.dart';

import '../widgets/knapsack_play/backpack_drop_zone.dart';
import '../widgets/capacity_bar.dart';
import '../widgets/knapsack_play/item_shop_card.dart';
import '../widgets/knapsack_play/selected_items_row.dart';
import '../widgets/knapsack_play/value_chip.dart';

class KnapsackPlayScreen extends StatefulWidget {
  static const route = '/play-screen';

  final int capacity;
  final String difficultyId;

  const KnapsackPlayScreen({
    super.key,
    required this.capacity,
    required this.difficultyId,
  });

  @override
  State<KnapsackPlayScreen> createState() => _KnapsackPlayScreenState();
}

class _KnapsackPlayScreenState extends State<KnapsackPlayScreen> {
  late final KnapsackController controller;

  late final KnapsackDifficulty difficulty;

  /// Ofertas únicas (sem repetição visual)
  late final List<ShopOffer> offers;

  /// Estoque por itemId
  late final Map<String, int> stockById;

  /// Lista expandida (com repetição por qty) para o DP do Result
  late final List<ItemModel> dpItems;

  Timer? _timer;
  int _secondsLeft = 0;

  final ScrollController _shopScroll = ScrollController();
  bool _showScrollHint = true;

  bool _canGoLeft = false;
  bool _canGoRight = false;

  static const double _cardWidth = 120.0;
  static const double _gap = 12.0;
  static const double _jump = _cardWidth + _gap;

  late final AudioPlayer _sfxPlayer;

  @override
  void initState() {
    super.initState();

    difficulty = KnapsackDifficultyX.fromId(widget.difficultyId);
    controller = KnapsackController(capacity: widget.capacity);

    // 1) ofertas do nível
    offers = difficulty.shopOffers();

    // 2) estoque por item
    stockById = {
      for (final o in offers) o.item.id: o.qty,
    };

    // 3) lista expandida pro DP (respeita qty no ótimo)
    dpItems = offers
        .expand((o) => List.generate(o.qty, (_) => o.item))
        .toList();

    _shopScroll.addListener(_updateScrollAffordance);

    // audio
    _sfxPlayer = AudioPlayer();
    _preloadSfx();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollAffordance();
      _runMicroHint();
    });

    if (difficulty.hasTimer) {
      _secondsLeft = 60;
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (!mounted) return;
        setState(() {
          _secondsLeft--;
          if (_secondsLeft <= 0) {
            _timer?.cancel();
            _goResult();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _shopScroll.removeListener(_updateScrollAffordance);
    _shopScroll.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _preloadSfx() async {
    try {
      // NO audioplayers: não use "assets/" aqui
      await _sfxPlayer.setSource(AssetSource('audio/pick.mp3'));
    } catch (e) {
      debugPrint('SFX preload error: $e');
    }
  }

  Future<void> _playAddSfx() async {
    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('audio/pick.mp3'), volume: 0.4);
    } catch (e) {
      debugPrint('SFX add error: $e');
    }
  }

  Future<void> _playFailSfx() async {
    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('audio/pick.mp3'), volume: 0.4);
    } catch (e) {
      debugPrint('SFX fail error: $e');
    }
  }

  void _updateScrollAffordance() {
    if (!_shopScroll.hasClients) return;

    final pos = _shopScroll.position;
    final canLeft = pos.pixels > 1;
    final canRight = pos.pixels < (pos.maxScrollExtent - 1);

    if (_canGoLeft != canLeft || _canGoRight != canRight) {
      setState(() {
        _canGoLeft = canLeft;
        _canGoRight = canRight;
      });
    }

    if (_showScrollHint && pos.pixels > 12) {
      setState(() => _showScrollHint = false);
    }
  }

  Future<void> _runMicroHint() async {
    if (!_shopScroll.hasClients) return;

    if (_shopScroll.position.maxScrollExtent <= 0) {
      setState(() => _showScrollHint = false);
      return;
    }

    await Future.delayed(const Duration(milliseconds: 250));
    if (!mounted || !_shopScroll.hasClients) return;
    if (!_showScrollHint) return;

    final start = _shopScroll.offset;
    final forward = (start + 20).clamp(0.0, _shopScroll.position.maxScrollExtent);

    await _shopScroll.animateTo(
      forward,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
    if (!mounted || !_shopScroll.hasClients) return;

    await _shopScroll.animateTo(
      start,
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeInOutCubic,
    );

    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    if (_showScrollHint) setState(() => _showScrollHint = false);
  }

  String _hintText(AppLocalizations t) {
    return switch (difficulty) {
      KnapsackDifficulty.beginner => t.knapsackPlayHintBeginner,
      KnapsackDifficulty.intermediate => t.knapsackPlayHintIntermediate,
      KnapsackDifficulty.advanced => t.knapsackPlayHintAdvanced,
    };
  }

  void _handleRemove(ItemModel item) {
    final removed = controller.removeOne(item);
    if (!removed) return;

    // devolve 1 unidade pro estoque
    final current = stockById[item.id] ?? 0;
    stockById[item.id] = current + 1;

    setState(() {});
  }


  void _goResult() {
    _timer?.cancel();
    Navigator.pushNamed(
      context,
      AppRoutes.knapsackResult,
      arguments: {
        'capacity': controller.state.capacity,
        'selected': controller.state.selected,
        'difficulty': difficulty.id,
        // IMPORTANTE: manda a lista expandida pro DP considerar qty
        'items': dpItems,
      },
    );
  }

  void _reset() {
    controller.reset();

    // reset estoque
    setState(() {
      stockById = {for (final o in offers) o.item.id: o.qty};
    });

    if (difficulty.hasTimer) {
      setState(() => _secondsLeft = 60);
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (!mounted) return;
        setState(() {
          _secondsLeft--;
          if (_secondsLeft <= 0) {
            _timer?.cancel();
            _goResult();
          }
        });
      });
    }

    if (offers.length > 3) {
      setState(() => _showScrollHint = true);
    }

    if (_shopScroll.hasClients) {
      _shopScroll.jumpTo(0);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateScrollAffordance();
        _runMicroHint();
      });
    }
  }

  Future<void> _jumpShop(double delta) async {
    if (!_shopScroll.hasClients) return;
    final max = _shopScroll.position.maxScrollExtent;
    final next = (_shopScroll.offset + delta).clamp(0.0, max);

    await _shopScroll.animateTo(
      next,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  bool _handleDrop(ItemModel item) {
    final left = stockById[item.id] ?? 0;
    if (left <= 0) {
      _playFailSfx();
      return false;
    }

    final before = controller.state.selected.length;

    controller.tryAdd(item);

    final after = controller.state.selected.length;
    final ok = after > before;

    if (ok) {
      stockById[item.id] = left - 1;
      _playAddSfx();
      setState(() {}); // atualiza badge qty e “disabled”
      return true;
    } else {
      _playFailSfx();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${t.knapsackPlayTitle} • ${difficulty.title(t)}'),
        actions: [
          if (difficulty.hasTimer)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(
                    '${t.knapsackPlayTimerPrefix} $_secondsLeft ${t.knapsackPlayTimerSuffix}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          IconButton(
            tooltip: t.knapsackPlayResetTooltip,
            onPressed: _reset,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          final st = controller.state;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Expanded(child: CapacityBar(used: st.usedWeight, capacity: st.capacity)),
                        const SizedBox(width: 12),
                        ValueChip(value: st.totalValue),
                      ],
                    ),
                  ),
                ),

                if (difficulty.showHints) ...[
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(Icons.tips_and_updates_rounded),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _hintText(t),
                              style: const TextStyle(fontWeight: FontWeight.w700, height: 1.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 12),
                ],

                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.18,
                          child: Image.asset(
                            'assets/images/background/pack_person_looking_sun.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                          ),
                        ),
                      ),
                      Center(
                        child: BackpackDropZone(
                          onItemDropped: (item) => _handleDrop(item),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    t.knapsackPlaySelectedTitle,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 8),
                SelectedItemsRow(
                  items: st.selected,
                  onRemove: _handleRemove,
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${t.knapsackPlayAvailableTitle} • ${offers.length}',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    IconButton(
                      tooltip: t.knapsackPlayJumpLeftTooltip,
                      onPressed: _canGoLeft ? () => _jumpShop(-_jump) : null,
                      icon: const Icon(Icons.chevron_left_rounded),
                    ),
                    IconButton(
                      tooltip: t.knapsackPlayJumpRightTooltip,
                      onPressed: _canGoRight ? () => _jumpShop(_jump) : null,
                      icon: const Icon(Icons.chevron_right_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 7),

                _ShopRow(
                  controller: _shopScroll,
                  offers: offers,
                  stockById: stockById,
                  showHint: _showScrollHint,
                  hintLabel: t.knapsackPlayScrollHintLabel,
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: st.selected.isEmpty ? null : _goResult,
                    icon: const Icon(Icons.check_rounded),
                    label: Text(t.knapsackPlayFinishCta),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ShopRow extends StatelessWidget {
  final ScrollController controller;
  final List<ShopOffer> offers;
  final Map<String, int> stockById;
  final bool showHint;
  final String hintLabel;

  const _ShopRow({
    required this.controller,
    required this.offers,
    required this.stockById,
    required this.showHint,
    required this.hintLabel,
  });

  @override
  Widget build(BuildContext context) {
    const height = 150.0;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Scrollbar(
            controller: controller,
            thumbVisibility: false,
            child: ListView.separated(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 4, right: 4),
              itemCount: offers.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final offer = offers[i];
                final left = stockById[offer.item.id] ?? 0;
                final disabled = left <= 0;

                return Opacity(
                  opacity: disabled ? 0.45 : 1.0,
                  child: Stack(
                    children: [
                      IgnorePointer(
                        ignoring: disabled,
                        child: ItemShopCard(item: offer.item),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: _QtyPill(qty: left),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (showHint)
            Positioned(
              right: 6,
              top: 0,
              bottom: 0,
              child: IgnorePointer(child: _ScrollHintArrow(label: hintLabel)),
            ),
        ],
      ),
    );
  }
}

class _QtyPill extends StatelessWidget {
  final int qty;
  const _QtyPill({required this.qty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.90),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(
        'x$qty',
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
      ),
    );
  }
}

class _ScrollHintArrow extends StatefulWidget {
  final String label;
  const _ScrollHintArrow({required this.label});

  @override
  State<_ScrollHintArrow> createState() => _ScrollHintArrowState();
}

class _ScrollHintArrowState extends State<_ScrollHintArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _x;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
    _x = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _c, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;

    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(_x.value, 0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: bg.withOpacity(0.75),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.swipe_left_rounded, size: 18),
                const SizedBox(width: 6),
                const Icon(Icons.chevron_right_rounded, size: 18),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
