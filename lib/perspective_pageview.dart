import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerspectivePageView extends StatefulWidget {
  final List<Widget> children;

  const PerspectivePageView({super.key, required this.children,});

  @override
  PerspectivePageViewState createState() => PerspectivePageViewState();
}

class PerspectivePageViewState extends State<PerspectivePageView> {
  late PageValueHolder holder;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    holder = PageValueHolder(2.0);
    _controller = PageController(initialPage: 2, viewportFraction: 0.5);
    _controller.addListener(() {
      holder.setValue(_controller.page ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageValueHolder>.value(
      value: holder,
      child: PageView.builder(
          controller: _controller,
          itemCount: widget.children.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            double value = Provider.of<PageValueHolder>(context).value;
            double difference = (index - value);

            final Matrix4 pageViewMatrix = Matrix4.identity()
              ..setEntry(3, 3, 1 / 0.9)
              ..setEntry(1, 1, 1.3)
              ..setEntry(3, 0, 0.004 * - difference);

            final Matrix4 shadowMatrix = Matrix4.identity()
              ..setEntry(3, 3, 1 / 1.2)
              ..setEntry(3, 1, -0.004)
              ..setEntry(3, 0, 0.002 * difference)
              ..rotateX(1.409);

            return Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                if (difference >= -1.0 && difference <= 1.0) ...[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: 1 - difference.abs(),
                    child: Transform(
                      alignment: FractionalOffset.bottomCenter,
                      transform: shadowMatrix,
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(color: Color(0xFFE6E6E6), blurRadius: 10.0, spreadRadius: 1.0)
                        ]),
                      ),
                    ),
                  ),
                ],
                Transform(
                  transform: pageViewMatrix,
                  alignment: FractionalOffset.center,
                  child: widget.children[index],
                ),
              ],
            );
          }),
    );
  }
}

class PageValueHolder extends ChangeNotifier {
  double _value = 0.0;

  PageValueHolder(double value) {
    _value = value;
  }

  get value => _value;

  void setValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}

