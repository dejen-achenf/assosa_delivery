import 'package:flutter/material.dart';

class NearMeScreen extends StatelessWidget {
  const NearMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Near Me'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          _FilterBar(),
          const SizedBox(height: 12),
          RestaurantCard(
            imageAsset: 'assets/images/image.png',
            name: 'Bottega Ristorante',
            cuisine: 'Italian',
            rating: 4.8,
            distanceKm: 4.6,
            etaMinutes: 15,
            badges: const ['Extra discount', 'Free delivery'],
          ),
          const SizedBox(height: 12),
          RestaurantCard(
            imageAsset: 'assets/images/burger.png',
            name: 'SOULFOOD Jakarta',
            cuisine: 'Indonesian',
            rating: 4.7,
            distanceKm: 3.2,
            etaMinutes: 10,
            badges: const ['Extra discount'],
          ),
          const SizedBox(height: 12),
          RestaurantCard(
            imageAsset: 'assets/images/image.png',
            name: 'Greyhound Cafe',
            cuisine: 'Industrial cafe',
            rating: 4.2,
            distanceKm: 3.9,
            etaMinutes: 10,
            badges: const ['Free delivery'],
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          _FilterChip(label: 'Filter', icon: Icons.filter_list),
          SizedBox(width: 8),
          _FilterChip(label: 'Discount promo'),
          SizedBox(width: 8),
          _FilterChip(label: 'Recommended'),
          SizedBox(width: 8),
          _FilterChip(label: 'High Rating'),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  const _FilterChip({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: scheme.primary),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String imageAsset;
  final String name;
  final String cuisine;
  final double rating;
  final double distanceKm;
  final int etaMinutes;
  final List<String> badges;

  const RestaurantCard({
    super.key,
    required this.imageAsset,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.distanceKm,
    required this.etaMinutes,
    required this.badges,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              imageAsset,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cuisine,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber.shade700),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.place,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${distanceKm.toStringAsFixed(1)}km',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.timer, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${etaMinutes}min',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: badges
                        .map(
                          (b) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              b,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
