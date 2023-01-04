import 'package:envelope_budget_app/features/accounts/data/repository/account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/account.dart';

class AccountBloc extends Cubit<List<Account>>{
  AccountBloc():super([]){
    getAllAccounts().then((value) => emit(value));
  }

  var accountRepo = AccountRepository();

  Future<List<Account>> getAllAccounts()async{
    return await accountRepo.getAllAccounts();
  }
}