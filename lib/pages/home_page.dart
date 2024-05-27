import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint/util/colors.dart';
import 'package:moniepoint/util/context_extensions.dart';
import 'package:moniepoint/widgets/animated_counter.dart';
import 'package:moniepoint/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final List<String> _options = [
    "https://images.unsplash.com/photo-1616046229478-9901c5536a45?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1616046229478-9901c5536a45?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1616046229478-9901c5536a45?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1616046229478-9901c5536a45?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1616046229478-9901c5536a45?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1616046229478-9901c5536a45?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];
  ValueNotifier<double>? _listMargin;
  ValueNotifier<double>? _listHeight;

  double? _height1 = 0;
  int _count1 = 0;
  int _count2 = 0;

  void _init() {
    _listMargin = ValueNotifier(context.getSize.height * 0.6);
    _listHeight = ValueNotifier(context.getSize.height * 0.67);
    _height1 = null;
    _count1 = 1250;
    _count2 = 2200;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: context.getSize.height,
      width: context.getSize.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppPalette.white1, AppPalette.fadedPrimary],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.getSize.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: _height1 ?? constraints.maxHeight,
                            width: context.getSize.width * 0.42,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppPalette.grey1,
                                  size: constraints.maxHeight * 0.48,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Saint Petersburg',
                                  style: TextStyle(
                                    color: AppPalette.grey1,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          AnimatedScale(
                            duration: const Duration(seconds: 2),
                            scale: _height1 ?? 1,
                            child: CircleAvatar(
                              radius: context.getSize.width * 0.42 * 0.5,
                              backgroundImage: const NetworkImage(
                                  'https://images.unsplash.com/photo-1527203561188-dae1bc1a417f?q=80&w=1615&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: context.getSize.height * 0.04),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: AnimatedSlide(
                    duration: const Duration(seconds: 1),
                    offset: Offset(0, _height1 != null ? 27 : 0),
                    child: const Text(
                      'Hi, Marina',
                      style: TextStyle(
                        color: AppPalette.grey2,
                        fontSize: 27,
                      ),
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: AnimatedSlide(
                    duration: const Duration(seconds: 1),
                    offset: Offset(0, _height1 != null ? 27 : 0),
                    child: const Text(
                      'Let\'s select your perfect place',
                      style: TextStyle(
                        fontSize: 46,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.getSize.height * 0.04),
                SizedBox(
                  height: context.getSize.height * 0.2,
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: _height1 ?? constraints.maxWidth * 0.49,
                            width: _height1 ?? constraints.maxWidth * 0.49,
                            decoration: const BoxDecoration(
                              color: AppPalette.primary,
                              shape: BoxShape.circle,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return SizedBox(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth,
                                  child: Visibility(
                                    visible: _height1 == null,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * 0.08,
                                        ),
                                        const Text(
                                          'BUY',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const Spacer(),
                                        AnimatedCount(
                                          count: _count1,
                                          duration: const Duration(seconds: 2),
                                        ),
                                        const Text(
                                          'offers',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: _height1 ?? constraints.maxHeight,
                            width: _height1 ?? constraints.maxWidth * 0.49,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return SizedBox(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth,
                                  child: Visibility(
                                    visible: _height1 == null,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * 0.08,
                                        ),
                                        const Text(
                                          'Rent',
                                          style: TextStyle(
                                            color: AppPalette.grey2,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const Spacer(),
                                        AnimatedCount(
                                          count: _count2,
                                          color: AppPalette.grey2,
                                        ),
                                        const Text(
                                          'offers',
                                          style: TextStyle(
                                            color: AppPalette.grey2,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: context.getSize.height * 0.04),
              ],
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              double value = 0;
              if (notification.metrics.axisDirection == AxisDirection.up) {
                value = context.getSize.height * 0.4;
              } else {
                value = context.getSize.height * 0.6;
              }
              if (value != _listMargin?.value) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  _listMargin?.value = value;
                  if (_listHeight?.value != context.getSize.height * 0.7) {
                    _listHeight?.value = context.getSize.height * 0.8;
                  }
                });
              }
              return true;
            },
            child: SingleChildScrollView(
              child: ValueListenableBuilder(
                valueListenable:
                    _listMargin ?? ValueNotifier(context.getSize.height * 0.6),
                builder: (context, value, child) {
                  return AnimatedPadding(
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.only(top: value),
                    child: child,
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: _listHeight ??
                      ValueNotifier(context.getSize.height * 0.67),
                  builder: (context, height, child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: height,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(27),
                          topRight: Radius.circular(27),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: height == context.getSize.height * 0.67
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        child: child,
                      ),
                    );
                  },
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(_options.length, (index) {
                      return StaggeredGridTile.count(
                        crossAxisCellCount: index == 0 ? 2 : 1,
                        mainAxisCellCount: index > 0
                            ? index > 1 && index < 4
                                ? 1
                                : 2
                            : 1,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                repeat: ImageRepeat.noRepeat,
                                image: NetworkImage(
                                  _options[index],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(27),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
