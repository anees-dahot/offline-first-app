import 'package:flutter/material.dart';

class ManageExpensesScreen extends StatefulWidget {
  const ManageExpensesScreen({super.key});

  @override
  State<ManageExpensesScreen> createState() => _ManageExpensesScreenState();
}

class _ManageExpensesScreenState extends State<ManageExpensesScreen> {
  final List<Map<String, dynamic>> expenses = [
    {
      "title": "Office Rent",
      "amount": 15000,
      "date": "2025-08-10",
    },
    {
      "title": "Sale Revenue",
      "amount": 35000,
      "date": "2025-08-09",
    },
    {
      "title": "Internet Bill",
      "amount": 2000,
      "date": "2025-08-08",
    },
  ];

  void _addExpense(String title, double amount) {
    setState(() {
      expenses.add({
        "title": title,
        "amount": amount,
        "date": DateTime.now().toString().split(' ')[0],
      });
    });
  }

  void _showAddExpenseDialog() {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  amountController.text.isNotEmpty) {
                _addExpense(
                  titleController.text,
                  double.parse(amountController.text),
                );
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];

          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(
                expense["title"],
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              subtitle: Text(expense["date"]),
              trailing: Text(
                "${expense["amount"]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
              onLongPress: () {
                setState(() {
                  expenses.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddExpenseDialog,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
