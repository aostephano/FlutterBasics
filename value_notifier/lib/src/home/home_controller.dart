import 'package:flutter/material.dart';

//Cubit
class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
  decrement() => value++;
}
