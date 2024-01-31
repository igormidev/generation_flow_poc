// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_pattern.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionPattern {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InlineSpan> spans) richText,
    required TResult Function(String title, List<String> options) buttons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InlineSpan> spans)? richText,
    TResult? Function(String title, List<String> options)? buttons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InlineSpan> spans)? richText,
    TResult Function(String title, List<String> options)? buttons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionPatternRichText value) richText,
    required TResult Function(_QuestionPatternButtons value) buttons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionPatternRichText value)? richText,
    TResult? Function(_QuestionPatternButtons value)? buttons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionPatternRichText value)? richText,
    TResult Function(_QuestionPatternButtons value)? buttons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPatternCopyWith<$Res> {
  factory $QuestionPatternCopyWith(
          QuestionPattern value, $Res Function(QuestionPattern) then) =
      _$QuestionPatternCopyWithImpl<$Res, QuestionPattern>;
}

/// @nodoc
class _$QuestionPatternCopyWithImpl<$Res, $Val extends QuestionPattern>
    implements $QuestionPatternCopyWith<$Res> {
  _$QuestionPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$QuestionPatternRichTextImplCopyWith<$Res> {
  factory _$$QuestionPatternRichTextImplCopyWith(
          _$QuestionPatternRichTextImpl value,
          $Res Function(_$QuestionPatternRichTextImpl) then) =
      __$$QuestionPatternRichTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<InlineSpan> spans});
}

/// @nodoc
class __$$QuestionPatternRichTextImplCopyWithImpl<$Res>
    extends _$QuestionPatternCopyWithImpl<$Res, _$QuestionPatternRichTextImpl>
    implements _$$QuestionPatternRichTextImplCopyWith<$Res> {
  __$$QuestionPatternRichTextImplCopyWithImpl(
      _$QuestionPatternRichTextImpl _value,
      $Res Function(_$QuestionPatternRichTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spans = null,
  }) {
    return _then(_$QuestionPatternRichTextImpl(
      spans: null == spans
          ? _value._spans
          : spans // ignore: cast_nullable_to_non_nullable
              as List<InlineSpan>,
    ));
  }
}

/// @nodoc

class _$QuestionPatternRichTextImpl implements _QuestionPatternRichText {
  _$QuestionPatternRichTextImpl({required final List<InlineSpan> spans})
      : _spans = spans;

  final List<InlineSpan> _spans;
  @override
  List<InlineSpan> get spans {
    if (_spans is EqualUnmodifiableListView) return _spans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spans);
  }

  @override
  String toString() {
    return 'QuestionPattern.richText(spans: $spans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionPatternRichTextImpl &&
            const DeepCollectionEquality().equals(other._spans, _spans));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_spans));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionPatternRichTextImplCopyWith<_$QuestionPatternRichTextImpl>
      get copyWith => __$$QuestionPatternRichTextImplCopyWithImpl<
          _$QuestionPatternRichTextImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InlineSpan> spans) richText,
    required TResult Function(String title, List<String> options) buttons,
  }) {
    return richText(spans);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InlineSpan> spans)? richText,
    TResult? Function(String title, List<String> options)? buttons,
  }) {
    return richText?.call(spans);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InlineSpan> spans)? richText,
    TResult Function(String title, List<String> options)? buttons,
    required TResult orElse(),
  }) {
    if (richText != null) {
      return richText(spans);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionPatternRichText value) richText,
    required TResult Function(_QuestionPatternButtons value) buttons,
  }) {
    return richText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionPatternRichText value)? richText,
    TResult? Function(_QuestionPatternButtons value)? buttons,
  }) {
    return richText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionPatternRichText value)? richText,
    TResult Function(_QuestionPatternButtons value)? buttons,
    required TResult orElse(),
  }) {
    if (richText != null) {
      return richText(this);
    }
    return orElse();
  }
}

abstract class _QuestionPatternRichText implements QuestionPattern {
  factory _QuestionPatternRichText({required final List<InlineSpan> spans}) =
      _$QuestionPatternRichTextImpl;

  List<InlineSpan> get spans;
  @JsonKey(ignore: true)
  _$$QuestionPatternRichTextImplCopyWith<_$QuestionPatternRichTextImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionPatternButtonsImplCopyWith<$Res> {
  factory _$$QuestionPatternButtonsImplCopyWith(
          _$QuestionPatternButtonsImpl value,
          $Res Function(_$QuestionPatternButtonsImpl) then) =
      __$$QuestionPatternButtonsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, List<String> options});
}

/// @nodoc
class __$$QuestionPatternButtonsImplCopyWithImpl<$Res>
    extends _$QuestionPatternCopyWithImpl<$Res, _$QuestionPatternButtonsImpl>
    implements _$$QuestionPatternButtonsImplCopyWith<$Res> {
  __$$QuestionPatternButtonsImplCopyWithImpl(
      _$QuestionPatternButtonsImpl _value,
      $Res Function(_$QuestionPatternButtonsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? options = null,
  }) {
    return _then(_$QuestionPatternButtonsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$QuestionPatternButtonsImpl implements _QuestionPatternButtons {
  _$QuestionPatternButtonsImpl(
      {required this.title, required final List<String> options})
      : _options = options;

  @override
  final String title;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'QuestionPattern.buttons(title: $title, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionPatternButtonsImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionPatternButtonsImplCopyWith<_$QuestionPatternButtonsImpl>
      get copyWith => __$$QuestionPatternButtonsImplCopyWithImpl<
          _$QuestionPatternButtonsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InlineSpan> spans) richText,
    required TResult Function(String title, List<String> options) buttons,
  }) {
    return buttons(title, options);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InlineSpan> spans)? richText,
    TResult? Function(String title, List<String> options)? buttons,
  }) {
    return buttons?.call(title, options);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InlineSpan> spans)? richText,
    TResult Function(String title, List<String> options)? buttons,
    required TResult orElse(),
  }) {
    if (buttons != null) {
      return buttons(title, options);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionPatternRichText value) richText,
    required TResult Function(_QuestionPatternButtons value) buttons,
  }) {
    return buttons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionPatternRichText value)? richText,
    TResult? Function(_QuestionPatternButtons value)? buttons,
  }) {
    return buttons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionPatternRichText value)? richText,
    TResult Function(_QuestionPatternButtons value)? buttons,
    required TResult orElse(),
  }) {
    if (buttons != null) {
      return buttons(this);
    }
    return orElse();
  }
}

abstract class _QuestionPatternButtons implements QuestionPattern {
  factory _QuestionPatternButtons(
      {required final String title,
      required final List<String> options}) = _$QuestionPatternButtonsImpl;

  String get title;
  List<String> get options;
  @JsonKey(ignore: true)
  _$$QuestionPatternButtonsImplCopyWith<_$QuestionPatternButtonsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
