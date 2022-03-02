import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final entertedAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || entertedAmount <= 0) {
      return;
    }

    widget.addTransactionHandler(enteredTitle, entertedAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'amount'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: const Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.deepOrange),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
