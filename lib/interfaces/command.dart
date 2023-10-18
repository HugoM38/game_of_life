import 'package:game_of_life/classes/enum_life.dart';

abstract class Command {
  Map<int, Life> execute();
} 