import 'package:flutter/material.dart';
import 'package:flutter_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        context.select((CounterCubit counterCubit) => counterCubit.state.counterValue).toString(),
        style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.bold, fontSize: 128)
    );
  }
}
