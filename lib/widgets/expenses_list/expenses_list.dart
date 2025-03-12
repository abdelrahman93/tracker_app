import 'package:flutter/material.dart';
import 'package:tracker_app/modles/expense.dart';
import 'package:tracker_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.list,
    required this.onRemoveExpense,
  });

  final List<Expense> list;

  final void Function(Expense expense) onRemoveExpense;

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            key: ValueKey(list[index]),
            direction:
                DismissDirection
                 .endToStart, // Ensures swipe only from right to left
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.delete, color: Colors.white),
                  const SizedBox(width: 8),
                  const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            onDismissed: (direction) => onRemoveExpense(list[index]),
            child: ExpensesItem(expenseItem: list[index]),
          ),
    );
  }
}
