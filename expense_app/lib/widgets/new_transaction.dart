import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'amount'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: amountController,
            ),
            TextButton(
                child: const Text('Add Transaction'),
                style: TextButton.styleFrom(primary: Colors.deepOrange),
                onPressed: () {
                  addTransactionHandler(
                    titleController.text,
                    double.parse(amountController.text),
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                })
          ],
        ),
      ),
    );
  }
}
