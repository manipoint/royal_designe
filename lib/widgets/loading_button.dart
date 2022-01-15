import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingButton extends StatelessWidget {
  final Future Function()? onPressed;
  final String? text;

  LoadingButton({Key? key, this.onPressed, this.text}) : super(key: key);
  final Rx<bool> _isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                   primary: const  Color.fromRGBO(234, 60, 3, 1),
                   onPrimary: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                onPressed: (_isLoading.value || onPressed == null)
                    ? null
                    : _loadFuture,
                child: _isLoading.value
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ))
                    : Text(text!),
              ),
            ),
          ],
        ));
  }

  Future<void> _loadFuture() async {
    _isLoading.value = true;

    try {
      await onPressed!();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      Get.snackbar('Error', e.toString());

      rethrow;
    } finally {
      _isLoading.value = false;
    }
  }
}
