// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Dimension {

 String get name; int get pct; String get note;
/// Create a copy of Dimension
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DimensionCopyWith<Dimension> get copyWith => _$DimensionCopyWithImpl<Dimension>(this as Dimension, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dimension&&(identical(other.name, name) || other.name == name)&&(identical(other.pct, pct) || other.pct == pct)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,name,pct,note);

@override
String toString() {
  return 'Dimension(name: $name, pct: $pct, note: $note)';
}


}

/// @nodoc
abstract mixin class $DimensionCopyWith<$Res>  {
  factory $DimensionCopyWith(Dimension value, $Res Function(Dimension) _then) = _$DimensionCopyWithImpl;
@useResult
$Res call({
 String name, int pct, String note
});




}
/// @nodoc
class _$DimensionCopyWithImpl<$Res>
    implements $DimensionCopyWith<$Res> {
  _$DimensionCopyWithImpl(this._self, this._then);

  final Dimension _self;
  final $Res Function(Dimension) _then;

/// Create a copy of Dimension
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pct = null,Object? note = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pct: null == pct ? _self.pct : pct // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Dimension].
extension DimensionPatterns on Dimension {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dimension value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dimension() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dimension value)  $default,){
final _that = this;
switch (_that) {
case _Dimension():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dimension value)?  $default,){
final _that = this;
switch (_that) {
case _Dimension() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int pct,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dimension() when $default != null:
return $default(_that.name,_that.pct,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int pct,  String note)  $default,) {final _that = this;
switch (_that) {
case _Dimension():
return $default(_that.name,_that.pct,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int pct,  String note)?  $default,) {final _that = this;
switch (_that) {
case _Dimension() when $default != null:
return $default(_that.name,_that.pct,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _Dimension implements Dimension {
  const _Dimension({required this.name, required this.pct, required this.note});
  

@override final  String name;
@override final  int pct;
@override final  String note;

/// Create a copy of Dimension
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DimensionCopyWith<_Dimension> get copyWith => __$DimensionCopyWithImpl<_Dimension>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dimension&&(identical(other.name, name) || other.name == name)&&(identical(other.pct, pct) || other.pct == pct)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,name,pct,note);

@override
String toString() {
  return 'Dimension(name: $name, pct: $pct, note: $note)';
}


}

/// @nodoc
abstract mixin class _$DimensionCopyWith<$Res> implements $DimensionCopyWith<$Res> {
  factory _$DimensionCopyWith(_Dimension value, $Res Function(_Dimension) _then) = __$DimensionCopyWithImpl;
@override @useResult
$Res call({
 String name, int pct, String note
});




}
/// @nodoc
class __$DimensionCopyWithImpl<$Res>
    implements _$DimensionCopyWith<$Res> {
  __$DimensionCopyWithImpl(this._self, this._then);

  final _Dimension _self;
  final $Res Function(_Dimension) _then;

/// Create a copy of Dimension
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pct = null,Object? note = null,}) {
  return _then(_Dimension(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pct: null == pct ? _self.pct : pct // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Evidence {

 String get need; String get proof; bool get met;
/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvidenceCopyWith<Evidence> get copyWith => _$EvidenceCopyWithImpl<Evidence>(this as Evidence, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Evidence&&(identical(other.need, need) || other.need == need)&&(identical(other.proof, proof) || other.proof == proof)&&(identical(other.met, met) || other.met == met));
}


@override
int get hashCode => Object.hash(runtimeType,need,proof,met);

@override
String toString() {
  return 'Evidence(need: $need, proof: $proof, met: $met)';
}


}

/// @nodoc
abstract mixin class $EvidenceCopyWith<$Res>  {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) _then) = _$EvidenceCopyWithImpl;
@useResult
$Res call({
 String need, String proof, bool met
});




}
/// @nodoc
class _$EvidenceCopyWithImpl<$Res>
    implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._self, this._then);

  final Evidence _self;
  final $Res Function(Evidence) _then;

/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? need = null,Object? proof = null,Object? met = null,}) {
  return _then(_self.copyWith(
need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as String,proof: null == proof ? _self.proof : proof // ignore: cast_nullable_to_non_nullable
as String,met: null == met ? _self.met : met // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Evidence].
extension EvidencePatterns on Evidence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Evidence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Evidence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Evidence value)  $default,){
final _that = this;
switch (_that) {
case _Evidence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Evidence value)?  $default,){
final _that = this;
switch (_that) {
case _Evidence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String need,  String proof,  bool met)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Evidence() when $default != null:
return $default(_that.need,_that.proof,_that.met);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String need,  String proof,  bool met)  $default,) {final _that = this;
switch (_that) {
case _Evidence():
return $default(_that.need,_that.proof,_that.met);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String need,  String proof,  bool met)?  $default,) {final _that = this;
switch (_that) {
case _Evidence() when $default != null:
return $default(_that.need,_that.proof,_that.met);case _:
  return null;

}
}

}

/// @nodoc


class _Evidence implements Evidence {
  const _Evidence({required this.need, required this.proof, required this.met});
  

@override final  String need;
@override final  String proof;
@override final  bool met;

/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvidenceCopyWith<_Evidence> get copyWith => __$EvidenceCopyWithImpl<_Evidence>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Evidence&&(identical(other.need, need) || other.need == need)&&(identical(other.proof, proof) || other.proof == proof)&&(identical(other.met, met) || other.met == met));
}


@override
int get hashCode => Object.hash(runtimeType,need,proof,met);

@override
String toString() {
  return 'Evidence(need: $need, proof: $proof, met: $met)';
}


}

