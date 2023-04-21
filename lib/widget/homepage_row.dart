import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RowWidget extends StatelessWidget {
  String data1, data2;
  RowWidget({super.key,required this.data1,required this.data2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5,left: 10 ,right: 10 ,top: 10 ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data1),
              Text(data2,)
            ],
          ),
          SizedBox(height: 10,),
          Divider(color: Colors.grey,),
        ],
      ),
    );
  }
}