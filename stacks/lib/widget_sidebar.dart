import 'package:flutter/material.dart';

/*
  Exemple de com usar 'WidgetSidebars'

  WidgetSidebars(
    isSidebarLeftVisible: appData.isSidebarLeftVisible,
    left: const LayoutPartLeft(),
    central: const LayoutPartCentral());
  }
*/

class WidgetSidebars extends StatefulWidget {
  final bool isSidebarLeftVisible;
  final bool isSidebarRightVisible;
  final Widget? left;
  final Widget central;
  final Widget? right;

  const WidgetSidebars({
    Key? key,
    required this.isSidebarLeftVisible,
    this.left,
    required this.central,
    required this.isSidebarRightVisible,
    this.right,
  }) : super(key: key);

  @override
  WidgetSidebarsState createState() => WidgetSidebarsState();
}

class WidgetSidebarsState extends State<WidgetSidebars> {
  @override
  Widget build(BuildContext context) {
    const width = 200.0;
    const millis = 300;

    bool isSidebarLeftVisible = widget.isSidebarLeftVisible;
    bool isSidebarRightVisible = widget.isSidebarRightVisible;

    if (widget.left == null) {
      isSidebarLeftVisible = false;
    }
    if (widget.right == null) {
      isSidebarRightVisible = false;
    }
    return Stack(
      children: [
        // Right Sidebar
        Container(
          alignment: const Alignment(1, -1),
          color: Color.fromRGBO(234, 228, 226, 1),
          width: width,
          child: widget.right,
        ),
        // Left Sidebar
        Container(
          alignment: const Alignment(-1, -1),
          color: Color.fromRGBO(234, 228, 226, 1),
          width: width,
          child: widget.left,
        ),

        // Contingut Principal (central)
        AnimatedPositioned(
          duration: const Duration(milliseconds: millis),
          left: isSidebarLeftVisible ? width : 0,
          right: isSidebarRightVisible ? width : 0,
          top: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: widget.central,
          ),
        ),
      ],
    );
  }
}
