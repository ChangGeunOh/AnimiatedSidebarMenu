import 'package:flutter/material.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    super.key,
    required this.press,
    required this.isClosed,
  });

  final VoidCallback press;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(left: 16),
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(
            isClosed ? Icons.menu : Icons.close,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
