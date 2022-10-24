import '../utils/enum_helpers.dart';

enum DurationType { MINUTES, TICKS }

final durationTypeValues = EnumValues({
  "minutes": DurationType.MINUTES,
  "ticks": DurationType.TICKS,
});

extension DurationTypeExtension on DurationType {
  String toDisplayString() {
    switch (this) {
      case DurationType.MINUTES:
        return 'Minutes';

      case DurationType.TICKS:
        return 'Ticks';
    }
  }
}
