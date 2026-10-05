// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compose_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComposeState {

 String get to; String get subject; String get body; String get cvFileName; String get tone; int get version; bool get regenerating;
/// Create a copy of ComposeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComposeStateCopyWith<ComposeState> get copyWith => _$ComposeStateCopyWithImpl<ComposeState>(this as ComposeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComposeState&&(identical(other.to, to) || other.to == to)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.body, body) || other.body == body)&&(identical(other.cvFileName, cvFileName) || other.cvFileName == cvFileName)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.version, version) || other.version == version)&&(identical(other.regenerating, regenerating) || other.regenerating == regenerating));
}


@override
int get hashCode => Object.hash(runtimeType,to,subject,body,cvFileName,tone,version,regenerating);

@override
String toString() {
  return 'ComposeState(to: $to, subject: $subject, body: $body, cvFileName: $cvFileName, tone: $tone, version: $version, regenerating: $regenerating)';
}


}

/// @nodoc
abstract mixin class $ComposeStateCopyWith<$Res>  {
  factory $ComposeStateCopyWith(ComposeState value, $Res Function(ComposeState) _then) = _$ComposeStateCopyWithImpl;
@useResult
$Res call({
 String to, String subject, String body, String cvFileName, String tone, int version, bool regenerating
});




}
/// @nodoc
class _$ComposeStateCopyWithImpl<$Res>
    implements $ComposeStateCopyWith<$Res> {
  _$ComposeStateCopyWithImpl(this._self, this._then);

  final ComposeState _self;
  final $Res Function(ComposeState) _then;

/// Create a copy of ComposeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? to = null,Object? subject = null,Object? body = null,Object? cvFileName = null,Object? tone = null,Object? version = null,Object? regenerating = null,}) {
  return _then(_self.copyWith(
to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,cvFileName: null == cvFileName ? _self.cvFileName : cvFileName // ignore: cast_nullable_to_non_nullable
as String,tone: null == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,regenerating: null == regenerating ? _self.regenerating : regenerating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ComposeState].
extension ComposeStatePatterns on ComposeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComposeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComposeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComposeState value)  $default,){
final _that = this;
switch (_that) {
case _ComposeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComposeState value)?  $default,){
final _that = this;
switch (_that) {
case _ComposeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String to,  String subject,  String body,  String cvFileName,  String tone,  int version,  bool regenerating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComposeState() when $default != null:
return $default(_that.to,_that.subject,_that.body,_that.cvFileName,_that.tone,_that.version,_that.regenerating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String to,  String subject,  String body,  String cvFileName,  String tone,  int version,  bool regenerating)  $default,) {final _that = this;
switch (_that) {
case _ComposeState():
return $default(_that.to,_that.subject,_that.body,_that.cvFileName,_that.tone,_that.version,_that.regenerating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String to,  String subject,  String body,  String cvFileName,  String tone,  int version,  bool regenerating)?  $default,) {final _that = this;
switch (_that) {
case _ComposeState() when $default != null:
return $default(_that.to,_that.subject,_that.body,_that.cvFileName,_that.tone,_that.version,_that.regenerating);case _:
  return null;

}
}

}

/// @nodoc


class _ComposeState implements ComposeState {
  const _ComposeState({required this.to, required this.subject, required this.body, required this.cvFileName, required this.tone, this.version = 2, this.regenerating = false});
  

@override final  String to;
@override final  String subject;
@override final  String body;
@override final  String cvFileName;
@override final  String tone;
@override@JsonKey() final  int version;
@override@JsonKey() final  bool regenerating;

/// Create a copy of ComposeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComposeStateCopyWith<_ComposeState> get copyWith => __$ComposeStateCopyWithImpl<_ComposeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComposeState&&(identical(other.to, to) || other.to == to)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.body, body) || other.body == body)&&(identical(other.cvFileName, cvFileName) || other.cvFileName == cvFileName)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.version, version) || other.version == version)&&(identical(other.regenerating, regenerating) || other.regenerating == regenerating));
}


@override
int get hashCode => Object.hash(runtimeType,to,subject,body,cvFileName,tone,version,regenerating);

@override
String toString() {
  return 'ComposeState(to: $to, subject: $subject, body: $body, cvFileName: $cvFileName, tone: $tone, version: $version, regenerating: $regenerating)';
}


}

/// @nodoc
abstract mixin class _$ComposeStateCopyWith<$Res> implements $ComposeStateCopyWith<$Res> {
  factory _$ComposeStateCopyWith(_ComposeState value, $Res Function(_ComposeState) _then) = __$ComposeStateCopyWithImpl;
@override @useResult
$Res call({
 String to, String subject, String body, String cvFileName, String tone, int version, bool regenerating
});




}
/// @nodoc
class __$ComposeStateCopyWithImpl<$Res>
    implements _$ComposeStateCopyWith<$Res> {
  __$ComposeStateCopyWithImpl(this._self, this._then);

  final _ComposeState _self;
  final $Res Function(_ComposeState) _then;

/// Create a copy of ComposeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? to = null,Object? subject = null,Object? body = null,Object? cvFileName = null,Object? tone = null,Object? version = null,Object? regenerating = null,}) {
  return _then(_ComposeState(
to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,cvFileName: null == cvFileName ? _self.cvFileName : cvFileName // ignore: cast_nullable_to_non_nullable
as String,tone: null == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,regenerating: null == regenerating ? _self.regenerating : regenerating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
