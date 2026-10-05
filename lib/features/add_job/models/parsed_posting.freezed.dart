// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_posting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostingRequirement {

 String get label; bool get core;
/// Create a copy of PostingRequirement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostingRequirementCopyWith<PostingRequirement> get copyWith => _$PostingRequirementCopyWithImpl<PostingRequirement>(this as PostingRequirement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostingRequirement&&(identical(other.label, label) || other.label == label)&&(identical(other.core, core) || other.core == core));
}


@override
int get hashCode => Object.hash(runtimeType,label,core);

@override
String toString() {
  return 'PostingRequirement(label: $label, core: $core)';
}


}

/// @nodoc
abstract mixin class $PostingRequirementCopyWith<$Res>  {
  factory $PostingRequirementCopyWith(PostingRequirement value, $Res Function(PostingRequirement) _then) = _$PostingRequirementCopyWithImpl;
@useResult
$Res call({
 String label, bool core
});




}
/// @nodoc
class _$PostingRequirementCopyWithImpl<$Res>
    implements $PostingRequirementCopyWith<$Res> {
  _$PostingRequirementCopyWithImpl(this._self, this._then);

  final PostingRequirement _self;
  final $Res Function(PostingRequirement) _then;

/// Create a copy of PostingRequirement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? core = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,core: null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostingRequirement].
extension PostingRequirementPatterns on PostingRequirement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostingRequirement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostingRequirement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostingRequirement value)  $default,){
final _that = this;
switch (_that) {
case _PostingRequirement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostingRequirement value)?  $default,){
final _that = this;
switch (_that) {
case _PostingRequirement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  bool core)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostingRequirement() when $default != null:
return $default(_that.label,_that.core);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  bool core)  $default,) {final _that = this;
switch (_that) {
case _PostingRequirement():
return $default(_that.label,_that.core);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  bool core)?  $default,) {final _that = this;
switch (_that) {
case _PostingRequirement() when $default != null:
return $default(_that.label,_that.core);case _:
  return null;

}
}

}

/// @nodoc


class _PostingRequirement implements PostingRequirement {
  const _PostingRequirement({required this.label, this.core = false});
  

@override final  String label;
@override@JsonKey() final  bool core;

/// Create a copy of PostingRequirement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostingRequirementCopyWith<_PostingRequirement> get copyWith => __$PostingRequirementCopyWithImpl<_PostingRequirement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostingRequirement&&(identical(other.label, label) || other.label == label)&&(identical(other.core, core) || other.core == core));
}


@override
int get hashCode => Object.hash(runtimeType,label,core);

@override
String toString() {
  return 'PostingRequirement(label: $label, core: $core)';
}


}

