import 'package:flutter/material.dart';
import 'package:local_first/Utility/app_font_style.dart';
import 'package:local_first/Utility/colors_utility.dart';

class CustomBottomNavBarDot extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<ExactAssetImage> iconList;
  final List<String> textList;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double radius;
  final double sizeIcon;
  final bool showLabel;

  const CustomBottomNavBarDot({
    super.key,
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.iconList,
    required this.textList,
    this.backgroundColor = Colors.white,
    this.selectedColor = Colors.red,
    this.unselectedColor = Colors.grey,
    this.radius = 0.0,
    this.sizeIcon = 24,
    this.showLabel = true,
  });

  @override
  _CustomBottomNavBarDotState createState() => _CustomBottomNavBarDotState();
}

class _CustomBottomNavBarDotState extends State<CustomBottomNavBarDot> {
  int _selectedIndex = 0;
  List<ExactAssetImage> _iconList = [];
  List<String> _textList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _textList = widget.textList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i, _textList[i]));
    }

    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.radius), topRight: Radius.circular(widget.radius))),
      child: Row(
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(ExactAssetImage icon, int index, String text) {
    return InkWell(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / _iconList.length,
            padding: const EdgeInsets.only(top: 20),
            child: Image(
              image: icon,
              height: widget.sizeIcon,
              width: widget.sizeIcon,
              color: _selectedIndex == index ? widget.selectedColor : widget.unselectedColor,
            ),
          ),
          Visibility(
            visible: widget.showLabel,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              //_selectedIndex == index ? widget.selectedColor : widget.unselectedColor
              child: Text(
                text,
                style: _selectedIndex == index
                    ? AppFontStyle.blackOpenSans12W500
                        .copyWith(color: widget.selectedColor, fontWeight: FontWeight.w700)
                    : AppFontStyle.blackOpenSans12W500.copyWith(color: widget.unselectedColor),
              ),
            ),
          ),
          _selectedIndex == index ? selectedDot() : unselectedDot(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget selectedDot() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 4,
      height: 4,
      margin: const EdgeInsets.only(bottom: 4),
      decoration:
          BoxDecoration(color: widget.selectedColor, borderRadius: BorderRadius.circular(2)),
    );
  }

  Widget unselectedDot() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 4,
      height: 4,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(2)),
    );
  }
}
