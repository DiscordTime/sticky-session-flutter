
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/constants.dart';

class DataWidgetLoader<T> extends StatelessWidget {
  final Stream<T> dataStream;
  final Widget Function(T data) onCreateChild;

  const DataWidgetLoader({
    Key? key,
    required this.dataStream,
    required this.onCreateChild
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        initialData: null,
        stream: dataStream,
        builder: (context, snapshot) => snapshot.data == null ?
          getLoading() :
          onCreateChild(snapshot.data!)
    );
  }

  Widget getLoading() => const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      )
  );
}

