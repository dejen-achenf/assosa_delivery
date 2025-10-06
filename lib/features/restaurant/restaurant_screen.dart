import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: scheme.surface,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
              pinned: true,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/image.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Popular'),
                  Tab(text: 'Main Courses'),
                  Tab(text: 'Appetizer'),
                  Tab(text: 'Pizza & Pasta'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _HeaderDetails(),
            ),
          ],
          body: const TabBarView(
            children: [
              _PopularTab(),
              _PlaceholderTab(label: 'Main Courses'),
              _PlaceholderTab(label: 'Appetizer'),
              _PlaceholderTab(label: 'Pizza & Pasta'),
            ],
          ),
        ),
        bottomNavigationBar: _CartPreview(),
      ),
    );
  }
}

class _HeaderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      color: scheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bottega Ristorante',
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text('Italian • Fairgrounds, SCBD, Jakarta',
              style: textTheme.bodyMedium
                  ?.copyWith(color: scheme.onSurfaceVariant)),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.star, size: 18, color: Colors.amber.shade700),
              const SizedBox(width: 6),
              Text('4.8', style: textTheme.labelLarge),
              const SizedBox(width: 6),
              Text('(99+ reviews)',
                  style: textTheme.labelLarge
                      ?.copyWith(color: scheme.onSurfaceVariant)),
              const SizedBox(width: 12),
              const _Dot(),
              const SizedBox(width: 12),
              Text('Menu variants: 6', style: textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 16),
              const SizedBox(width: 6),
              Text('49-89rb', style: textTheme.labelLarge),
              const SizedBox(width: 12),
              const _Dot(),
              const SizedBox(width: 12),
              const Icon(Icons.schedule, size: 16),
              const SizedBox(width: 6),
              Text('8AM–8PM', style: textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.place, size: 16),
              const SizedBox(width: 6),
              Text('4.6Km', style: textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _DiscountChip(label: 'F&B discount 75%'),
              _DiscountChip(label: 'Shipping discount 50%'),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _DiscountChip extends StatelessWidget {
  final String label;
  const _DiscountChip({required this.label});
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: scheme.onPrimaryContainer),
      ),
    );
  }
}

class _PopularTab extends StatelessWidget {
  const _PopularTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      children: const [
        _MenuCard(
          title: "Bottega’s Fried Rice",
          price: "Rp98.000",
          originalPrice: "Rp120.000",
          badge: "Extra discount",
        ),
        SizedBox(height: 12),
        _MenuCard(
          title: "Salmon with Beaur…",
          price: "Rp320.000",
        ),
        SizedBox(height: 12),
        _MenuCard(
          title: "Calamari",
          price: "Rp129.500",
        ),
        SizedBox(height: 12),
        _MenuCard(
          title: "Chicken Parmigiana",
          price: "Rp198.000",
        ),
      ],
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final String price;
  final String? originalPrice;
  final String? badge;
  const _MenuCard({
    required this.title,
    required this.price,
    this.originalPrice,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
            child: Image.asset(
              'assets/images/burger.png',
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        price,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      if (originalPrice != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          originalPrice!,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                      ],
                      const Spacer(),
                      if (badge != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            badge!,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                          ),
                        ),
                      const SizedBox(width: 8),
                      FilledButton(
                        onPressed: () {},
                        child: const Text('Add'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String label;
  const _PlaceholderTab({required this.label});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(label));
  }
}

class _CartPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '1 item • Rp129.000',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            label: const Text('View Cart'),
          )
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        shape: BoxShape.circle,
      ),
    );
  }
}
