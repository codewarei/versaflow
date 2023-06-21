import 'package:flutter/cupertino.dart';

class TopImage extends StatelessWidget {
  final String imagePath;
  const TopImage({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(imagePath))),
      ),
    );
  }
}
