import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    scheme.primaryContainer,
                    scheme.primary.withOpacity(0.85),
                  ],
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "asosa totasefer",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: scheme.onPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(width: 6),
                          Icon(Icons.expand_more,
                              color: scheme.onPrimary, size: 28),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite_border,
                              color: scheme.onPrimary, size: 26),
                          const SizedBox(width: 16),
                          Icon(Icons.notifications_none,
                              color: scheme.onPrimary, size: 26),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: scheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: scheme.shadow.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'What would you like to eat?',
                        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
                        prefixIcon:
                            Icon(Icons.search, color: scheme.primary, size: 24),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  const periods = ["Today", "Weekly", "Monthly", "Yearly"];
                  return Myoffer(period: periods[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Your Myoffer Widget
class Myoffer extends StatefulWidget {
  final String period;
  const Myoffer({super.key, required this.period});

  @override
  State<Myoffer> createState() => _MyofferState();
}

class _MyofferState extends State<Myoffer> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          height: 130,
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [
                scheme.secondaryContainer,
                scheme.primary.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.period == "Today"
                          ? "Today's Best"
                          : "${widget.period}'s Best",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: scheme.onPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    Text(
                      "Offer",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: scheme.onPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "off up to 75%",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: scheme.onPrimary,
                          ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                child: Image.asset(
                  "assets/images/burger.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: 110,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
