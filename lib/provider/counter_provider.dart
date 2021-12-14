import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/notifiers/counter_notifier.dart';

final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());