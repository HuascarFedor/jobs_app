import 'package:flutter/material.dart';
import 'package:jobs_app/job.dart';

class Item extends StatelessWidget {
  final Job data;

  const Item({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: null,
        border: Border.all(
          color: colors.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  data.description,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const IconButton(
            onPressed: null, 
            icon:Icon(Icons.edit),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
