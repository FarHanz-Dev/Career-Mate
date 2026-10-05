// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_job_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddJobState {

 AddJobStep get step; String get text; ParsedPosting? get posting;/// Index into [ParsedPosting.cvMatches].
 int get cvChoice;
/// Create a copy of AddJobState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddJobStateCopyWith<AddJobState> get copyWith => _$AddJobStateCopyWithImpl<AddJobState>(this as AddJobState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddJobState&&(identical(other.step, step) || other.step == step)&&(identical(other.text, text) || other.text == text)&&(identical(other.posting, posting) || other.posting == posting)&&(identical(other.cvChoice, cvChoice) || other.cvChoice == cvChoice));
}


@override
int get hashCode => Object.hash(runtimeType,step,text,posting,cvChoice);

@override
String toString() {
  return 'AddJobState(step: $step, text: $text, posting: $posting, cvChoice: $cvChoice)';
}


}

/// @nodoc
abstract mixin class $AddJobStateCopyWith<$Res>  {
  factory $AddJobStateCopyWith(AddJobState value, $Res Function(AddJobState) _then) = _$AddJobStateCopyWithImpl;
@useResult
$Res call({
 AddJobStep step, String text, ParsedPosting? posting, int cvChoice
});


$ParsedPostingCopyWith<$Res>? get posting;

}
/// @nodoc
class _$AddJobStateCopyWithImpl<$Res>
    implements $AddJobStateCopyWith<$Res> {
  _$AddJobStateCopyWithImpl(this._self, this._then);

  final AddJobState _self;
  final $Res Function(AddJobState) _then;

/// Create a copy of AddJobState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? text = null,Object? posting = freezed,Object? cvChoice = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as AddJobStep,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,posting: freezed == posting ? _self.posting : posting // ignore: cast_nullable_to_non_nullable
as ParsedPosting?,cvChoice: null == cvChoice ? _self.cvChoice : cvChoice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of AddJobState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedPostingCopyWith<$Res>? get posting {
    if (_self.posting == null) {
    return null;
  }

  return $ParsedPostingCopyWith<$Res>(_self.posting!, (value) {
    return _then(_self.copyWith(posting: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddJobState].
extension AddJobStatePatterns on AddJobState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddJobState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddJobState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddJobState value)  $default,){
final _that = this;
switch (_that) {
case _AddJobState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddJobState value)?  $default,){
final _that = this;
switch (_that) {
case _AddJobState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AddJobStep step,  String text,  ParsedPosting? posting,  int cvChoice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddJobState() when $default != null:
return $default(_that.step,_that.text,_that.posting,_that.cvChoice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AddJobStep step,  String text,  ParsedPosting? posting,  int cvChoice)  $default,) {final _that = this;
switch (_that) {
case _AddJobState():
return $default(_that.step,_that.text,_that.posting,_that.cvChoice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AddJobStep step,  String text,  ParsedPosting? posting,  int cvChoice)?  $default,) {final _that = this;
switch (_that) {
case _AddJobState() when $default != null:
return $default(_that.step,_that.text,_that.posting,_that.cvChoice);case _:
  return null;

}
}

}

/// @nodoc


class _AddJobState implements AddJobState {
  const _AddJobState({this.step = AddJobStep.capture, this.text = '', this.posting, this.cvChoice = 0});
  

@override@JsonKey() final  AddJobStep step;
@override@JsonKey() final  String text;
@override final  ParsedPosting? posting;
/// Index into [ParsedPosting.cvMatches].
@override@JsonKey() final  int cvChoice;

/// Create a copy of AddJobState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddJobStateCopyWith<_AddJobState> get copyWith => __$AddJobStateCopyWithImpl<_AddJobState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddJobState&&(identical(other.step, step) || other.step == step)&&(identical(other.text, text) || other.text == text)&&(identical(other.posting, posting) || other.posting == posting)&&(identical(other.cvChoice, cvChoice) || other.cvChoice == cvChoice));
}


@override
int get hashCode => Object.hash(runtimeType,step,text,posting,cvChoice);

@override
String toString() {
  return 'AddJobState(step: $step, text: $text, posting: $posting, cvChoice: $cvChoice)';
}


}

/// @nodoc
abstract mixin class _$AddJobStateCopyWith<$Res> implements $AddJobStateCopyWith<$Res> {
  factory _$AddJobStateCopyWith(_AddJobState value, $Res Function(_AddJobState) _then) = __$AddJobStateCopyWithImpl;
@override @useResult
$Res call({
 AddJobStep step, String text, ParsedPosting? posting, int cvChoice
});


@override $ParsedPostingCopyWith<$Res>? get posting;

}
/// @nodoc
class __$AddJobStateCopyWithImpl<$Res>
    implements _$AddJobStateCopyWith<$Res> {
  __$AddJobStateCopyWithImpl(this._self, this._then);

  final _AddJobState _self;
  final $Res Function(_AddJobState) _then;

/// Create a copy of AddJobState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? text = null,Object? posting = freezed,Object? cvChoice = null,}) {
  return _then(_AddJobState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as AddJobStep,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,posting: freezed == posting ? _self.posting : posting // ignore: cast_nullable_to_non_nullable
as ParsedPosting?,cvChoice: null == cvChoice ? _self.cvChoice : cvChoice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of AddJobState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedPostingCopyWith<$Res>? get posting {
    if (_self.posting == null) {
    return null;
  }

  return $ParsedPostingCopyWith<$Res>(_self.posting!, (value) {
    return _then(_self.copyWith(posting: value));
  });
}
}

// dart format on
