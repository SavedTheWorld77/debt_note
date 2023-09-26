import 'package:dartz/dartz.dart';
import 'package:debt_note/src/core/usecase/usecase.dart';
import 'package:debt_note/src/features/manage_debt/domain/entities/debt.dart';
import 'package:debt_note/src/features/manage_debt/domain/repository/debt_repository.dart';

class GetDebtsUseCase implements UseCase<List<Debt>, void> {
  final DebtRepository _debtRepository;

  GetDebtsUseCase(this._debtRepository);

  @override
  Future<Either<Exception, List<Debt>>> call({required void params}) async {
    return await _debtRepository.getDebts();
  }
}
