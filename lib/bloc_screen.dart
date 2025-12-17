import 'package:bloc_basics/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key, required this.title});
  final String title;

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  final bloc = CounterBloc(0);

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Updating the count using BLoC:'),

            BlocBuilder<CounterBloc, int>(
              // for bloc
              bloc: bloc,
              builder: (context, state) => Text(
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => bloc.add(CounterIncrement()),
                  child: const Icon(Icons.add),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () => bloc.add(CounterDecrement()),

                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
