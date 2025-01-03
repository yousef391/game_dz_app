import 'package:flutter_bloc/flutter_bloc.dart';
import 'phone_input_state.dart';

class PhoneInputCubit extends Cubit<PhoneInputState> {
  PhoneInputCubit() : super(const PhoneInputState());

  void updatePhoneNumber(String number) {
    emit(state.copyWith(
      phoneNumber: number,
      error: number.isEmpty ? 'Phone number is required' : null,
    ));
  }

  Future<void> getCode() async {
    if (!state.isValid) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Failed to send code. Please try again.',
      ));
    }
  }
}
