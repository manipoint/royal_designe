import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class PaymentOption extends StatelessWidget {
  final List<Widget> children;
  final List<String> tags;

  final EdgeInsets? padding;
  const PaymentOption({
    Key? key,
    this.children = const [],
    this.tags = const [],
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'app.title'.tr,
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            const SizedBox(height: 4),
            Padding(
              child: Row(
                children: [
                  for (final tag in tags) Chip(label: Text(tag)),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(height: 20),
            if (padding != null)
              Padding(
                padding: padding!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              )
            else
              ...children,
          ],
        ),
      ),
    );
  }
}
