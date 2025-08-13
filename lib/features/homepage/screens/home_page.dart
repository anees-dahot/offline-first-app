import 'package:flutter/material.dart';
import 'package:offline_first_app/features/homepage/widgets/info_lable_widget.dart';
import 'package:offline_first_app/features/homepage/widgets/items_number_row_widget.dart';
import 'package:offline_first_app/features/homepage/widgets/price_row_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E-Stock Manager",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade500, // strong, clean color
        elevation: 1,
        actions: [
          // Deleted data
          IconButton(
            tooltip: "View Deleted Data",
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO:
            },
          ),

          // Expenses
          IconButton(
            tooltip: "View Expenses",
            icon: const Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO:
            },
          ),

          // Filter
          IconButton(
            tooltip: "Apply Filter",
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO:
            },
          ),

          const SizedBox(width: 4), // right padding
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16), // some space at the end
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                height: size.height * 0.18,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left side stats
                    Row(
                      children: [
                        priceRow("In", Colors.green, "900"),
                        const SizedBox(width: 16),
                        priceRow("Out", Colors.red, "900"),
                        const SizedBox(width: 16),
                        priceRow("All", Colors.blue, "900"),
                      ],
                    ),

                    // Right side totals
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemsNumberRow("In", Colors.green, "90,000"),
                        const SizedBox(height: 6),
                        itemsNumberRow("Out", Colors.red, "90,000"),
                        const SizedBox(height: 6),
                        itemsNumberRow("Profit", Colors.orange, "12,929,323"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gradient badge
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.green, Colors.teal],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Text section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product name
                            const Text(
                              'Tecno Camon 40 Pro',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Info row with icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                InfoLabel(
                                  icon: Icons.attach_money,
                                  label: "192,020",
                                  color: Colors.green,
                                ),
                                InfoLabel(
                                  icon: Icons.local_offer,
                                  label: "200",
                                  color: Colors.orange,
                                ),
                                InfoLabel(
                                  icon: Icons.calendar_today,
                                  label: "19/02/20",
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
