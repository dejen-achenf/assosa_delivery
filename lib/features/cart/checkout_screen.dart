import 'package:flutter/material.dart';

class CheckoutItem {
  final String title;
  final String imageAsset;
  final int unitPrice;
  final int quantity;
  const CheckoutItem({
    required this.title,
    required this.imageAsset,
    required this.unitPrice,
    required this.quantity,
  });

  int get lineTotal => unitPrice * quantity;
}

class CheckoutScreen extends StatelessWidget {
  final List<CheckoutItem> items;
  const CheckoutScreen({super.key, required this.items});

  int get subtotal => items.fold(0, (sum, e) => sum + e.lineTotal);
  int get shipping => items.isEmpty ? 0 : 15; // sample flat shipping
  int get discount => (subtotal * 0.1).floor(); // sample 10% promo
  int get total => subtotal + shipping - discount;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        children: [
          _Section(
            title: 'Shipping address',
            trailing: TextButton(onPressed: () {}, child: const Text('Change')),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('John Doe'),
                SizedBox(height: 4),
                Text('Jl. Jend. Sudirman No. 1, Jakarta'),
                SizedBox(height: 4),
                Text('+62 812-0000-0000'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _Section(
            title: 'Payment method',
            trailing: TextButton(onPressed: () {}, child: const Text('Change')),
            child: Row(
              children: const [
                Icon(Icons.credit_card),
                SizedBox(width: 8),
                Text('Visa **** 4242'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _Section(
            title: 'Delivery',
            child: Row(
              children: const [
                Icon(Icons.local_shipping_outlined),
                SizedBox(width: 8),
                Text('Standard • 2-3 days • 15 birr'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _Section(
            title: 'Items',
            child: Column(
              children: items
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(e.imageAsset,
                                width: 60, height: 60, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 4),
                                Text('Qty: ${e.quantity}',
                                    style: TextStyle(
                                        color: scheme.onSurfaceVariant)),
                              ],
                            ),
                          ),
                          Text('${e.lineTotal} birr',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
          _Section(
            title: 'Order summary',
            child: Column(
              children: [
                _SummaryRow(label: 'Subtotal', value: '${subtotal} birr'),
                _SummaryRow(label: 'Shipping', value: '${shipping} birr'),
                _SummaryRow(
                    label: 'Discount',
                    value: '-${discount} birr',
                    valueColor: Colors.green),
                const Divider(),
                _SummaryRow(
                    label: 'Total', value: '${total} birr', isBold: true),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Order placed!')),
              );
            },
            child: Text('Place order • ${total} birr'),
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;
  const _Section({required this.title, required this.child, this.trailing});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outlineVariant),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;
  const _SummaryRow(
      {required this.label,
      required this.value,
      this.isBold = false,
      this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: isBold
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800, color: valueColor)
                : Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }
}
