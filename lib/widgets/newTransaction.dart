import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
//  String titleInput,amountInput; // aren't final warning
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addNewTransaction(
      title,
      amount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ))),
              child: Text(
                'Add New Transaction',
                style: TextStyle(
                  fontSize: 20,
//                  fontWeight: FontWeight.bold,
                  //color: Colors.white
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (val) => titleInput = val,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), //(_) underscore in function argument mean i accept the value but not need anymore in flutter
            ),
            Container(
              height:70,
              child: Row(
                children: <Widget>[
                  Text('No Date Choosen!'),
                  FlatButton(
                    textColor: Theme.of(context).accentColor,
                    child: Text(
                      'Choose Date',
                      style:TextStyle(fontWeight: FontWeight.bold)

                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
