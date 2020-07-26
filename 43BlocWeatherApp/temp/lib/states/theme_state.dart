import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final Color backgroundColor;
  final Color textColor;

  const ThemeState({
    @required this.backgroundColor,
    @required this.textColor
  }):
        assert(backgroundColor != null),
        assert(textColor != null);

  @override
  List<Object> get props => [backgroundColor, textColor];
}