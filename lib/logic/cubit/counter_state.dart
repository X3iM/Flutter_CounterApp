part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;

  CounterState({@required this.counterValue});

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CounterState(counterValue: map['counterValue']);
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source));

  @override
  String toString() => 'CounterState(counteValue: $counterValue)';
}