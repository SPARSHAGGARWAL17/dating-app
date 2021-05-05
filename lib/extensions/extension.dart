import 'package:bewp_life/export.dart';

extension Expansion on Widget {
  Expanded get expand => Expanded(
        child: this,
        flex: 1,
      );
  Expanded expandFlex(int flex) => Expanded(
        child: this,
        flex: flex,
      );
}
