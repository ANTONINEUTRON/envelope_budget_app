
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../income/data/repository/balance_repository.dart';

class BalanceBloc extends Cubit<double>{
  BalanceBloc()
      :super(0.0){
    emitBalance();
  }

  BalanceRepository balRepo = BalanceRepository();

  Future<void> emitBalance() async{
    emit(await balRepo.getBalance());
  }

  Future<void> addToBalance(double newAmount) async {
    await balRepo.addBalance(newAmount + state);
    emitBalance();
  }

  Future<void> debitBalance(double amount) async {
    await balRepo.updateBalance(state - amount);
    emitBalance();
  }
}