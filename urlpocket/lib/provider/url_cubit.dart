import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:urlpocket/interactor/url_use_case.dart';
import 'package:urlpocket/states/url_list_state.dart';

class UrlCubit extends Cubit<UrlShrinkState> {
  UrlCubit() : super(UrlShrinkInitialState());

  void shrinkUrl(String urlToshrink) async {
    try {
      emit(UrlShrinkLoadingState());
      final resultShrink = await GetIt.I.get<UrlUseCase>().shrinkUrl();
      _validateResult(resultShrink);
    } catch (e) {
      emit(UrlShrinkUnavailableState());
    }
  }

  void _validateResult(String resultShrink) {}
}