/// @nodoc
abstract mixin class _$PostingRequirementCopyWith<$Res> implements $PostingRequirementCopyWith<$Res> {
  factory _$PostingRequirementCopyWith(_PostingRequirement value, $Res Function(_PostingRequirement) _then) = __$PostingRequirementCopyWithImpl;
@override @useResult
$Res call({
 String label, bool core
});




}
/// @nodoc
class __$PostingRequirementCopyWithImpl<$Res>
    implements _$PostingRequirementCopyWith<$Res> {
  __$PostingRequirementCopyWithImpl(this._self, this._then);

  final _PostingRequirement _self;
  final $Res Function(_PostingRequirement) _then;

/// Create a copy of PostingRequirement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? core = null,}) {
  return _then(_PostingRequirement(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,core: null == core ? _self.core : core // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CvMatch {

 String get cvFileName; int get score;
/// Create a copy of CvMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CvMatchCopyWith<CvMatch> get copyWith => _$CvMatchCopyWithImpl<CvMatch>(this as CvMatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CvMatch&&(identical(other.cvFileName, cvFileName) || other.cvFileName == cvFileName)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,cvFileName,score);

@override
String toString() {
  return 'CvMatch(cvFileName: $cvFileName, score: $score)';
}


}

/// @nodoc
abstract mixin class $CvMatchCopyWith<$Res>  {
  factory $CvMatchCopyWith(CvMatch value, $Res Function(CvMatch) _then) = _$CvMatchCopyWithImpl;
@useResult
$Res call({
 String cvFileName, int score
});




}
/// @nodoc
class _$CvMatchCopyWithImpl<$Res>
    implements $CvMatchCopyWith<$Res> {
  _$CvMatchCopyWithImpl(this._self, this._then);

  final CvMatch _self;
  final $Res Function(CvMatch) _then;

/// Create a copy of CvMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cvFileName = null,Object? score = null,}) {
  return _then(_self.copyWith(
cvFileName: null == cvFileName ? _self.cvFileName : cvFileName // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CvMatch].
extension CvMatchPatterns on CvMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CvMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CvMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CvMatch value)  $default,){
final _that = this;
switch (_that) {
case _CvMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CvMatch value)?  $default,){
final _that = this;
switch (_that) {
case _CvMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cvFileName,  int score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CvMatch() when $default != null:
return $default(_that.cvFileName,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cvFileName,  int score)  $default,) {final _that = this;
switch (_that) {
case _CvMatch():
return $default(_that.cvFileName,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cvFileName,  int score)?  $default,) {final _that = this;
switch (_that) {
case _CvMatch() when $default != null:
return $default(_that.cvFileName,_that.score);case _:
  return null;

}
}

}

/// @nodoc


class _CvMatch implements CvMatch {
  const _CvMatch({required this.cvFileName, required this.score});
  

@override final  String cvFileName;
@override final  int score;

/// Create a copy of CvMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CvMatchCopyWith<_CvMatch> get copyWith => __$CvMatchCopyWithImpl<_CvMatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CvMatch&&(identical(other.cvFileName, cvFileName) || other.cvFileName == cvFileName)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,cvFileName,score);

@override
String toString() {
  return 'CvMatch(cvFileName: $cvFileName, score: $score)';
}


}

/// @nodoc
abstract mixin class _$CvMatchCopyWith<$Res> implements $CvMatchCopyWith<$Res> {
  factory _$CvMatchCopyWith(_CvMatch value, $Res Function(_CvMatch) _then) = __$CvMatchCopyWithImpl;
@override @useResult
$Res call({
 String cvFileName, int score
});




}
/// @nodoc
class __$CvMatchCopyWithImpl<$Res>
    implements _$CvMatchCopyWith<$Res> {
  __$CvMatchCopyWithImpl(this._self, this._then);

  final _CvMatch _self;
  final $Res Function(_CvMatch) _then;

/// Create a copy of CvMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cvFileName = null,Object? score = null,}) {
  return _then(_CvMatch(
cvFileName: null == cvFileName ? _self.cvFileName : cvFileName // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ParsedPosting {

 String get company; String get role; String get location; String get level; String get deadline;/// Reader confidence, 0 to 100.
 int get confidence; List<PostingRequirement> get requirements;/// How each CV in the bank scores against the posting, best first.
 List<CvMatch> get cvMatches;
/// Create a copy of ParsedPosting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedPostingCopyWith<ParsedPosting> get copyWith => _$ParsedPostingCopyWithImpl<ParsedPosting>(this as ParsedPosting, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedPosting&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.location, location) || other.location == location)&&(identical(other.level, level) || other.level == level)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.cvMatches, cvMatches));
}


@override
int get hashCode => Object.hash(runtimeType,company,role,location,level,deadline,confidence,const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(cvMatches));

@override
String toString() {
  return 'ParsedPosting(company: $company, role: $role, location: $location, level: $level, deadline: $deadline, confidence: $confidence, requirements: $requirements, cvMatches: $cvMatches)';
}


}

/// @nodoc
abstract mixin class $ParsedPostingCopyWith<$Res>  {
  factory $ParsedPostingCopyWith(ParsedPosting value, $Res Function(ParsedPosting) _then) = _$ParsedPostingCopyWithImpl;
@useResult
$Res call({
 String company, String role, String location, String level, String deadline, int confidence, List<PostingRequirement> requirements, List<CvMatch> cvMatches
});




}
/// @nodoc
class _$ParsedPostingCopyWithImpl<$Res>
    implements $ParsedPostingCopyWith<$Res> {
  _$ParsedPostingCopyWithImpl(this._self, this._then);

  final ParsedPosting _self;
  final $Res Function(ParsedPosting) _then;

/// Create a copy of ParsedPosting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? company = null,Object? role = null,Object? location = null,Object? level = null,Object? deadline = null,Object? confidence = null,Object? requirements = null,Object? cvMatches = null,}) {
  return _then(_self.copyWith(
company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<PostingRequirement>,cvMatches: null == cvMatches ? _self.cvMatches : cvMatches // ignore: cast_nullable_to_non_nullable
as List<CvMatch>,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedPosting].
extension ParsedPostingPatterns on ParsedPosting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedPosting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedPosting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedPosting value)  $default,){
final _that = this;
switch (_that) {
case _ParsedPosting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedPosting value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedPosting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String company,  String role,  String location,  String level,  String deadline,  int confidence,  List<PostingRequirement> requirements,  List<CvMatch> cvMatches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedPosting() when $default != null:
return $default(_that.company,_that.role,_that.location,_that.level,_that.deadline,_that.confidence,_that.requirements,_that.cvMatches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String company,  String role,  String location,  String level,  String deadline,  int confidence,  List<PostingRequirement> requirements,  List<CvMatch> cvMatches)  $default,) {final _that = this;
switch (_that) {
case _ParsedPosting():
return $default(_that.company,_that.role,_that.location,_that.level,_that.deadline,_that.confidence,_that.requirements,_that.cvMatches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String company,  String role,  String location,  String level,  String deadline,  int confidence,  List<PostingRequirement> requirements,  List<CvMatch> cvMatches)?  $default,) {final _that = this;
switch (_that) {
case _ParsedPosting() when $default != null:
return $default(_that.company,_that.role,_that.location,_that.level,_that.deadline,_that.confidence,_that.requirements,_that.cvMatches);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedPosting implements ParsedPosting {
  const _ParsedPosting({required this.company, required this.role, required this.location, required this.level, required this.deadline, required this.confidence, required final  List<PostingRequirement> requirements, required final  List<CvMatch> cvMatches}): _requirements = requirements,_cvMatches = cvMatches;
  

@override final  String company;
@override final  String role;
@override final  String location;
@override final  String level;
@override final  String deadline;
/// Reader confidence, 0 to 100.
@override final  int confidence;
 final  List<PostingRequirement> _requirements;
@override List<PostingRequirement> get requirements {
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirements);
}

/// How each CV in the bank scores against the posting, best first.
 final  List<CvMatch> _cvMatches;
/// How each CV in the bank scores against the posting, best first.
@override List<CvMatch> get cvMatches {
  if (_cvMatches is EqualUnmodifiableListView) return _cvMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cvMatches);
}


/// Create a copy of ParsedPosting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedPostingCopyWith<_ParsedPosting> get copyWith => __$ParsedPostingCopyWithImpl<_ParsedPosting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedPosting&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.location, location) || other.location == location)&&(identical(other.level, level) || other.level == level)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._cvMatches, _cvMatches));
}


@override
int get hashCode => Object.hash(runtimeType,company,role,location,level,deadline,confidence,const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_cvMatches));

@override
String toString() {
  return 'ParsedPosting(company: $company, role: $role, location: $location, level: $level, deadline: $deadline, confidence: $confidence, requirements: $requirements, cvMatches: $cvMatches)';
}


}

/// @nodoc
abstract mixin class _$ParsedPostingCopyWith<$Res> implements $ParsedPostingCopyWith<$Res> {
  factory _$ParsedPostingCopyWith(_ParsedPosting value, $Res Function(_ParsedPosting) _then) = __$ParsedPostingCopyWithImpl;
@override @useResult
$Res call({
 String company, String role, String location, String level, String deadline, int confidence, List<PostingRequirement> requirements, List<CvMatch> cvMatches
});




}
/// @nodoc
class __$ParsedPostingCopyWithImpl<$Res>
    implements _$ParsedPostingCopyWith<$Res> {
  __$ParsedPostingCopyWithImpl(this._self, this._then);

  final _ParsedPosting _self;
  final $Res Function(_ParsedPosting) _then;

/// Create a copy of ParsedPosting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? company = null,Object? role = null,Object? location = null,Object? level = null,Object? deadline = null,Object? confidence = null,Object? requirements = null,Object? cvMatches = null,}) {
  return _then(_ParsedPosting(
company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as int,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<PostingRequirement>,cvMatches: null == cvMatches ? _self._cvMatches : cvMatches // ignore: cast_nullable_to_non_nullable
as List<CvMatch>,
  ));
}


}

// dart format on
