
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/create_session/components/circle_color_item.dart';

class GridColorPicker extends StatefulWidget {
  final List<Color> colors;

  const GridColorPicker({
    Key? key,
    required this.colors
  }) : super(key: key);

  @override
  State<GridColorPicker> createState() => _GridColorPickerState();
}

class _GridColorPickerState extends State<GridColorPicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 30,
          mainAxisSpacing: 15
        ),
        itemCount: widget.colors.length,
        itemBuilder: (value, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: CircleColotItem(
              color: widget.colors[index],
              isChecked: selectedIndex == index,
            ),
          );
        }
      ),
    );
  }
}
