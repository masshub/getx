/// Simple Animation Framework
library simple_animations;

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:rent/plugin/pedantic/pedantic.dart';
import 'package:rent/plugin/supercharged/supercharged/supercharged.dart';

part 'anicoto/animation_controller_extension.dart';
part 'anicoto/animation_mixin.dart';
part 'developer_tools/animation_developer_tools.dart';
part 'plasma/factory.dart';
part 'plasma/legacy_plasma.dart';
part 'plasma/plasma.dart';
part 'plasma/types/bubbles.dart';
part 'plasma/types/circle.dart';
part 'plasma/types/infinity.dart';
part 'multi_tween/default_animation_properties.dart';
part 'multi_tween/multi_tween.dart';
part 'stateless_animation/animated_widget_builder.dart';
part 'stateless_animation/custom_animation.dart';
part 'stateless_animation/loop_animation.dart';
part 'stateless_animation/mirror_animation.dart';
part 'stateless_animation/play_animation.dart';
part 'timeline_tween/prop.dart';
part 'timeline_tween/timeline_tween.dart';
