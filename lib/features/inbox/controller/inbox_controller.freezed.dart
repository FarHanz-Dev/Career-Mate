// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxState {

 InboxLabel get label; String get query; bool get recentOnly; Set<String> get selectedIds;
/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxStateCopyWith<InboxState> get copyWith => _$InboxStateCopyWithImpl<InboxState>(this as InboxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxState&&(identical(other.label, label) || other.label == label)&&(identical(other.query, query) || other.query == query)&&(identical(other.recentOnly, recentOnly) || other.recentOnly == recentOnly)&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds));
}


@override
int get hashCode => Object.hash(runtimeType,label,query,recentOnly,const DeepCollectionEquality().hash(selectedIds));

@override
String toString() {
  return 'InboxState(label: $label, query: $query, recentOnly: $recentOnly, selectedIds: $selectedIds)';
}


}

/// @nodoc
abstract mixin class $InboxStateCopyWith<$Res>  {
  factory $InboxStateCopyWith(InboxState value, $Res Function(InboxState) _then) = _$InboxStateCopyWithImpl;
@useResult
$Res call({
 InboxLabel label, String query, bool recentOnly, Set<String> selectedIds
});




}
/// @nodoc
class _$InboxStateCopyWithImpl<$Res>
    implements $InboxStateCopyWith<$Res> {
  _$InboxStateCopyWithImpl(this._self, this._then);

  final InboxState _self;
  final $Res Function(InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? query = null,Object? recentOnly = null,Object? selectedIds = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as InboxLabel,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,recentOnly: null == recentOnly ? _self.recentOnly : recentOnly // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxState].
extension InboxStatePatterns on InboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxState value)  $default,){
final _that = this;
switch (_that) {
case _InboxState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxState value)?  $default,){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InboxLabel label,  String query,  bool recentOnly,  Set<String> selectedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.label,_that.query,_that.recentOnly,_that.selectedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InboxLabel label,  String query,  bool recentOnly,  Set<String> selectedIds)  $default,) {final _that = this;
switch (_that) {
case _InboxState():
return $default(_that.label,_that.query,_that.recentOnly,_that.selectedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InboxLabel label,  String query,  bool recentOnly,  Set<String> selectedIds)?  $default,) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.label,_that.query,_that.recentOnly,_that.selectedIds);case _:
  return null;

}
}

}

/// @nodoc


class _InboxState extends InboxState {
  const _InboxState({this.label = InboxLabel.all, this.query = '', this.recentOnly = false, final  Set<String> selectedIds = const <String>{}}): _selectedIds = selectedIds,super._();
  

@override@JsonKey() final  InboxLabel label;
@override@JsonKey() final  String query;
@override@JsonKey() final  bool recentOnly;
 final  Set<String> _selectedIds;
@override@JsonKey() Set<String> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}


/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxStateCopyWith<_InboxState> get copyWith => __$InboxStateCopyWithImpl<_InboxState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxState&&(identical(other.label, label) || other.label == label)&&(identical(other.query, query) || other.query == query)&&(identical(other.recentOnly, recentOnly) || other.recentOnly == recentOnly)&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds));
}


@override
int get hashCode => Object.hash(runtimeType,label,query,recentOnly,const DeepCollectionEquality().hash(_selectedIds));

@override
String toString() {
  return 'InboxState(label: $label, query: $query, recentOnly: $recentOnly, selectedIds: $selectedIds)';
}


}

/// @nodoc
abstract mixin class _$InboxStateCopyWith<$Res> implements $InboxStateCopyWith<$Res> {
  factory _$InboxStateCopyWith(_InboxState value, $Res Function(_InboxState) _then) = __$InboxStateCopyWithImpl;
@override @useResult
$Res call({
 InboxLabel label, String query, bool recentOnly, Set<String> selectedIds
});




}
/// @nodoc
class __$InboxStateCopyWithImpl<$Res>
    implements _$InboxStateCopyWith<$Res> {
  __$InboxStateCopyWithImpl(this._self, this._then);

  final _InboxState _self;
  final $Res Function(_InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? query = null,Object? recentOnly = null,Object? selectedIds = null,}) {
  return _then(_InboxState(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as InboxLabel,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,recentOnly: null == recentOnly ? _self.recentOnly : recentOnly // ignore: cast_nullable_to_non_nullable
as bool,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
