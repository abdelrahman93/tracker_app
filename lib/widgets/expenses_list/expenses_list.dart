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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin:  EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal ),
            ),
            key: ValueKey(list[index]),
            onDismissed: (direction) => onRemoveExpense(list[index]),
            child: ExpensesItem(expenseItem: list[index]),
          ),
    );
  }
}
