import 'package:flutter/cupertino.dart';
import 'package:moniepoint/util/context_extensions.dart';

class TopBar extends StatelessWidget {
  final Widget child;
  const TopBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.getSize.height * 0.07,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 15),
        child: child,
      ),
    );
  }
}
