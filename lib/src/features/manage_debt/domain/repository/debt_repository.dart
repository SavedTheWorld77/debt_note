import 'package:dartz/dartz.dart';
import 'package:debt_note/src/features/manage_debt/domain/entities/debt.dart';

abstract class DebtRepository {
  Future<Either<Exception, List<Debt>>> getDebts();
  Future<Either<Exception, void>> addDebt();
  Future<Either<Exception, void>> deleteDebt();
  Future<Either<Exception, void>> updateDebt();
  Stream watchDebts();
}
