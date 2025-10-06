import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 12),
                HeaderSection(),
                SizedBox(height: 12),
                PromoCarousel(),
                SizedBox(height: 12),
                WalletRow(),
                SizedBox(height: 12),
                QuickMenu(),
                SizedBox(height: 12),
                DailyDishesGrid(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF6B6B), Color(0xFFFF9A76)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Your current address',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Gunamawaran street No. 14',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _circleIconButton(Icons.favorite_border),
                  const SizedBox(width: 8),
                  _circleIconButton(Icons.notifications_none),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'What would you like to eat?',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget _circleIconButton(IconData icon) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: Colors.black87),
        ),
      ),
    );
  }
}

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      _PromoCardData(
        image:
            'https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=1400&auto=format&fit=crop',
        title: "Today's Best Deals",
        subtitle: 'Off up to 75%',
      ),
      _PromoCardData(
        image:
            'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?q=80&w=1400&auto=format&fit=crop',
        title: 'Weekly Best Deals',
        subtitle: 'Off up to 50%',
      ),
    ];
    return SizedBox(
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final c in cards) _PromoCard(c: c),
          ],
        ),
      ),
    );
  }
}

class _PromoCardData {
  _PromoCardData(
      {required this.image, required this.title, required this.subtitle});
  final String image;
  final String title;
  final String subtitle;
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.c});
  final _PromoCardData c;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(c.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.4)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(c.title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(c.subtitle, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletRow extends StatelessWidget {
  const WalletRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
            child: _WalletCard(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Your Wallet',
                value: 'Rp699.000')),
        SizedBox(width: 8),
        Expanded(
            child: _WalletCard(
                icon: Icons.monetization_on_outlined,
                title: 'Your Coins',
                value: '1.200')),
      ],
    );
  }
}

class _WalletCard extends StatelessWidget {
  const _WalletCard(
      {required this.icon, required this.title, required this.value});
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class QuickMenu extends StatelessWidget {
  const QuickMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _QuickItem(Icons.location_on_outlined, 'Near Me', Colors.pink.shade100),
      _QuickItem(Icons.local_fire_department_outlined, 'Popular',
          Colors.orange.shade100),
      _QuickItem(Icons.percent, 'Discount', Colors.blue.shade100),
      _QuickItem(Icons.schedule, '24 Hours', Colors.green.shade100),
      _QuickItem(Icons.fastfood, 'Quick Bites', Colors.purple.shade100),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final it in items)
          Column(
            children: [
              Material(
                color: it.bg,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(it.icon, color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(it.label,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
            ],
          ),
      ],
    );
  }
}

class _QuickItem {
  _QuickItem(this.icon, this.label, this.bg);
  final IconData icon;
  final String label;
  final Color bg;
}

class DailyDishesGrid extends StatelessWidget {
  const DailyDishesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'DailyDishes',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'See all',
                style: TextStyle(color: Color(0xFFFF6B6B)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _DishCard(
                color: Color(0xFFFF9A76),
                title: 'Customer Top Picks',
                subtitle: '231 Restaurant Already'),
            _DishCard(
                color: Color(0xFFFF6B6B),
                title: 'Beverages',
                subtitle: '189 Restaurant Already'),
            _DishCard(
                color: Color(0xFF4C6FFF),
                title: 'Fast Food',
                subtitle: '526 Restaurant Already'),
            _DishCard(
                color: Color(0xFFFF6BB5),
                title: 'Desserts',
                subtitle: '891 Restaurant Already'),
          ],
        ),
      ],
    );
  }
}

class _DishCard extends StatelessWidget {
  const _DishCard(
      {required this.color, required this.title, required this.subtitle});
  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          Text(subtitle, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
