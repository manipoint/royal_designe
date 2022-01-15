import 'package:flutter/material.dart';

import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/widgets/payment_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: paymentController.payments
                .map((e) => PaymentWidget(paymentsModel: e))
                .toList(),
          )
        ],
      ),
    );
  }
}
