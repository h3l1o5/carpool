import 'package:flutter/material.dart';

class Selector {
  static show({
    BuildContext context,
    String title,
    String selectedItemKey,
    @required Map<String, String> items,
    @required void Function(String itemKey) onSelect,
  }) {
    final theme = Theme.of(context);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            titleTextStyle: theme.textTheme.title.merge(
              TextStyle(color: theme.primaryColor),
            ),
            title: title != null ? Text(title) : null,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: items.keys.map((key) {
                return InkWell(
                  onTap: () {
                    onSelect(key);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    title: Text(items[key]),
                    trailing: selectedItemKey == key
                        ? Icon(
                            Icons.check,
                            color: theme.accentColor,
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
          );
        });
  }
}
