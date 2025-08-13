import 'package:flutter/material.dart';

class DeletedItemsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> deletedExpenses = [
    {
      'title': 'Tecno Camon 40 pro',
      'amount': 4500,
      'date': '2025-08-10',
      'model': '16/256 GB',
      'company': 'Tecno'
    },
    {
      'title': 'Redmi Note 14',
      'amount': 120000,
      'date': '2025-08-08',
      'model': '8/256 GB',
      'company': 'Redmi'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
        title: const Text(
          "Deleted Items",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: deletedExpenses.length,
        itemBuilder: (context, index) {
          final item = deletedExpenses[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.shade100),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expense Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'Deleted',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item['company']} • ${item['model']}',
                        style: const TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item['date']} — Rs. ${item['amount']}',
                        style: const TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                // Action Buttons
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.restore, color: Colors.green),
                      tooltip: 'Recover',
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                      tooltip: 'Delete Permanently',
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