/// @nodoc
abstract mixin class _$EvidenceCopyWith<$Res> implements $EvidenceCopyWith<$Res> {
  factory _$EvidenceCopyWith(_Evidence value, $Res Function(_Evidence) _then) = __$EvidenceCopyWithImpl;
@override @useResult
$Res call({
 String need, String proof, bool met
});




}
/// @nodoc
class __$EvidenceCopyWithImpl<$Res>
    implements _$EvidenceCopyWith<$Res> {
  __$EvidenceCopyWithImpl(this._self, this._then);

  final _Evidence _self;
  final $Res Function(_Evidence) _then;

/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? need = null,Object? proof = null,Object? met = null,}) {
  return _then(_Evidence(
need: null == need ? _self.need : need // ignore: cast_nullable_to_non_nullable
as String,proof: null == proof ? _self.proof : proof // ignore: cast_nullable_to_non_nullable
as String,met: null == met ? _self.met : met // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$MatchResult {

 String get applicationId; String get company; String get role; int get score; String get summary; List<Dimension> get dimensions; List<Evidence> get evidence;
/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchResultCopyWith<MatchResult> get copyWith => _$MatchResultCopyWithImpl<MatchResult>(this as MatchResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchResult&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.score, score) || other.score == score)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.dimensions, dimensions)&&const DeepCollectionEquality().equals(other.evidence, evidence));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,company,role,score,summary,const DeepCollectionEquality().hash(dimensions),const DeepCollectionEquality().hash(evidence));

@override
String toString() {
  return 'MatchResult(applicationId: $applicationId, company: $company, role: $role, score: $score, summary: $summary, dimensions: $dimensions, evidence: $evidence)';
}


}

/// @nodoc
abstract mixin class $MatchResultCopyWith<$Res>  {
  factory $MatchResultCopyWith(MatchResult value, $Res Function(MatchResult) _then) = _$MatchResultCopyWithImpl;
@useResult
$Res call({
 String applicationId, String company, String role, int score, String summary, List<Dimension> dimensions, List<Evidence> evidence
});




}
/// @nodoc
class _$MatchResultCopyWithImpl<$Res>
    implements $MatchResultCopyWith<$Res> {
  _$MatchResultCopyWithImpl(this._self, this._then);

  final MatchResult _self;
  final $Res Function(MatchResult) _then;

/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? company = null,Object? role = null,Object? score = null,Object? summary = null,Object? dimensions = null,Object? evidence = null,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,dimensions: null == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as List<Dimension>,evidence: null == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as List<Evidence>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchResult].
extension MatchResultPatterns on MatchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchResult value)  $default,){
final _that = this;
switch (_that) {
case _MatchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchResult value)?  $default,){
final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String company,  String role,  int score,  String summary,  List<Dimension> dimensions,  List<Evidence> evidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
return $default(_that.applicationId,_that.company,_that.role,_that.score,_that.summary,_that.dimensions,_that.evidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String company,  String role,  int score,  String summary,  List<Dimension> dimensions,  List<Evidence> evidence)  $default,) {final _that = this;
switch (_that) {
case _MatchResult():
return $default(_that.applicationId,_that.company,_that.role,_that.score,_that.summary,_that.dimensions,_that.evidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String company,  String role,  int score,  String summary,  List<Dimension> dimensions,  List<Evidence> evidence)?  $default,) {final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
return $default(_that.applicationId,_that.company,_that.role,_that.score,_that.summary,_that.dimensions,_that.evidence);case _:
  return null;

}
}

}

/// @nodoc


class _MatchResult extends MatchResult {
  const _MatchResult({required this.applicationId, required this.company, required this.role, required this.score, required this.summary, required final  List<Dimension> dimensions, required final  List<Evidence> evidence}): _dimensions = dimensions,_evidence = evidence,super._();
  

@override final  String applicationId;
@override final  String company;
@override final  String role;
@override final  int score;
@override final  String summary;
 final  List<Dimension> _dimensions;
@override List<Dimension> get dimensions {
  if (_dimensions is EqualUnmodifiableListView) return _dimensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dimensions);
}

 final  List<Evidence> _evidence;
@override List<Evidence> get evidence {
  if (_evidence is EqualUnmodifiableListView) return _evidence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_evidence);
}


/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchResultCopyWith<_MatchResult> get copyWith => __$MatchResultCopyWithImpl<_MatchResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchResult&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.score, score) || other.score == score)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._dimensions, _dimensions)&&const DeepCollectionEquality().equals(other._evidence, _evidence));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,company,role,score,summary,const DeepCollectionEquality().hash(_dimensions),const DeepCollectionEquality().hash(_evidence));

@override
String toString() {
  return 'MatchResult(applicationId: $applicationId, company: $company, role: $role, score: $score, summary: $summary, dimensions: $dimensions, evidence: $evidence)';
}


}

/// @nodoc
abstract mixin class _$MatchResultCopyWith<$Res> implements $MatchResultCopyWith<$Res> {
  factory _$MatchResultCopyWith(_MatchResult value, $Res Function(_MatchResult) _then) = __$MatchResultCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String company, String role, int score, String summary, List<Dimension> dimensions, List<Evidence> evidence
});




}
/// @nodoc
class __$MatchResultCopyWithImpl<$Res>
    implements _$MatchResultCopyWith<$Res> {
  __$MatchResultCopyWithImpl(this._self, this._then);

  final _MatchResult _self;
  final $Res Function(_MatchResult) _then;

/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? company = null,Object? role = null,Object? score = null,Object? summary = null,Object? dimensions = null,Object? evidence = null,}) {
  return _then(_MatchResult(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,dimensions: null == dimensions ? _self._dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as List<Dimension>,evidence: null == evidence ? _self._evidence : evidence // ignore: cast_nullable_to_non_nullable
as List<Evidence>,
  ));
}


}

// dart format on
