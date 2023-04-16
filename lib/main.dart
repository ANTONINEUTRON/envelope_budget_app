import 'package:envelope_budget_app/features/home/ui/bloc/balance_bloc.dart';
import 'package:envelope_budget_app/features/income/ui/bloc/income_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/budgets/data/repositories/budget_repository.dart';
import 'features/budgets/ui/bloc/budget_bloc.dart';
import 'features/home/ui/page/home_page.dart';
import 'features/home/ui/page/login_page.dart';
import 'features/income/data/repository/balance_repository.dart';
import 'features/income/data/repository/card_repository.dart';
import 'features/notifications/ui/bloc/notification_bloc.dart';

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
        RepositoryProvider(
          create: (context) => CardRepository(),
        ),
        RepositoryProvider(
          create: (context) => BalanceRepository(),
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
          ),
          BlocProvider(
            create: (context)=> BalanceBloc(),
          ),
          BlocProvider(
            create: (context)=> NotificationBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Envelope Budget App',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.white
          ),
          debugShowCheckedModeBanner: false,
          home: LoginPage()// const HomePage(),
        ),
      ),
    );
  }
}