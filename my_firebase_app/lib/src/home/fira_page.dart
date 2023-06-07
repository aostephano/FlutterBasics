import 'dart:async';
import 'dart:js_interop';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirePage extends StatefulWidget {
  const FirePage({super.key});

  @override
  State<FirePage> createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  int _likes = 0;
  late final DatabaseReference _likesRef;
  late StreamSubscription<DatabaseEvent> _likesSub;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _likesRef = FirebaseDatabase.instance.ref('likes');

    try {
      final likeSnapshot = await _likesRef.get();
      _likes = likeSnapshot.value.isNull ? 0 : likeSnapshot.value as int;
    } catch (e) {
      debugPrint(e.toString());
    }

    _likesSub = _likesRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _likes = (event.snapshot.value as int ?? 0);
      });
    });
  }

  like() async {
    await _likesRef.set(ServerValue.increment(1));
  }

  @override
  void dispose() {
    _likesSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: like,
              icon: const Icon(Icons.favorite),
            ),
            Text(
              _likes.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
