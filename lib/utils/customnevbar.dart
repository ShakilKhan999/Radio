import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/Chat/view/chat_screen.dart';
import '../screens/home_screen.dart';
import '../screens/my_store_screen.dart';
import '../screens/news_screen.dart';

class CustomBottomNevBar extends StatefulWidget {
  const CustomBottomNevBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNevBar> createState() => _CustomBottomNevBarState();
}

class _CustomBottomNevBarState extends State<CustomBottomNevBar>
    with TickerProviderStateMixin {
  double horizontalPadding = 40.0;
  double horizontalMargin = 15.0;
  int noOfIcons = 4;

  List<String> icons = [
    'images/home.png',
    'images/news.png',
    'images/msg.png',
    'images/store.png',
  ];
  List<Widget> widgetList = [
    HomeScreen(),
    NewsScreen(),
    ChatScreen(),
    MyStoreScreen(),
  ];
  List<Color> colors = [
    const Color.fromARGB(255, 252, 177, 26),
    const Color.fromARGB(255, 218, 31, 59),
    const Color.fromARGB(255, 18, 140, 227),
    Colors.blue, // Replace with your desired color for the fourth icon
  ];


  late double position;
  int selected = 0;

  late AnimationController controller;
  late Animation<double> animation;

  late PageController pageController;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 375));
    pageController = PageController(initialPage: selected);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    animation = Tween(
        begin: getEndPosition(
            0, horizontalPadding, horizontalMargin, noOfIcons),
        end: getEndPosition(
            0, horizontalPadding, horizontalMargin, noOfIcons))
        .animate(controller);
    position =
        getEndPosition(0, horizontalPadding, horizontalMargin, noOfIcons);
    super.didChangeDependencies();
  }

  double getEndPosition(int index, double horizontalPadding,
      double horizontalMargin, int noOfIcons) {
    double totalMargin = 2 * horizontalMargin;
    double totalPadding = 2 * horizontalPadding;
    double valueToOmit = totalMargin + totalPadding;

    return (((MediaQuery.of(context).size.width - valueToOmit) / noOfIcons) *
        index +
        horizontalPadding) +
        (((MediaQuery.of(context).size.width - valueToOmit) / noOfIcons) / 2) -
        70;
  }

  void animateDrop(int index) {
    animation = Tween(
        begin: position,
        end: getEndPosition(
            index, horizontalPadding, horizontalMargin, noOfIcons))
        .animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    controller.forward().then((value) {
      position =
          getEndPosition(index, horizontalPadding, horizontalMargin, noOfIcons);
      controller.dispose();
      controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 575));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-90.h,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-190.h,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selected = index;
                });
              },
              children: widgetList,
            ),
          ),

          Positioned(
            bottom: horizontalMargin,
            left: horizontalMargin,
            child: Container(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return CustomPaint(

                    painter: AppBarPainter(animation.value),
                    size: Size(
                        MediaQuery.of(context).size.width -
                            (2 * horizontalMargin),
                        80.0),
                    child: SizedBox(
                      height: 120.0,
                      width: MediaQuery.of(context).size.width -
                          (2 * horizontalMargin),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: icons.asMap().entries.map<Widget>((entry) {
                            final index = entry.key;
                            final icon = entry.value;
                            final isSelected = selected == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  animateDrop(index);
                                  selected = index;
                                  pageController.animateToPage(selected,
                                      duration: const Duration(milliseconds: 375),
                                      curve: Curves.easeOut);
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 375),
                                curve: Curves.easeOut,
                                height: 105,
                                width: (MediaQuery.of(context).size.width -
                                    (2 * horizontalMargin) -
                                    (2 * horizontalPadding)) /
                                    4,
                                padding: const EdgeInsets.only(
                                    top: 17.5, bottom: 22.5),
                                alignment: selected == index
                                    ? Alignment.topCenter
                                    : Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 35.0,
                                  width: 35.0,
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration:
                                      const Duration(milliseconds: 575),
                                      switchInCurve: Curves.easeOut,
                                      switchOutCurve: Curves.easeOut,
                                      child: selected == index
                                          ? Image.asset(
                                        icon,
                                        // key: ValueKey('yellow$icon'),
                                        width: 30.0,
                                        color: Colors.white,
                                      )
                                          : Image.asset(
                                        icon,
                                        // key: ValueKey('white$icon'),
                                        width: 30.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarPainter extends CustomPainter {
  double x;

  AppBarPainter(this.x);

  double height = 80.0;
  double start = 40.0;
  double end = 120;

  @override
  void paint(Canvas canvas, Size size) {
    // Define a gradient
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF007AFF), Color(0xFF00D4FF)], // Change these colors to your desired gradient
    );
    // Create a paint object with the gradient
    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromPoints(Offset(0, 0), Offset(0, size.height))) // Use the gradient as a shader
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0.0, start);

    /// DROP paths, included X for animation
    path.lineTo((x) < 20.0 ? 20.0 : x, start);
    path.quadraticBezierTo(20.0 + x, start, 30.0 + x, start + 30.0);
    path.quadraticBezierTo(40.0 + x, start + 55.0, 70.0 + x, start + 55.0);
    path.quadraticBezierTo(100.0 + x, start + 55.0, 110.0 + x, start + 30.0);
    path.quadraticBezierTo(
        120.0 + x,
        start,
        (140.0 + x) > (size.width - 20.0) ? (size.width - 20.0) : 140.0 + x,
        start);
    path.lineTo(size.width - 20.0, start);

    /// Box with BorderRadius
    path.quadraticBezierTo(size.width, start, size.width, start + 25.0);
    path.lineTo(size.width, end - 25.0);
    path.quadraticBezierTo(size.width, end, size.width - 25.0, end);
    path.lineTo(25.0, end);
    path.quadraticBezierTo(0.0, end, 0.0, end - 25.0);
    path.lineTo(0.0, start + 25.0);
    path.quadraticBezierTo(0.0, start, 20.0, start);
    path.close();

    canvas.drawPath(path, paint);

    /// Circle to show at the top of the drop
    canvas.drawCircle(Offset(x + 70.0, 50.0), 35.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
