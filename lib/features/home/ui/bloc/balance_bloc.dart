
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../income/data/repository/balance_repository.dart';

class BalanceBloc extends Cubit<double>{
  BalanceBloc()
      :super(0.0);

  BalanceRepository balRepo = BalanceRepository();

  Future<void> emitBalance() async{
    emit(await balRepo.getBalance());
  }

  Future<void> addToBalance(double newAmount) async {
    balRepo.addBalance(newAmount + state);
    emitBalance();
  }
}