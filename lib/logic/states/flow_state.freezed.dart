// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlowState {
  Map<int, FlowStep> get history => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlowStateCopyWith<FlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlowStateCopyWith<$Res> {
  factory $FlowStateCopyWith(FlowState value, $Res Function(FlowState) then) =
      _$FlowStateCopyWithImpl<$Res, FlowState>;
  @useResult
  $Res call({Map<int, FlowStep> history});
}

/// @nodoc
class _$FlowStateCopyWithImpl<$Res, $Val extends FlowState>
    implements $FlowStateCopyWith<$Res> {
  _$FlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
  }) {
    return _then(_value.copyWith(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as Map<int, FlowStep>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlowStateLoadingImplCopyWith<$Res>
    implements $FlowStateCopyWith<$Res> {
  factory _$$FlowStateLoadingImplCopyWith(_$FlowStateLoadingImpl value,
          $Res Function(_$FlowStateLoadingImpl) then) =
      __$$FlowStateLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, FlowStep> history});
}

/// @nodoc
class __$$FlowStateLoadingImplCopyWithImpl<$Res>
    extends _$FlowStateCopyWithImpl<$Res, _$FlowStateLoadingImpl>
    implements _$$FlowStateLoadingImplCopyWith<$Res> {
  __$$FlowStateLoadingImplCopyWithImpl(_$FlowStateLoadingImpl _value,
      $Res Function(_$FlowStateLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
  }) {
    return _then(_$FlowStateLoadingImpl(
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Map<int, FlowStep>,
    ));
  }
}

/// @nodoc

class _$FlowStateLoadingImpl implements _FlowStateLoading {
  _$FlowStateLoadingImpl({required final Map<int, FlowStep> history})
      : _history = history;

  final Map<int, FlowStep> _history;
  @override
  Map<int, FlowStep> get history {
    if (_history is EqualUnmodifiableMapView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_history);
  }

  @override
  String toString() {
    return 'FlowState(history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlowStateLoadingImpl &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlowStateLoadingImplCopyWith<_$FlowStateLoadingImpl> get copyWith =>
      __$$FlowStateLoadingImplCopyWithImpl<_$FlowStateLoadingImpl>(
          this, _$identity);
}

abstract class _FlowStateLoading implements FlowState {
  factory _FlowStateLoading({required final Map<int, FlowStep> history}) =
      _$FlowStateLoadingImpl;

  @override
  Map<int, FlowStep> get history;
  @override
  @JsonKey(ignore: true)
  _$$FlowStateLoadingImplCopyWith<_$FlowStateLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
