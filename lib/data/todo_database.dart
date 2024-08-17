import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/todo_item.dart';

typedef DatabaseReadAction<T, R> = R Function(T);
typedef DatabaseWriteAction<T> = void Function(T);

class TodoDatabase {
  List<TodoItem> _items = [];
  final Box _box = Hive.box('database');

  void _initialize() {
    _items = [
      TodoItem(
        title: "Create task",
        description: "by tapping on action button",
        done: false,
      ),
      TodoItem(title: "Delete it", description: "by sliding", done: false),
    ];
  }

  void load() async {
    final existing = _box.get('items');
    if (existing == null) {
      _initialize();
      await _box.put('items', _items);
      return;
    }
    _items = existing.cast<TodoItem>();
  }

  T read<T>(DatabaseReadAction<List<TodoItem>, T> action) => action(_items);

  void write(DatabaseWriteAction<List<TodoItem>> action) async {
    action(_items);
    await _box.put('items', _items);
    await _box.flush();
  }
}
