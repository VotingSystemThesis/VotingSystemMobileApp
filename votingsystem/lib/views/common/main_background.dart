import 'package:flutter/material.dart';
import 'package:votingsystem/views/common/form_title.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  final bool useBackButton;
  final double distribution;
  final bool withPadding;
  final Function? onPress;
  final bool isScrollable;

  const MainBackground(
      {Key? key,
      required this.child,
      this.useBackButton = false,
      this.distribution = 0.8,
      this.onPress,
      this.withPadding = true,
      this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: withPadding
                ? const EdgeInsets.all(15)
                : const EdgeInsets.all(0),
            width: screenWidth,
            height: screenHeight,
            color: const Color.fromRGBO(225, 228, 253, 1),
            child: SingleChildScrollView(
                physics: isScrollable
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (useBackButton)
                      SizedBox(
                        width: screenWidth,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              iconSize: 30,
                              onPressed: () {
                                onPress!();
                              },
                              icon: const Icon(Icons.arrow_back_ios_new),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FormTitle(text: "Volver")
                          ],
                        ),
                      ),
                    SizedBox(height: screenHeight * distribution, child: child)
                  ],
                ))),
      ),
    );
  }
}
