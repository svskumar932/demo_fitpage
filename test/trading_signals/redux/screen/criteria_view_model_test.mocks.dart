// Mocks generated by Mockito 5.4.4 from annotations
// in demo_fitpage/test/trading_signals/redux/screen/criteria_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:demo_fitpage/application/redux/app_state.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:redux/src/store.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAppState_0 extends _i1.SmartFake implements _i2.AppState {
  _FakeAppState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Store].
///
/// See the documentation for Mockito's code generation for more information.
class MockStore extends _i1.Mock implements _i3.Store<_i2.AppState> {
  MockStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Reducer<_i2.AppState> get reducer => (super.noSuchMethod(
        Invocation.getter(#reducer),
        returnValue: (
          _i2.AppState state,
          dynamic action,
        ) =>
            _FakeAppState_0(
          this,
          Invocation.getter(#reducer),
        ),
      ) as _i3.Reducer<_i2.AppState>);

  @override
  set reducer(_i3.Reducer<_i2.AppState>? _reducer) => super.noSuchMethod(
        Invocation.setter(
          #reducer,
          _reducer,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.AppState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAppState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.AppState);

  @override
  _i4.Stream<_i2.AppState> get onChange => (super.noSuchMethod(
        Invocation.getter(#onChange),
        returnValue: _i4.Stream<_i2.AppState>.empty(),
      ) as _i4.Stream<_i2.AppState>);

  @override
  _i4.Future<dynamic> teardown() => (super.noSuchMethod(
        Invocation.method(
          #teardown,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}
