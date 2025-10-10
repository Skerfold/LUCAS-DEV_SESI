# exemplo_image

A new Flutter project.


//   final Animation<double> progress;
        ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:145:9: Error: 'Color' isn't a type.
  final Color color;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:153:32: Error: 'Size' isn't a type.
  void paint(ui.Canvas canvas, Size size) {
                               ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:181:17: Error: 'Offset' isn't a type.
  bool? hitTest(Offset position) => null;
                ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:184:31: Error: 'CustomPainter' isn't a type.
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
                              ^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:196:32: Error: 'Color' isn't a type.
  void paint(ui.Canvas canvas, Color color, _UiPathFactory uiPathFactory, double progress) {
                               ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:199:17: Error: The getter 'PaintingStyle' isn't defined for the type '_PathFrames'.
 - '_PathFrames' is from 'package:flutter/src/material/animated_icons.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/animated_icons.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'PaintingStyle'.
      ..style = PaintingStyle.fill
                ^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:226:14: Error: 'Offset' isn't a type.
  final List<Offset> points;
             ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:229:14: Error: 'Path' isn't a type.
  void apply(Path path, double progress) {
             ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:230:11: Error: 'Offset' isn't a type.
    final Offset offset = _interpolate<Offset?>(points, progress, Offset.lerp)!;  
          ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:230:40: Error: 'Offset' isn't a type.
    final Offset offset = _interpolate<Offset?>(points, progress, Offset.lerp)!;  
                                       ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:230:67: Error: The getter 'Offset' isn't defined for the type '_PathMoveTo'.   
 - '_PathMoveTo' is from 'package:flutter/src/material/animated_icons.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/animated_icons.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'Offset'.
    final Offset offset = _interpolate<Offset?>(points, progress, Offset.lerp)!;  
                                                                  ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:238:14: Error: 'Offset' isn't a type.
  final List<Offset> controlPoints2;
             ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:239:14: Error: 'Offset' isn't a type.
  final List<Offset> controlPoints1;
             ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:240:14: Error: 'Offset' isn't a type.
  final List<Offset> targetPoints;
             ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:243:14: Error: 'Path' isn't a type.
  void apply(Path path, double progress) {
             ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:244:11: Error: 'Offset' isn't a type.
    final Offset controlPoint1 = _interpolate<Offset?>(controlPoints1, progress, Offset.lerp)!;
          ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:244:47: Error: 'Offset' isn't a type.
    final Offset controlPoint1 = _interpolate<Offset?>(controlPoints1, progress, Offset.lerp)!;
                                              ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:245:11: Error: 'Offset' isn't a type.
    final Offset controlPoint2 = _interpolate<Offset?>(controlPoints2, progress, Offset.lerp)!;
          ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:245:47: Error: 'Offset' isn't a type.
    final Offset controlPoint2 = _interpolate<Offset?>(controlPoints2, progress, Offset.lerp)!;
                                              ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:246:11: Error: 'Offset' isn't a type.
    final Offset targetPoint = _interpolate<Offset?>(targetPoints, progress, Offset.lerp)!;
          ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:246:45: Error: 'Offset' isn't a type.
    final Offset targetPoint = _interpolate<Offset?>(targetPoints, progress, Offset.lerp)!;
                                            ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:244:82: Error: The getter 'Offset' isn't defined for the type '_PathCubicTo'.  
 - '_PathCubicTo' is from 'package:flutter/src/material/animated_icons.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/animated_icons.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'Offset'.
    final Offset controlPoint1 = _interpolate<Offset?>(controlPoints1, progress, Offset.lerp)!;
                                                                        ^^^^^^    
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:245:82: Error: The getter 'Offset' isn't defined for the type '_PathCubicTo'.  
 - '_PathCubicTo' is from 'package:flutter/src/material/animated_icons.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/animated_icons.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'Offset'.
    final Offset controlPoint2 = _interpolate<Offset?>(controlPoints2, progress, Offset.lerp)!;
                                                                        ^^^^^^    
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:246:78: Error: The getter 'Offset' isn't defined for the type '_PathCubicTo'.  
 - '_PathCubicTo' is from 'package:flutter/src/material/animated_icons.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/animated_icons.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'Offset'.
    final Offset targetPoint = _interpolate<Offset?>(targetPoints, progress, Offset.lerp)!;
                                                                        ^^^^^^    
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:262:14: Error: 'Offset' isn't a type.
  final List<Offset> points;
             ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:265:14: Error: 'Path' isn't a type.
  void apply(Path path, double progress) {
             ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:266:11: Error: 'Offset' isn't a type.
    final Offset point = _interpolate<Offset?>(points, progress, Offset.lerp)!;   
          ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:266:39: Error: 'Offset' isn't a type.
    final Offset point = _interpolate<Offset?>(points, progress, Offset.lerp)!;   
                                      ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:266:66: Error: The getter 'Offset' isn't defined for the type '_PathLineTo'.   
 - '_PathLineTo' is from 'package:flutter/src/material/animated_icons.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/animated_icons.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'Offset'.
    final Offset point = _interpolate<Offset?>(points, progress, Offset.lerp)!;   
                                                                 ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons.dart:275:14: Error: 'Path' isn't a type.
  void apply(Path path, double progress) {
             ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/animated_icons/animated_icons_data.dart:126:9: Error: 'Size' isn't a type.
  final Size size;
        ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:171:9: Error: Type 'TextStyle' not found.
  final TextStyle? labelStyle;
        ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:173:9: Error: Type 'EdgeInsetsGeometry' not found.
  final EdgeInsetsGeometry? labelPadding;
        ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:181:9: Error: Type 'BorderSide' not found.
  final BorderSide? side;
        ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:183:9: Error: Type 'OutlinedBorder' not found.
  final OutlinedBorder? shape;
        ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:185:9: Error: Type 'Clip' not found.
  final Clip clipBehavior;
        ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:191:31: Error: Type 'Color' not found.
  final MaterialStateProperty<Color?>? color;
                              ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:193:9: Error: Type 'Color' not found.
  final Color? backgroundColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:195:9: Error: Type 'Color' not found.
  final Color? disabledColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:197:9: Error: Type 'EdgeInsetsGeometry' not found.
  final EdgeInsetsGeometry? padding;
        ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:205:9: Error: Type 'Color' not found.
  final Color? shadowColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:207:9: Error: Type 'Color' not found.
  final Color? surfaceTintColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:211:9: Error: Type 'BoxConstraints' not found.
  final BoxConstraints? avatarBoxConstraints;
        ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:215:9: Error: Type 'MouseCursor' not found.
  final MouseCursor? mouseCursor;
        ^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:290:3: Error: Type 'TextStyle' not found.
  TextStyle? get labelStyle => _textTheme.labelLarge?.copyWith(
  ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:297:25: Error: Type 'Color' not found.
  MaterialStateProperty<Color?>? get color =>
                        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:310:3: Error: Type 'Color' not found.
  Color? get shadowColor => _chipVariant == _ChipVariant.flat
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:315:3: Error: Type 'Color' not found.
  Color? get surfaceTintColor => Colors.transparent;
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:318:3: Error: Type 'Color' not found.
  Color? get checkmarkColor => null;
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:321:3: Error: Type 'Color' not found.
  Color? get deleteIconColor => null;
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:324:3: Error: Type 'BorderSide' not found.
  BorderSide? get side => _chipVariant == _ChipVariant.flat
  ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:339:3: Error: Type 'EdgeInsetsGeometry' not found.
  EdgeInsetsGeometry? get padding => const EdgeInsets.all(8.0);
  ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:350:3: Error: Type 'EdgeInsetsGeometry' not found.
  EdgeInsetsGeometry? get labelPadding {
  ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:109:25: Error: Undefined name 'Clip'.
    this.clipBehavior = Clip.none,
                        ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:146:25: Error: Undefined name 'Clip'.
    this.clipBehavior = Clip.none,
                        ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:171:9: Error: 'TextStyle' isn't a type.
  final TextStyle? labelStyle;
        ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:173:9: Error: 'EdgeInsetsGeometry' isn't a type.
  final EdgeInsetsGeometry? labelPadding;
        ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:181:9: Error: 'BorderSide' isn't a type.
  final BorderSide? side;
        ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:183:9: Error: 'OutlinedBorder' isn't a type.
  final OutlinedBorder? shape;
        ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:185:9: Error: 'Clip' isn't a type.
  final Clip clipBehavior;
        ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:191:31: Error: 'Color' isn't a type.
  final MaterialStateProperty<Color?>? color;
                              ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:193:9: Error: 'Color' isn't a type.
  final Color? backgroundColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:195:9: Error: 'Color' isn't a type.
  final Color? disabledColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:197:9: Error: 'EdgeInsetsGeometry' isn't a type.
  final EdgeInsetsGeometry? padding;
        ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:205:9: Error: 'Color' isn't a type.
  final Color? shadowColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:207:9: Error: 'Color' isn't a type.
  final Color? surfaceTintColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:211:9: Error: 'BoxConstraints' isn't a type.
  final BoxConstraints? avatarBoxConstraints;
        ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:215:9: Error: 'MouseCursor' isn't a type.
  final MouseCursor? mouseCursor;
        ^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:271:76: Error: Undefined name 'Radius'.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                                        ^^^^^^    
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:271:83: Error: Method invocation is not a constant expression.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                                        ^^^^^^^^  
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:271:59: Error: Undefined name 'BorderRadius'.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                          ^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:271:72: Error: Method invocation is not a constant expression.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                                       ^^^        
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:271:22: Error: Couldn't find constructor 'RoundedRectangleBorder'.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                     ^^^^^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:328:13: Error: Not a constant expression.
    : const BorderSide(color: Colors.transparent);
            ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:326:11: Error: The method 'BorderSide' isn't defined for the type '_ActionChipDefaultsM3'.       
 - '_ActionChipDefaultsM3' is from 'package:flutter/src/material/action_chip.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart').
Try correcting the name to the name of an existing method, or defining a method named 'BorderSide'.
        ? BorderSide(color: _colors.outlineVariant)
          ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:327:11: Error: The method 'BorderSide' isn't defined for the type '_ActionChipDefaultsM3'.       
 - '_ActionChipDefaultsM3' is from 'package:flutter/src/material/action_chip.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart').
Try correcting the name to the name of an existing method, or defining a method named 'BorderSide'.
        : BorderSide(color: _colors.onSurface.withOpacity(0.12))
          ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:339:44: Error: Couldn't find constructor 'EdgeInsets.all'.
  EdgeInsetsGeometry? get padding => const EdgeInsets.all(8.0);
                                           ^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:354:13: Error: Couldn't find constructor 'EdgeInsets.symmetric'.
      const EdgeInsets.symmetric(horizontal: 8.0),
            ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:355:13: Error: Couldn't find constructor 'EdgeInsets.symmetric'.
      const EdgeInsets.symmetric(horizontal: 4.0),
            ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart:353:12: Error: The getter 'EdgeInsets' isn't defined for the type '_ActionChipDefaultsM3'.       
 - '_ActionChipDefaultsM3' is from 'package:flutter/src/material/action_chip.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/action_chip.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'EdgeInsets'.
    return EdgeInsets.lerp(
           ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:195:3: Error: Type 'Color' not found.
  Color? barrierColor,
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:199:3: Error: Type 'Offset' not found.
  Offset? anchorPoint,
  ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:251:3: Error: Type 'Color' not found.
  Color? barrierColor,
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:255:3: Error: Type 'Offset' not found.
  Offset? anchorPoint,
  ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1162:9: Error: Type 'TextStyle' not found.
  final TextStyle? titleTextStyle;
        ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1163:9: Error: Type 'Color' not found.
  final Color? foregroundColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1626:3: Error: Type 'ConstrainedBox' not found.
  ConstrainedBox _masterPanel(BuildContext context, {bool needsScaffold = false}) {
  ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:195:3: Error: 'Color' isn't a type.
  Color? barrierColor,
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:199:3: Error: 'Offset' isn't a type.
  Offset? anchorPoint,
  ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:251:3: Error: 'Color' isn't a type.
  Color? barrierColor,
  ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:255:3: Error: 'Offset' isn't a type.
  Offset? anchorPoint,
  ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:431:34: Error: Couldn't find constructor 'EdgeInsets.symmetric'.
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                 ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:436:29: Error: Not a constant expression.
                      const SizedBox(height: _textVerticalSeparation),
                            ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:423:16: Error: The method 'ListBody' isn't defined for the type 'AboutDialog'.
 - 'AboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ListBody'.
      content: ListBody(
               ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:425:11: Error: The method 'Row' isn't defined for the type 'AboutDialog'.
 - 'AboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Row'.
          Row(
          ^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:426:33: Error: The getter 'CrossAxisAlignment' isn't defined for the type 'AboutDialog'.
 - 'AboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'CrossAxisAlignment'.
            crossAxisAlignment: CrossAxisAlignment.start,
                                ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:429:15: Error: The method 'Expanded' isn't defined for the type 'AboutDialog'.
 - 'AboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Expanded'.
              Expanded(
              ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:430:24: Error: The method 'Padding' isn't defined for the type 'AboutDialog'.
 - 'AboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
                child: Padding(
                       ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:432:26: Error: The method 'ListBody' isn't defined for the type 'AboutDialog'.
 - 'AboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ListBody'.
                  child: ListBody(
                         ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:579:34: Error: Couldn't find constructor 'EdgeInsets.symmetric'.
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                 ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:584:29: Error: Not a constant expression.
                      const SizedBox(height: _textVerticalSeparation),
                            ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:571:16: Error: The method 'ListBody' isn't defined for the type '_AdaptiveAboutDialog'.
 - '_AdaptiveAboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ListBody'.
      content: ListBody
               ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:573:11: Error: The method 'Row' isn't defined for the type '_AdaptiveAboutDialog'.
 - '_AdaptiveAboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Row'.
          Row(
          ^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:574:33: Error: The getter 'CrossAxisAlignment' isn't defined for the type '_AdaptiveAboutDialog'.      
 - '_AdaptiveAboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'CrossAxisAlignment'.
            crossAxisAlignment: CrossAxisAlignment.start,
                                ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:577:15: Error: The method 'Expanded' isn't defined for the type '_AdaptiveAboutDialog'.
 - '_AdaptiveAboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Expanded'.
              Expanded(
              ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:578:24: Error: The method 'Padding' isn't defined for the type '_AdaptiveAboutDialog'.
 - '_AdaptiveAboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
                child: Padding(
                       ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:580:26: Error: The method 'ListBody' isn't defined for the type '_AdaptiveAboutDialog'.
 - '_AdaptiveAboutDialog' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ListBody'.
                  child: ListBody(
                         ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:717:30: Error: Couldn't find constructor 'EdgeInsets.only'.
              padding: const EdgeInsets.only(bottom: _textVerticalSeparation),    
                             ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:730:17: Error: Not a constant expression.
          const SizedBox(height: _textVerticalSeparation),
                ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:709:12: Error: The method 'Padding' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
    return Padding(
           ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:710:16: Error: The getter 'EdgeInsets' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'EdgeInsets'.
      padding: EdgeInsets.symmetric(horizontal: _getGutterSize(context), vertical: 24.0),
               ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:711:14: Error: The method 'Column' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Column'.
      child: Column(
             ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:713:83: Error: The getter 'TextAlign' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'TextAlign'.
          Text(name, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                                                                        ^^^^^^^^^ 
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:716:13: Error: The method 'Padding' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
            Padding(
            ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:721:28: Error: The getter 'TextAlign' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'TextAlign'.
                textAlign: TextAlign.center,
                           ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:728:26: Error: The getter 'TextAlign' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'TextAlign'.
              textAlign: TextAlign.center,
                         ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:734:24: Error: The getter 'TextAlign' isn't defined for the type '_AboutProgram'.
 - '_AboutProgram' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'TextAlign'.
            textAlign: TextAlign.center,
                       ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:768:43: Error: 'BoxConstraints' isn't a type.
          builder: (BuildContext context, BoxConstraints constraints) {
                                          ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:793:46: Error: Not a constant expression.
                          constraints: const BoxConstraints(maxWidth: 600.0),     
                                             ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:813:29: Error: Not a constant expression.
                      const Center(child: CircularProgressIndicator()),
                            ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:782:26: Error: The method 'Center' isn't defined for the type '_PackagesViewState'.
 - '_PackagesViewState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Center'.
                  return Center(child: Text(snapshot.error.toString()));
                         ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:788:28: Error: The method 'Center' isn't defined for the type '_PackagesViewState'.
 - '_PackagesViewState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Center'.
                    return Center(
                           ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:792:32: Error: The method 'ConstrainedBox' isn't defined for the type '_PackagesViewState'.
 - '_PackagesViewState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ConstrainedBox'.
                        child: ConstrainedBox(
                               ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:810:26: Error: The method 'Column' isn't defined for the type '_PackagesViewState'.
 - '_PackagesViewState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Column'.
                  child: Column(
                         ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1030:46: Error: Not a constant expression.
        _licenses.add(const Padding(padding: EdgeInsets.all(18.0), child: Divider()));
                                             ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1030:57: Error: Method invocation is not a constant expression.
        _licenses.add(const Padding(padding: EdgeInsets.all(18.0), child: Divider()));
                                                        ^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1030:29: Error: Not a constant expression.
        _licenses.add(const Padding(padding: EdgeInsets.all(18.0), child: Divider()));
                            ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1035:32: Error: Couldn't find constructor 'EdgeInsets.only'.
                padding: const EdgeInsets.only(top: 16.0),
                               ^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1038:54: Error: Not a constant expression.
                  style: const TextStyle(fontWeight: FontWeight.bold),
                                                     ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1038:32: Error: Not a constant expression.
                  style: const TextStyle(fontWeight: FontWeight.bold),
                               ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1034:15: Error: The method 'Padding' isn't defined for the type '_PackageLicensePageState'.
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
              Padding(
              ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1039:30: Error: The getter 'TextAlign' isn't defined for the type '_PackageLicensePageState'.
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'TextAlign'.
                  textAlign: TextAlign.center,
                             ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1046:15: Error: The method 'Padding' isn't defined for the type '_PackageLicensePageState'.
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
              Padding(
              ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1047:26: Error: The getter 'EdgeInsetsDirectional' isn't defined for the type '_PackageLicensePageState'.
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'EdgeInsetsDirectional'.
                padding: EdgeInsetsDirectional.only(top: 8.0, start: 16.0 * paragraph.indent),
                         ^^^^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1072:11: Error: 'EdgeInsets' isn't a type.
    final EdgeInsets padding = EdgeInsets.only(left: pad, right: pad, bottom: pad);
          ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1077:20: Error: Not a constant expression.
          padding: EdgeInsets.symmetric(vertical: 24.0),
                   ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1077:31: Error: Method invocation is not a constant expression.
          padding: EdgeInsets.symmetric(vertical: 24.0),
                              ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1078:18: Error: Not a constant expression.
          child: Center(child: CircularProgressIndicator()),
                 ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1076:15: Error: Not a constant expression.
        const Padding(
              ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1099:34: Error: Not a constant expression.
              constraints: const BoxConstraints(maxWidth: 600.0),
                                 ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1072:32: Error: The getter 'EdgeInsets' isn't defined for the type '_PackageLicensePageState'.
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'EdgeInsets'.
    final EdgeInsets padding = EdgeInsets.only(left: pad, right: pad, bottom: pad);
                               ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1094:15: Error: The method 'Center' isn't defined for the type '_PackageLicensePageState'.
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Center'.
        body: Center(
              ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1098:20: Error: The method 'ConstrainedBox' isn't defined for the type '_PackageLicensePageState'.     
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ConstrainedBox'.
            child: ConstrainedBox(
                   ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1130:11: Error: The method 'SliverPadding' isn't defined for the type '_PackageLicensePageState'.      
 - '_PackageLicensePageState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'SliverPadding'.
          SliverPadding(
          ^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1162:9: Error: 'TextStyle' isn't a type.
  final TextStyle? titleTextStyle;
        ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1163:9: Error: 'Color' isn't a type.
  final Color? foregroundColor;
        ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1167:11: Error: 'TextStyle' isn't a type.
    final TextStyle? effectiveTitleTextStyle = titleTextStyle ?? theme.titleLarge;
          ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1168:12: Error: The method 'Column' isn't defined for the type '_PackageLicensePageTitle'.
 - '_PackageLicensePageTitle' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Column'.
    return Column(
           ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1169:26: Error: The getter 'MainAxisAlignment' isn't defined for the type '_PackageLicensePageTitle'.  
 - '_PackageLicensePageTitle' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'MainAxisAlignment'.
      mainAxisAlignment: MainAxisAlignment.center,
                         ^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1170:27: Error: The getter 'CrossAxisAlignment' isn't defined for the type '_PackageLicensePageTitle'. 
 - '_PackageLicensePageTitle' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'CrossAxisAlignment'.
      crossAxisAlignment: CrossAxisAlignment.start,
                          ^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1371:39: Error: 'BoxConstraints' isn't a type.
      builder: (BuildContext context, BoxConstraints constraints) {
                                      ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1424:16: Error: The method 'BlockSemantics' isn't defined for the type '_MasterDetailFlowState'.       
 - '_MasterDetailFlowState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'BlockSemantics'.
        return BlockSemantics(
               ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1449:18: Error: The method 'BlockSemantics' isn't defined for the type '_MasterDetailFlowState'.       
 - '_MasterDetailFlowState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'BlockSemantics'.
          child: BlockSemantics(child: widget.detailPageBuilder(context, arguments, null)),
                 ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1564:36: Error: Couldn't find constructor 'Size.fromHeight'.
              preferredSize: const Size.fromHeight(kToolbarHeight),
                                   ^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1572:40: Error: Couldn't find constructor 'EdgeInsets.all'.
                        padding: const EdgeInsets.all(8),
                                       ^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1601:53: Error: 'Animation' isn't a type.
                  transitionBuilder: (Widget child, Animation<double> animation) =>
                                                    ^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1556:12: Error: The method 'Stack' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Stack'.
    return Stack(
           ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1565:22: Error: The method 'Row' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Row'.
              child: Row(
                     ^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1567:19: Error: The method 'SizedBox' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'SizedBox'.
                  SizedBox(
                  ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1571:30: Error: The method 'Padding' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
                      child: Padding(
                             ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1573:32: Error: The method 'Align' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Align'.
                        child: Align(
                               ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1574:38: Error: The getter 'AlignmentDirectional' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'AlignmentDirectional'.
                          alignment: AlignmentDirectional.centerEnd,
                                     ^^^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1588:17: Error: The method 'Align' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Align'.
          body: Align(alignment: AlignmentDirectional.centerStart, child: _masterPanel(context)),
                ^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1588:34: Error: The getter 'AlignmentDirectional' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'AlignmentDirectional'.
          body: Align(alignment: AlignmentDirectional.centerStart, child: _masterPanel(context)),
                                 ^^^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1592:18: Error: The method 'Padding' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'Padding'.
          child: Padding(
                 ^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1593:22: Error: The getter 'EdgeInsetsDirectional' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'EdgeInsetsDirectional'.
            padding: EdgeInsetsDirectional.only(
                     ^^^^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1610:26: Error: The getter 'SizedBox' isn't defined for the type '_MasterDetailScaffoldState'.
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'SizedBox'.
                  child: SizedBox.expand(
                         ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1627:12: Error: The method 'ConstrainedBox' isn't defined for the type '_MasterDetailScaffoldState'.   
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'ConstrainedBox'.
    return ConstrainedBox(
           ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1628:20: Error: The method 'BoxConstraints' isn't defined for the type '_MasterDetailScaffoldState'.   
 - '_MasterDetailScaffoldState' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'BoxConstraints'.
      constraints: BoxConstraints(maxWidth: masterViewWidth),
                   ^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1653:20: Error: Couldn't find constructor 'SizedBox.shrink'.
      return const SizedBox.shrink();
                   ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1669:27: Error: Couldn't find constructor 'EdgeInsets.fromLTRB'.
            margin: const EdgeInsets.fromLTRB(_kCardElevation, 0.0, _kCardElevation, 0.0),
                          ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1671:56: Error: Not a constant expression.
              borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),     
                                                       ^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1671:63: Error: Method invocation is not a constant expression.
              borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),     
                                                              ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1671:29: Error: Not a constant expression.
              borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),     
                            ^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1671:42: Error: Method invocation is not a constant expression.
              borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),     
                                         ^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1670:26: Error: Not a constant expression.
            shape: const RoundedRectangleBorder(
                         ^^^^^^^^^^^^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1663:16: Error: The method 'MouseRegion' isn't defined for the type '_DetailView'.
 - '_DetailView' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing method, or defining a method named 'MouseRegion'.
        return MouseRegion(
               ^^^^^^^^^^^
/C:/src/flutter/packages/flutter/lib/src/material/about.dart:1668:27: Error: The getter 'Clip' isn't defined for the type '_DetailView'.
 - '_DetailView' is from 'package:flutter/src/material/about.dart' ('/C:/src/flutter/packages/flutter/lib/src/material/about.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field named 'Clip'.
            clipBehavior: Clip.antiAlias,
                          ^^^^
Target kernel_snapshot_program failed: Exception


FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:compileFlutterBuildDebug'.
> Process 'command 'C:\src\flutter\bin\flutter.bat'' finished with non-zero exit value 1

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

BUILD FAILED in 8s
Running Gradle task 'assembleDebug'...                             49,1s
Error: Gradle task assembleDebug failed with exit code 1
PS C:\Users\DevSESIB.DESKTOP-B4KTFA6.002\Documents\LUCAS DEV_SESI\Hardware\Midia\exemplo_image>