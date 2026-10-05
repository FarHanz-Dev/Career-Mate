// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_flow_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileFlowState {

 int get step; CareerProfile get profile;
/// Create a copy of ProfileFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFlowStateCopyWith<ProfileFlowState> get copyWith => _$ProfileFlowStateCopyWithImpl<ProfileFlowState>(this as ProfileFlowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFlowState&&(identical(other.step, step) || other.step == step)&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,step,profile);

@override
String toString() {
  return 'ProfileFlowState(step: $step, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileFlowStateCopyWith<$Res>  {
  factory $ProfileFlowStateCopyWith(ProfileFlowState value, $Res Function(ProfileFlowState) _then) = _$ProfileFlowStateCopyWithImpl;
@useResult
$Res call({
 int step, CareerProfile profile
});


$CareerProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileFlowStateCopyWithImpl<$Res>
    implements $ProfileFlowStateCopyWith<$Res> {
  _$ProfileFlowStateCopyWithImpl(this._self, this._then);

  final ProfileFlowState _self;
  final $Res Function(ProfileFlowState) _then;

/// Create a copy of ProfileFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? profile = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CareerProfile,
  ));
}
/// Create a copy of ProfileFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerProfileCopyWith<$Res> get profile {
  
  return $CareerProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileFlowState].
extension ProfileFlowStatePatterns on ProfileFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileFlowState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step,  CareerProfile profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileFlowState() when $default != null:
return $default(_that.step,_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step,  CareerProfile profile)  $default,) {final _that = this;
switch (_that) {
case _ProfileFlowState():
return $default(_that.step,_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step,  CareerProfile profile)?  $default,) {final _that = this;
switch (_that) {
case _ProfileFlowState() when $default != null:
return $default(_that.step,_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileFlowState implements ProfileFlowState {
  const _ProfileFlowState({required this.step, required this.profile});
  

@override final  int step;
@override final  CareerProfile profile;

/// Create a copy of ProfileFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileFlowStateCopyWith<_ProfileFlowState> get copyWith => __$ProfileFlowStateCopyWithImpl<_ProfileFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileFlowState&&(identical(other.step, step) || other.step == step)&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,step,profile);

@override
String toString() {
  return 'ProfileFlowState(step: $step, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$ProfileFlowStateCopyWith<$Res> implements $ProfileFlowStateCopyWith<$Res> {
  factory _$ProfileFlowStateCopyWith(_ProfileFlowState value, $Res Function(_ProfileFlowState) _then) = __$ProfileFlowStateCopyWithImpl;
@override @useResult
$Res call({
 int step, CareerProfile profile
});


@override $CareerProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$ProfileFlowStateCopyWithImpl<$Res>
    implements _$ProfileFlowStateCopyWith<$Res> {
  __$ProfileFlowStateCopyWithImpl(this._self, this._then);

  final _ProfileFlowState _self;
  final $Res Function(_ProfileFlowState) _then;

/// Create a copy of ProfileFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? profile = null,}) {
  return _then(_ProfileFlowState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CareerProfile,
  ));
}

/// Create a copy of ProfileFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerProfileCopyWith<$Res> get profile {
  
  return $CareerProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
