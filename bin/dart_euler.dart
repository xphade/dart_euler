// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:args/args.dart';
import 'package:dart_euler/dart_euler.dart';

void main(List<String> args) {
  final allowedValues = List.generate(50, (index) => (index + 1).toString());
  final parser = ArgParser()
    ..addOption('problem', abbr: 'p', allowed: allowedValues);

  final ArgResults arguments;
  try {
    arguments = parser.parse(args);
  } on ArgParserException catch (e) {
    print("Could not parse command-line arguments: ${e.message}");
    return;
  }

  final problem = arguments['problem'] as String?;
  if (problem == null) {
    printAllSolutions();
  } else {
    printSpecificSolution(int.parse(problem));
  }
}
