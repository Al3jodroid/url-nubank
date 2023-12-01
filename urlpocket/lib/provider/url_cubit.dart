import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:urlpocket/interactor/url_shrink_result.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/states/url_shrink_ui_state.dart';

class UrlCubit extends Cubit<ShrinkUiState> {
  UrlCubit() : super(ShrinkInitialUiState());

  void shrinkUrl(String urlToshrink) async {
    try {
      emit(ShrinkLoadingUiState());
      final resultShrink =
          await GetIt.I.get<UrlUseCase>().shrinkUrl(urlToshrink);

      print(resultShrink);
      _validateResult(resultShrink);
    } catch (e) {
      emit(ShrinkUnavailableUiState());
    }
  }

  void _validateResult(UrlShrinkResult resultShrink) {
    switch (resultShrink.status) {
      case ResultStatus.success:
        emit(ShrinkResultUiState(resultShrink.url));
        break;
      case ResultStatus.failure:
        emit(ShrinkUnavailableUiState());
        break;
      case ResultStatus.empty:
        emit(ShrinkEmptyUiState());
        break;
    }
  }
}
