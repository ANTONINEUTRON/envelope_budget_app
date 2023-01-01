import 'package:envelope_budget_app/features/budgets/data/model/budget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/budget_repository.dart';

class BudgetBloc extends Cubit<List<Budget>>{
  BudgetBloc({required this.budgetRepository})
    :super([]){
    emitExistingValues();
  }

  final BudgetRepository budgetRepository;

  void emitExistingValues() {
    getAllBudgets().then((value) => emit(value));
  }

  Future<void> saveBudget({
    required String label,
    required double amount,
    required DateTime deadline
  })async{
    var budget = Budget(
        label: label,
        deadline: deadline,
        amount: amount
    );
    if(await budgetRepository.addBudget(budget)) {
      emit(await getAllBudgets());
    }
  }

  Future<List<Budget>> getAllBudgets() async {
    return await budgetRepository.getAllBudgets();
  }
}