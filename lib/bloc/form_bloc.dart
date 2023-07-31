import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState()) {
    on<FormValuesChanged>((event, emit) {
      print('Se ejecuta el event handler');
      if (checkIfInputsAreValid(event.textValue1, event.textValue2)) {
        print('Se emite allow submit true');
        emit(const FormState(allowSubmit: true));
      } else {
        emit(const FormState(allowSubmit: false));
      }
    });
  }
}

bool checkIfInputsAreValid(String? input1, String? input2) {
  if (input1 == null || input1.isEmpty) {
    return false;
  }
  if (input2 == null || input2.isEmpty) {
    return false;
  }
  return true;
}
