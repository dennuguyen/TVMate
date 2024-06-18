import 'package:flutter/material.dart';
import 'package:tvmate/src/draggable_canvas/interactive/interactable.dart';
import 'package:tvmate/src/draggable_canvas/interactive/shapeable.dart';

abstract class InteractiveItem extends CustomPainter
    implements Interactable, Shapeable {}
