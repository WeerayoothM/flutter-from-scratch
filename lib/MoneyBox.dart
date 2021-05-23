import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// build container prototypes
class MoneyBox extends StatelessWidget {
  String title; // ชื่อรายการ
  double amount; // จำนวนเงิน
  Color color; // สีกล่อง
  double size; // ขนาดกล่อง

  MoneyBox(this.title, this.amount, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: size,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      // border: Border.all(width: 2, color: Colors.pink),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              '฿${NumberFormat('#,###').format(amount)}',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
