import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/budgets/data/repositories/budget_repository.dart';
import 'features/budgets/ui/bloc/budget_bloc.dart';
import 'features/home/ui/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BudgetRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context)=> BudgetBloc(
                  budgetRepository: context.read<BudgetRepository>()
              )
          ),
          BlocProvider(
            create: (context)=> IncomeBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Envelope Budget App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.white70
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}