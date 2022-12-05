import 'package:flutter/material.dart';

class OptionsBottomBar extends StatelessWidget {
  const OptionsBottomBar({Key? key}) : super(key: key);

  Widget _buildItem({required IconData icon, required String text}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.black45,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItem(icon: Icons.image_outlined, text: 'Photos'),
              _buildItem(icon: Icons.circle_outlined, text: 'Forms'),
              _buildItem(icon: Icons.sunny, text: 'Themes'),
              _buildItem(icon: Icons.color_lens_outlined, text: 'Colors'),
              _buildItem(icon: Icons.numbers, text: 'Numbers'),
            ],
          ),
        ),
      ),
    );
  }
}
