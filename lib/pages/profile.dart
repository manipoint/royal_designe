import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/constants/globles.dart';
import 'package:royal_designe/controller/langague_controller.dart';
import 'package:royal_designe/controller/theam_controller.dart';
import 'package:royal_designe/model/menu_option_model.dart';
import 'package:royal_designe/util/dropdown_picker.dart';
import 'package:royal_designe/util/segment_selector.dart';
import 'package:royal_designe/widgets/custom_text.dart';

import 'auth/address.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.fill,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Obx(() => Text(
                                authController.userModel.value.name!.first!,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Obx(() => Text(
                                authController.userModel.value.email!,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              authController.signOut();
                            },
                            child: Text(
                              "settings.signOut".tr,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).colorScheme.error),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  flex: 3,
                ),
              ],
            ),
            const Divider(),
            Container(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'home.Account Information'.tr.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'auth.nameFormField'.tr,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Obx(() => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        CustomText(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            text: authController.userModel.value.name!.first!),
                        
                        CustomText(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            text: authController.userModel.value.name!.last!),
                      ],
                    ),
                  )),
            ),
            ListTile(
              title: Text(
                'auth.emailFormField'.tr,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Obx(() => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomText(
                      color: Theme.of(context).colorScheme.primaryVariant,
                      text: authController.userModel.value.email!,
                    ),
                  )),
            ),
            ListTile(
              title: Text(
                'home.phone'.tr,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Obx(() => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomText(
                      color: Theme.of(context).colorScheme.primaryVariant,
                      text: authController.userModel.value.phone!,
                    ),
                  )),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    "home.address".tr,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Obx(() => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CustomText(
                            color: Theme.of(context).colorScheme.primaryVariant,
                            text:
                                authController
                                        .userModel.value.location!.street! +
                                    " " +
                                    authController
                                        .userModel.value.location!.postcode! +
                                    " " +
                                    authController
                                        .userModel.value.location!.city! +
                                    " " +
                                    authController
                                        .userModel.value.location!.state!),
                      )),
                  trailing: IconButton(
                    onPressed: () => Get.to(UserAddress()),
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            languageListTile(context),
            
            themeListTile(context)
            
          ],
        ),
      ),
    );
  }

  languageListTile(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (controller) => ListTile(
        title: Text('settings.language'.tr),
        trailing: DropdownPicker(
          menuOptions: Globals.languageOptions,
          selectedOption: controller.currentLanguage,
          onChanged: (value) async {
            await controller.updateLanguage(value!);
            Get.forceAppUpdate();
          },
        ),
      ),
    );
  }

  themeListTile(BuildContext context) {
    final List<MenuOptionsModel> themeOptions = [
      MenuOptionsModel(
          key: "system", value: 'settings.system'.tr, icon: Icons.brightness_4),
      MenuOptionsModel(
          key: "light", value: 'settings.light'.tr, icon: Icons.brightness_low),
      MenuOptionsModel(
          key: "dark", value: 'settings.dark'.tr, icon: Icons.brightness_3)
    ];
    return GetBuilder<ThemeController>(
      builder: (controller) => ListTile(
        title: Text('settings.theme'.tr),
        subtitle: Padding(
          padding: const EdgeInsets.only(top:4.0,bottom: 30),
          child: SegmentedSelector(
            selectedOption: controller.currentTheme,
            menuOptions: themeOptions,
            onValueChanged: (value) {
              controller.setThemeMode(value);
            },
          ),
        ),
      ),
    );
  }
}
