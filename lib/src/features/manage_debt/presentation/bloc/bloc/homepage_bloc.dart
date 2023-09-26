import 'package:bloc/bloc.dart';
import 'package:debt_note/src/features/manage_debt/domain/usecases/get_debts.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final GetDebtsUseCase _getDebtsUseCase;

  HomepageBloc(this._getDebtsUseCase) : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
