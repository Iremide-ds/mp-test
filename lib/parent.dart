import 'package:flutter/material.dart';
import 'package:moniepoint/pages/home_page.dart';
import 'package:moniepoint/pages/map_page.dart';
import 'package:moniepoint/util/colors.dart';
import 'package:moniepoint/util/context_extensions.dart';

class AppDashboardPage extends StatefulWidget {
  const AppDashboardPage({super.key});

  @override
  State<AppDashboardPage> createState() => _AppDashboardPageState();
}

class _AppDashboardPageState extends State<AppDashboardPage> {
  late final PageController _pageController;
  final _navs = [
    Icons.search,
    Icons.chat_bubble,
    Icons.home_filled,
    Icons.favorite,
    Icons.person,
  ];
  late final List<Widget> _pages;

  int _currentPage = 2;

  void _init() {
    _pageController = PageController(initialPage: _currentPage);
    _pages = [
      const MapPage(),
      const Placeholder(),
      const HomePage(),
      const Placeholder(),
      const Placeholder(),
    ];
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            _currentPage = value;
            setState(() {});
          },
          controller: _pageController,
          children: _pages,
        ),
      ),
      bottomSheet: SizedBox(
        height: context.getSize.height * 0.075,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: context.getSize.height * 0.06,
            width: context.getSize.width * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 11),
            decoration: BoxDecoration(
              color: AppPalette.black1,
              borderRadius: BorderRadius.circular(40),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_navs.length, (index) {
                    final currentIndex = _navs[index];
                    bool isCurrentPage = _currentPage == index;

                    return GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(index);
                      },
                      child: Container(
                        height: isCurrentPage
                            ? constraints.maxHeight
                            : constraints.maxHeight * 0.8,
                        width: isCurrentPage
                            ? constraints.maxHeight
                            : constraints.maxHeight * 0.8,
                        decoration: BoxDecoration(
                          color: isCurrentPage
                              ? AppPalette.primary
                              : AppPalette.black2,
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Center(
                            child: Icon(
                              currentIndex,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
