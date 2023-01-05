
import 'package:envelope_budget_app/features/income/data/model/income.dart';
import 'package:envelope_budget_app/features/income/data/repository/income_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class IncomeBloc extends Cubit<List<Income>>{
  IncomeBloc():super([]){
    getAllIncomes().then((value) => emit(value));
  }

  var incomeRepo = IncomeRepository();

  Future<List<Income>> getAllIncomes()async{
    return await incomeRepo.getAllIncomes();
  }
}