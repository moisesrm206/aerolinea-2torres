import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

class FigmaAsset extends StatelessWidget {
  const FigmaAsset(this.name, {super.key, this.size, this.color});

  final String name;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'lib/assets/figma/$name.svg',
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
