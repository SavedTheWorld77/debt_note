import 'package:dartz/dartz.dart';
import 'package:debt_note/src/features/manage_debt/domain/entities/debt.dart';
import 'package:debt_note/src/features/manage_debt/domain/repository/debt_repository.dart';
import 'package:debt_note/src/features/manage_debt/data/data_sources/remote/manage_debt_service.dart';

class DebtRepositoryImpl extends DebtRepository {
  final ManageDebtService manageDebtService;

  DebtRepositoryImpl({required this.manageDebtService});

  @override
  Future<Either<Exception, void>> addDebt() {
    // TODO: implement addDebt
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, void>> deleteDebt() {
    // TODO: implement deleteDebt
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<Debt>>> getDebts() async {
    try {
      var getDebts = await manageDebtService.getActiveDebts();
      List<Debt> debts =
          getDebts.docs.map((e) => Debt.fromJson(e.data())).toList();

      return right(debts);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, void>> updateDebt() {
    // TODO: implement updateDebt
    throw UnimplementedError();
  }

  @override
  Stream watchDebts() {
    // TODO: implement watchDebts
    throw UnimplementedError();
  }
}
