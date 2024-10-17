import 'package:flutter/material.dart';
import 'package:to_do_app/models/filter.dart';

class FilterButton extends StatelessWidget {
  final Filter filter;
  const FilterButton({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        filter == Filter.all
            ? "All"
            : filter == Filter.active
                ? "Active"
                : "Completed",
        style: TextStyle(
          fontSize: 18.0,
          color: textColor(context, filter),
        ),
      ),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    const currentFilter = Filter.all;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}

class TodoFilter extends StatelessWidget {
  const TodoFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterButton(filter: Filter.all),
        FilterButton(filter: Filter.active),
        FilterButton(filter: Filter.completed),
      ],
    );
  }
}
