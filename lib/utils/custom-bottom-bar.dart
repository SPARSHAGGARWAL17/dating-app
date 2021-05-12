library bottom_bar;

import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  /// Creates a `CustomBottomBar` that displays a list of `BottomBarItem` along with
  /// added animations whenever a `BottomBarItem` is clicked
  CustomBottomBar({
    Key? key,
    required this.selectedIndex,
    this.curve = Curves.easeOutQuint,
    this.duration = const Duration(milliseconds: 750),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    required this.items,
    required this.onTap,
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  }) : super(key: key);

  /// Current index that is selected
  final int selectedIndex;

  /// Animation Curve of animation
  final Curve curve;

  /// Duration of the animation
  final Duration duration;

  /// Padding between the background color and
  /// (`Row` that contains icon and title)
  final EdgeInsets itemPadding;

  /// List of `BottomBarItems` to display
  final List<BottomBarItem> items;

  /// Fires this callback whenever a `BottomBarItem` is tapped
  ///
  /// Use this callback to update the `selectedIndex`
  final ValueChanged<int> onTap;

  /// `TextStyle` of title
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final _brightness = Theme.of(context).brightness;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          items.length,
          (int index) {
            // Color when BottomBarItem is selected
            final _selectedColor = _brightness == Brightness.light
                ? items[index].activeColor
                : items[index].darkActiveColor ?? items[index].activeColor;

            // Color of Material and InkWell
            final _selectedColorWithOpacity = _selectedColor;

            // Color of title when BottomBarItem is NOT selected
            final _inactiveColor = items[index].inactiveColor ??
                (_brightness == Brightness.light
                    ? const Color(0xFF404040)
                    : const Color(0xF2FFFFFF));

            // Right padding of Row that contains icon and title
            final _rightPadding = itemPadding.right;

            return TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0,
                end: index == selectedIndex ? 1 : 0,
              ),
              curve: curve,
              duration: duration,
              builder: (BuildContext context, double value, Widget? child) {
                return Material(
                  color: Color.lerp(
                    _selectedColor.withOpacity(0),
                    _selectedColorWithOpacity,
                    value,
                  ),
                  shape: const StadiumBorder(),
                  child: InkWell(
                    onTap: () => onTap(index),
                    customBorder: const StadiumBorder(),
                    focusColor: _selectedColorWithOpacity,
                    highlightColor: _selectedColorWithOpacity,
                    splashColor: _selectedColorWithOpacity,
                    hoverColor: _selectedColorWithOpacity,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          IconTheme(
                            data: IconThemeData(
                              color: Color.lerp(
                                  _inactiveColor, Colors.white, value),
                              size: 24,
                            ),
                            child: items[index].icon,
                          ),
                          ClipRect(
                            child: SizedBox(
                              height: 20,
                              child: Align(
                                alignment: const Alignment(-0.2, 0),
                                widthFactor: value,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: _rightPadding / 2,
                                    right: _rightPadding,
                                  ),
                                  child: DefaultTextStyle(
                                    style: textStyle.copyWith(
                                      color: Color.lerp(Colors.transparent,
                                          Colors.white, value),
                                    ),
                                    child: items[index].title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BottomBarItem {
  /// This contains information about the item that `CustomBottomBar` has to display
  BottomBarItem({
    required this.icon,
    required this.title,
    required this.activeColor,
    this.darkActiveColor,
    this.inactiveColor,
  });

  /// Icon of `BottomBarItem`.
  /// This will be the icon shown in each `BottomBarItem`
  final Widget icon;

  /// Title of `BottomBarItem`.
  /// This will be the shown next to the icon whenever `BottomBarItem` is
  /// selected
  final Widget title;

  /// Color of `BottomBarItem` during **light mode** when it is selected.
  /// This will be the active color of icon, title, and background
  final Color activeColor;

  /// Color of `BottomBarItem` during **dark mode** when it is selected.
  /// This will be the active color of icon, title, and background.
  final Color? darkActiveColor;

  /// Color of `BottomBarItem` while it is not selected.
  /// This will be the inactive color of icon, title, and background.
  final Color? inactiveColor;
}
