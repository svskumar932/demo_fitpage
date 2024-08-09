// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_signal_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TradingSignalState extends TradingSignalState {
  @override
  final List<TradingSignal> signals;
  @override
  final bool isLoading;
  @override
  final String? error;

  factory _$TradingSignalState(
          [void Function(TradingSignalStateBuilder)? updates]) =>
      (new TradingSignalStateBuilder()..update(updates))._build();

  _$TradingSignalState._(
      {required this.signals, required this.isLoading, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        signals, r'TradingSignalState', 'signals');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'TradingSignalState', 'isLoading');
  }

  @override
  TradingSignalState rebuild(
          void Function(TradingSignalStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TradingSignalStateBuilder toBuilder() =>
      new TradingSignalStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TradingSignalState &&
        signals == other.signals &&
        isLoading == other.isLoading &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signals.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TradingSignalState')
          ..add('signals', signals)
          ..add('isLoading', isLoading)
          ..add('error', error))
        .toString();
  }
}

class TradingSignalStateBuilder
    implements Builder<TradingSignalState, TradingSignalStateBuilder> {
  _$TradingSignalState? _$v;

  List<TradingSignal>? _signals;
  List<TradingSignal>? get signals => _$this._signals;
  set signals(List<TradingSignal>? signals) => _$this._signals = signals;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  TradingSignalStateBuilder();

  TradingSignalStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signals = $v.signals;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TradingSignalState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TradingSignalState;
  }

  @override
  void update(void Function(TradingSignalStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TradingSignalState build() => _build();

  _$TradingSignalState _build() {
    final _$result = _$v ??
        new _$TradingSignalState._(
            signals: BuiltValueNullFieldError.checkNotNull(
                signals, r'TradingSignalState', 'signals'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'TradingSignalState', 'isLoading'),
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
