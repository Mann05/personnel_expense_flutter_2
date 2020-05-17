import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  TransactionList(this.userTransactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constaints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: constaints.maxHeight * .1,
                  child: Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: constaints.maxHeight * .1,
                ),
                Container(
                  height: constaints.maxHeight * .7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('Rs.${userTransactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(userTransactions[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(userTransactions[index].id),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(userTransactions[index].id),
                        ),
                ),
              );
            },
            itemCount: userTransactions.length,
            // children: userTransactions.map((tx) {
            //   return Card(
            //     child: Row(children: [
            //       Container(
            //         margin: EdgeInsets.symmetric(
            //           vertical: 10.0,
            //           horizontal: 15.0,
            //         ),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Theme.of(context).primaryColorDark,
            //             width: 2.0,
            //           ),
            //         ),
            //         padding: EdgeInsets.all(10.0),
            //         child: Text(
            //           'Rs. ${tx.amount.toStringAsFixed(2)}',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18.0,
            //             color: Theme.of(context).primaryColorDark,
            //           ),
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Text(tx.title,
            //               style: Theme.of(context).textTheme.headline4),
            //           Text(DateFormat('dd/MM/yyyy').format(tx.date),
            //               style: TextStyle(
            //                 color: Colors.grey,
            //               )),
            //         ],
            //       )
            //     ]),
            //   );
            // }).toList()),
          );
  }
}
