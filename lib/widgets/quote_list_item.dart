import 'package:flutter/material.dart';
import 'package:my_quote_app/models/quote_response_model.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({super.key, required this.quoteItem});
  final Quote quoteItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Text(quoteItem.id.toString()),
      ),
      title: Text(quoteItem.quote),
      subtitle: Text(quoteItem.author),
    );
  }
}