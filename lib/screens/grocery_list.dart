import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groceries/models/category.dart';
import 'package:http/http.dart' as http;

import 'package:groceries/models/grocery_item.dart';
import 'package:groceries/screens/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _items = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  void _fetchItems() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final url = Uri.https(
          'flutter-groceries-429d6-default-rtdb.firebaseio.com',
          'groceries.json');
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        // An error occured
        setState(() {
          _isLoading = false;
          _error = "Failed to fetch data, please try again later!";
        });
        return;
      } else if (response.body == 'null') {
        // No Data
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];
      for (final item in listData.entries) {
        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: Category.byName(name: item.value['category']),
          ),
        );
      }
      setState(() {
        _items = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _error = "Something went wrong, please try again later!";
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem != null) {
      setState(() {
        _items.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    final index = _items.indexOf(item);
    setState(() {
      _items.remove(item);
    });

    try {
      final url = Uri.https(
          'flutter-groceries-429d6-default-rtdb.firebaseio.com',
          'groceries/${item.id}.json');

      final response = await http.delete(url);

      if (response.statusCode >= 400) {
        setState(() {
          _items.insert(index, item);
        });
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to delete this grocery item!'),
          ));
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Grocery item deleted successfuly!'),
          ));
        }
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Grocery item deleted successfuly!'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_error != null) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () => _fetchItems(),
              icon: const Icon(Icons.replay),
              label: const Text('Try Again!'),
            )
          ],
        ),
      );
    } else if (_items.isNotEmpty) {
      content = ListView.builder(
        itemCount: _items.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_items[index]);
          },
          key: ValueKey(_items[index].id),
          child: ListTile(
            title: Text(_items[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _items[index].category.color,
            ),
            trailing: Text(
              _items[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
