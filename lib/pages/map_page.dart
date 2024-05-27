import 'package:flutter/cupertino.dart';
import 'package:moniepoint/util/context_extensions.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: context.getSize.height,
      width: context.getSize.width,
      decoration: const BoxDecoration(),
      child: const Column(
        children: [],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
