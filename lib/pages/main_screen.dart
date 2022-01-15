import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/pages/checkout.dart';
import 'package:royal_designe/pages/search.dart';
import 'package:royal_designe/widgets/badge.dart';
import 'favorite_screen.dart';
import 'home.dart';
import 'notifications.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'app.title'.tr,style: const TextStyle(fontWeight: FontWeight.w700,letterSpacing:.3 ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              color: Theme.of(context).colorScheme.primaryVariant,
              icon: const IconBadge(
                icon: Icons.notifications,
                size: 22.0,
                
              ),
              onPressed: () {
                Get.to(const Notifications());
              },
              tooltip: "Notifications",
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: const <Widget>[
            Home(),
            PaymentScreen(),
            SearchPage(),
            CartPage(),
             Profile(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 7),
              IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 24.0,
                ),
                color: _page == 0
                    
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryVariant,
                onPressed: () => _pageController!.jumpToPage(0),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  size: 24.0,
                ),
                color: _page == 1
                     ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryVariant,
                onPressed: () => _pageController!.jumpToPage(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                color: _page == 2
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryVariant,
                onPressed: () => _pageController!.jumpToPage(2),
              ),
              IconButton(
                icon:  const Icon(
                  Icons.shopping_cart,
                  size: 24.0,
                
                ),
                color: _page == 3
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryVariant,
                onPressed: () => _pageController!.jumpToPage(3),
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 24.0,
                ),
                color: _page == 4
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryVariant,
                onPressed: () => _pageController!.jumpToPage(4),
              ),
              const SizedBox(width: 7),
            ],
          ),
          color: Theme.of(context).colorScheme.primary,
          shape: const CircularNotchedRectangle(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor:  _page == 2
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primaryVariant,
          elevation: 4.0,
          child:  Icon(
            
            Icons.search,
            color: _page == 2 ? Theme.of(context).colorScheme.primaryVariant
                    : Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => _pageController!.jumpToPage(2),
        ),
      ),
    );
  }

  // void navigationTapped(int page) {
  //   _pageController!.jumpToPage(page);
  // }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}
