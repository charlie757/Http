import 'package:flutter/material.dart';

class ContentListWidget extends StatelessWidget {
  const ContentListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text("Ravi"),
          )
        ].expand((i) => [i, i, i, i, i]).toList(),
      );
}
