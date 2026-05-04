// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShopCollection on Isar {
  IsarCollection<Shop> get shops => this.collection();
}

const ShopSchema = CollectionSchema(
  name: r'Shop',
  id: -8611931068241789946,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'totalDue': PropertySchema(
      id: 1,
      name: r'totalDue',
      type: IsarType.double,
    )
  },
  estimateSize: _shopEstimateSize,
  serialize: _shopSerialize,
  deserialize: _shopDeserialize,
  deserializeProp: _shopDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _shopGetId,
  getLinks: _shopGetLinks,
  attach: _shopAttach,
  version: '3.1.0+1',
);

int _shopEstimateSize(
  Shop object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _shopSerialize(
  Shop object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeDouble(offsets[1], object.totalDue);
}

Shop _shopDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Shop();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.totalDue = reader.readDouble(offsets[1]);
  return object;
}

P _shopDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shopGetId(Shop object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shopGetLinks(Shop object) {
  return [];
}

void _shopAttach(IsarCollection<dynamic> col, Id id, Shop object) {
  object.id = id;
}

extension ShopQueryWhereSort on QueryBuilder<Shop, Shop, QWhere> {
  QueryBuilder<Shop, Shop, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShopQueryWhere on QueryBuilder<Shop, Shop, QWhereClause> {
  QueryBuilder<Shop, Shop, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShopQueryFilter on QueryBuilder<Shop, Shop, QFilterCondition> {
  QueryBuilder<Shop, Shop, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> totalDueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> totalDueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> totalDueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> totalDueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ShopQueryObject on QueryBuilder<Shop, Shop, QFilterCondition> {}

extension ShopQueryLinks on QueryBuilder<Shop, Shop, QFilterCondition> {}

extension ShopQuerySortBy on QueryBuilder<Shop, Shop, QSortBy> {
  QueryBuilder<Shop, Shop, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByTotalDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDue', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByTotalDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDue', Sort.desc);
    });
  }
}

extension ShopQuerySortThenBy on QueryBuilder<Shop, Shop, QSortThenBy> {
  QueryBuilder<Shop, Shop, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByTotalDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDue', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByTotalDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDue', Sort.desc);
    });
  }
}

extension ShopQueryWhereDistinct on QueryBuilder<Shop, Shop, QDistinct> {
  QueryBuilder<Shop, Shop, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shop, Shop, QDistinct> distinctByTotalDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDue');
    });
  }
}

extension ShopQueryProperty on QueryBuilder<Shop, Shop, QQueryProperty> {
  QueryBuilder<Shop, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Shop, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Shop, double, QQueryOperations> totalDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDue');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBillCollection on Isar {
  IsarCollection<Bill> get bills => this.collection();
}

const BillSchema = CollectionSchema(
  name: r'Bill',
  id: 7031121081258233164,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'largePackQty': PropertySchema(
      id: 2,
      name: r'largePackQty',
      type: IsarType.long,
    ),
    r'shopId': PropertySchema(
      id: 3,
      name: r'shopId',
      type: IsarType.long,
    ),
    r'smallPackQty': PropertySchema(
      id: 4,
      name: r'smallPackQty',
      type: IsarType.long,
    ),
    r'totalPrice': PropertySchema(
      id: 5,
      name: r'totalPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _billEstimateSize,
  serialize: _billSerialize,
  deserialize: _billDeserialize,
  deserializeProp: _billDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _billGetId,
  getLinks: _billGetLinks,
  attach: _billAttach,
  version: '3.1.0+1',
);

int _billEstimateSize(
  Bill object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _billSerialize(
  Bill object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.largePackQty);
  writer.writeLong(offsets[3], object.shopId);
  writer.writeLong(offsets[4], object.smallPackQty);
  writer.writeDouble(offsets[5], object.totalPrice);
}

Bill _billDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Bill();
  object.date = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.largePackQty = reader.readLong(offsets[2]);
  object.shopId = reader.readLong(offsets[3]);
  object.smallPackQty = reader.readLong(offsets[4]);
  object.totalPrice = reader.readDouble(offsets[5]);
  return object;
}

P _billDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _billGetId(Bill object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _billGetLinks(Bill object) {
  return [];
}

void _billAttach(IsarCollection<dynamic> col, Id id, Bill object) {
  object.id = id;
}

extension BillQueryWhereSort on QueryBuilder<Bill, Bill, QWhere> {
  QueryBuilder<Bill, Bill, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BillQueryWhere on QueryBuilder<Bill, Bill, QWhereClause> {
  QueryBuilder<Bill, Bill, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Bill, Bill, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Bill, Bill, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Bill, Bill, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BillQueryFilter on QueryBuilder<Bill, Bill, QFilterCondition> {
  QueryBuilder<Bill, Bill, QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> largePackQtyEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'largePackQty',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> largePackQtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'largePackQty',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> largePackQtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'largePackQty',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> largePackQtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'largePackQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> shopIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> shopIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> shopIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> shopIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shopId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> smallPackQtyEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smallPackQty',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> smallPackQtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smallPackQty',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> smallPackQtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smallPackQty',
        value: value,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> smallPackQtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smallPackQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> totalPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> totalPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> totalPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Bill, Bill, QAfterFilterCondition> totalPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BillQueryObject on QueryBuilder<Bill, Bill, QFilterCondition> {}

extension BillQueryLinks on QueryBuilder<Bill, Bill, QFilterCondition> {}

extension BillQuerySortBy on QueryBuilder<Bill, Bill, QSortBy> {
  QueryBuilder<Bill, Bill, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByLargePackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackQty', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByLargePackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackQty', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByShopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortBySmallPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackQty', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortBySmallPackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackQty', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension BillQuerySortThenBy on QueryBuilder<Bill, Bill, QSortThenBy> {
  QueryBuilder<Bill, Bill, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByLargePackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackQty', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByLargePackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackQty', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByShopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenBySmallPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackQty', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenBySmallPackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackQty', Sort.desc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<Bill, Bill, QAfterSortBy> thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }
}

extension BillQueryWhereDistinct on QueryBuilder<Bill, Bill, QDistinct> {
  QueryBuilder<Bill, Bill, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Bill, Bill, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Bill, Bill, QDistinct> distinctByLargePackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'largePackQty');
    });
  }

  QueryBuilder<Bill, Bill, QDistinct> distinctByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shopId');
    });
  }

  QueryBuilder<Bill, Bill, QDistinct> distinctBySmallPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smallPackQty');
    });
  }

  QueryBuilder<Bill, Bill, QDistinct> distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }
}

extension BillQueryProperty on QueryBuilder<Bill, Bill, QQueryProperty> {
  QueryBuilder<Bill, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Bill, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Bill, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Bill, int, QQueryOperations> largePackQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'largePackQty');
    });
  }

  QueryBuilder<Bill, int, QQueryOperations> shopIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shopId');
    });
  }

  QueryBuilder<Bill, int, QQueryOperations> smallPackQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smallPackQty');
    });
  }

  QueryBuilder<Bill, double, QQueryOperations> totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPaymentCollection on Isar {
  IsarCollection<Payment> get payments => this.collection();
}

const PaymentSchema = CollectionSchema(
  name: r'Payment',
  id: -6533700744042574122,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'newDue': PropertySchema(
      id: 3,
      name: r'newDue',
      type: IsarType.double,
    ),
    r'prevDue': PropertySchema(
      id: 4,
      name: r'prevDue',
      type: IsarType.double,
    ),
    r'shopId': PropertySchema(
      id: 5,
      name: r'shopId',
      type: IsarType.long,
    )
  },
  estimateSize: _paymentEstimateSize,
  serialize: _paymentSerialize,
  deserialize: _paymentDeserialize,
  deserializeProp: _paymentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _paymentGetId,
  getLinks: _paymentGetLinks,
  attach: _paymentAttach,
  version: '3.1.0+1',
);

int _paymentEstimateSize(
  Payment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _paymentSerialize(
  Payment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.description);
  writer.writeDouble(offsets[3], object.newDue);
  writer.writeDouble(offsets[4], object.prevDue);
  writer.writeLong(offsets[5], object.shopId);
}

Payment _paymentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Payment();
  object.amount = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.newDue = reader.readDouble(offsets[3]);
  object.prevDue = reader.readDouble(offsets[4]);
  object.shopId = reader.readLong(offsets[5]);
  return object;
}

P _paymentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _paymentGetId(Payment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _paymentGetLinks(Payment object) {
  return [];
}

void _paymentAttach(IsarCollection<dynamic> col, Id id, Payment object) {
  object.id = id;
}

extension PaymentQueryWhereSort on QueryBuilder<Payment, Payment, QWhere> {
  QueryBuilder<Payment, Payment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaymentQueryWhere on QueryBuilder<Payment, Payment, QWhereClause> {
  QueryBuilder<Payment, Payment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Payment, Payment, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PaymentQueryFilter
    on QueryBuilder<Payment, Payment, QFilterCondition> {
  QueryBuilder<Payment, Payment, QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> newDueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> newDueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'newDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> newDueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'newDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> newDueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'newDue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> prevDueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prevDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> prevDueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prevDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> prevDueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prevDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> prevDueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prevDue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> shopIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> shopIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> shopIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Payment, Payment, QAfterFilterCondition> shopIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shopId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PaymentQueryObject
    on QueryBuilder<Payment, Payment, QFilterCondition> {}

extension PaymentQueryLinks
    on QueryBuilder<Payment, Payment, QFilterCondition> {}

extension PaymentQuerySortBy on QueryBuilder<Payment, Payment, QSortBy> {
  QueryBuilder<Payment, Payment, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByNewDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newDue', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByNewDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newDue', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPrevDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevDue', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByPrevDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevDue', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> sortByShopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.desc);
    });
  }
}

extension PaymentQuerySortThenBy
    on QueryBuilder<Payment, Payment, QSortThenBy> {
  QueryBuilder<Payment, Payment, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByNewDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newDue', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByNewDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newDue', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPrevDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevDue', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByPrevDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevDue', Sort.desc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.asc);
    });
  }

  QueryBuilder<Payment, Payment, QAfterSortBy> thenByShopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.desc);
    });
  }
}

extension PaymentQueryWhereDistinct
    on QueryBuilder<Payment, Payment, QDistinct> {
  QueryBuilder<Payment, Payment, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByNewDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newDue');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByPrevDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prevDue');
    });
  }

  QueryBuilder<Payment, Payment, QDistinct> distinctByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shopId');
    });
  }
}

extension PaymentQueryProperty
    on QueryBuilder<Payment, Payment, QQueryProperty> {
  QueryBuilder<Payment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Payment, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<Payment, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Payment, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Payment, double, QQueryOperations> newDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newDue');
    });
  }

  QueryBuilder<Payment, double, QQueryOperations> prevDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prevDue');
    });
  }

  QueryBuilder<Payment, int, QQueryOperations> shopIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shopId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBottleImportCollection on Isar {
  IsarCollection<BottleImport> get bottleImports => this.collection();
}

const BottleImportSchema = CollectionSchema(
  name: r'BottleImport',
  id: -2909060415454832216,
  properties: {
    r'capCost': PropertySchema(
      id: 0,
      name: r'capCost',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'extraCharges': PropertySchema(
      id: 3,
      name: r'extraCharges',
      type: IsarType.double,
    ),
    r'largeBottleCost': PropertySchema(
      id: 4,
      name: r'largeBottleCost',
      type: IsarType.double,
    ),
    r'largeBottleQty': PropertySchema(
      id: 5,
      name: r'largeBottleQty',
      type: IsarType.long,
    ),
    r'plasticCost': PropertySchema(
      id: 6,
      name: r'plasticCost',
      type: IsarType.double,
    ),
    r'sealCost': PropertySchema(
      id: 7,
      name: r'sealCost',
      type: IsarType.double,
    ),
    r'smallBottleCost': PropertySchema(
      id: 8,
      name: r'smallBottleCost',
      type: IsarType.double,
    ),
    r'smallBottleQty': PropertySchema(
      id: 9,
      name: r'smallBottleQty',
      type: IsarType.long,
    ),
    r'supplierName': PropertySchema(
      id: 10,
      name: r'supplierName',
      type: IsarType.string,
    ),
    r'totalCost': PropertySchema(
      id: 11,
      name: r'totalCost',
      type: IsarType.double,
    )
  },
  estimateSize: _bottleImportEstimateSize,
  serialize: _bottleImportSerialize,
  deserialize: _bottleImportDeserialize,
  deserializeProp: _bottleImportDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bottleImportGetId,
  getLinks: _bottleImportGetLinks,
  attach: _bottleImportAttach,
  version: '3.1.0+1',
);

int _bottleImportEstimateSize(
  BottleImport object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.supplierName.length * 3;
  return bytesCount;
}

void _bottleImportSerialize(
  BottleImport object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.capCost);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.description);
  writer.writeDouble(offsets[3], object.extraCharges);
  writer.writeDouble(offsets[4], object.largeBottleCost);
  writer.writeLong(offsets[5], object.largeBottleQty);
  writer.writeDouble(offsets[6], object.plasticCost);
  writer.writeDouble(offsets[7], object.sealCost);
  writer.writeDouble(offsets[8], object.smallBottleCost);
  writer.writeLong(offsets[9], object.smallBottleQty);
  writer.writeString(offsets[10], object.supplierName);
  writer.writeDouble(offsets[11], object.totalCost);
}

BottleImport _bottleImportDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BottleImport();
  object.capCost = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.extraCharges = reader.readDouble(offsets[3]);
  object.id = id;
  object.largeBottleCost = reader.readDouble(offsets[4]);
  object.largeBottleQty = reader.readLong(offsets[5]);
  object.plasticCost = reader.readDouble(offsets[6]);
  object.sealCost = reader.readDouble(offsets[7]);
  object.smallBottleCost = reader.readDouble(offsets[8]);
  object.smallBottleQty = reader.readLong(offsets[9]);
  object.supplierName = reader.readString(offsets[10]);
  object.totalCost = reader.readDouble(offsets[11]);
  return object;
}

P _bottleImportDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bottleImportGetId(BottleImport object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bottleImportGetLinks(BottleImport object) {
  return [];
}

void _bottleImportAttach(
    IsarCollection<dynamic> col, Id id, BottleImport object) {
  object.id = id;
}

extension BottleImportQueryWhereSort
    on QueryBuilder<BottleImport, BottleImport, QWhere> {
  QueryBuilder<BottleImport, BottleImport, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BottleImportQueryWhere
    on QueryBuilder<BottleImport, BottleImport, QWhereClause> {
  QueryBuilder<BottleImport, BottleImport, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BottleImportQueryFilter
    on QueryBuilder<BottleImport, BottleImport, QFilterCondition> {
  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      capCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      capCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      capCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      capCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      extraChargesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraCharges',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      extraChargesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extraCharges',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      extraChargesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extraCharges',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      extraChargesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extraCharges',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'largeBottleCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'largeBottleCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'largeBottleCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'largeBottleCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleQtyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'largeBottleQty',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleQtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'largeBottleQty',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleQtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'largeBottleQty',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      largeBottleQtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'largeBottleQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      plasticCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plasticCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      plasticCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plasticCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      plasticCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plasticCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      plasticCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plasticCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      sealCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sealCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      sealCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sealCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      sealCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sealCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      sealCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sealCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smallBottleCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smallBottleCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smallBottleCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smallBottleCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleQtyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smallBottleQty',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleQtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smallBottleQty',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleQtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smallBottleQty',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      smallBottleQtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smallBottleQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supplierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supplierName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierName',
        value: '',
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      supplierNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supplierName',
        value: '',
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      totalCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      totalCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      totalCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterFilterCondition>
      totalCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BottleImportQueryObject
    on QueryBuilder<BottleImport, BottleImport, QFilterCondition> {}

extension BottleImportQueryLinks
    on QueryBuilder<BottleImport, BottleImport, QFilterCondition> {}

extension BottleImportQuerySortBy
    on QueryBuilder<BottleImport, BottleImport, QSortBy> {
  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByCapCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByCapCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByExtraCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraCharges', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByExtraChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraCharges', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByLargeBottleCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByLargeBottleCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByLargeBottleQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleQty', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByLargeBottleQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleQty', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByPlasticCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plasticCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortByPlasticCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plasticCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortBySealCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sealCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortBySealCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sealCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortBySmallBottleCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortBySmallBottleCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortBySmallBottleQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleQty', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortBySmallBottleQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleQty', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortBySupplierName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      sortBySupplierNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }
}

extension BottleImportQuerySortThenBy
    on QueryBuilder<BottleImport, BottleImport, QSortThenBy> {
  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByCapCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByCapCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByExtraCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraCharges', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByExtraChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraCharges', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByLargeBottleCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByLargeBottleCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByLargeBottleQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleQty', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByLargeBottleQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largeBottleQty', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByPlasticCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plasticCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenByPlasticCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plasticCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenBySealCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sealCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenBySealCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sealCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenBySmallBottleCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenBySmallBottleCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleCost', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenBySmallBottleQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleQty', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenBySmallBottleQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallBottleQty', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenBySupplierName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy>
      thenBySupplierNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierName', Sort.desc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QAfterSortBy> thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }
}

extension BottleImportQueryWhereDistinct
    on QueryBuilder<BottleImport, BottleImport, QDistinct> {
  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctByCapCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capCost');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctByExtraCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extraCharges');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct>
      distinctByLargeBottleCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'largeBottleCost');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct>
      distinctByLargeBottleQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'largeBottleQty');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctByPlasticCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plasticCost');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctBySealCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sealCost');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct>
      distinctBySmallBottleCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smallBottleCost');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct>
      distinctBySmallBottleQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smallBottleQty');
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctBySupplierName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BottleImport, BottleImport, QDistinct> distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }
}

extension BottleImportQueryProperty
    on QueryBuilder<BottleImport, BottleImport, QQueryProperty> {
  QueryBuilder<BottleImport, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations> capCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capCost');
    });
  }

  QueryBuilder<BottleImport, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<BottleImport, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations> extraChargesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extraCharges');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations>
      largeBottleCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'largeBottleCost');
    });
  }

  QueryBuilder<BottleImport, int, QQueryOperations> largeBottleQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'largeBottleQty');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations> plasticCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plasticCost');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations> sealCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sealCost');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations>
      smallBottleCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smallBottleCost');
    });
  }

  QueryBuilder<BottleImport, int, QQueryOperations> smallBottleQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smallBottleQty');
    });
  }

  QueryBuilder<BottleImport, String, QQueryOperations> supplierNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierName');
    });
  }

  QueryBuilder<BottleImport, double, QQueryOperations> totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExpenseCollection on Isar {
  IsarCollection<Expense> get expenses => this.collection();
}

const ExpenseSchema = CollectionSchema(
  name: r'Expense',
  id: -4604318666888508206,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'reason': PropertySchema(
      id: 2,
      name: r'reason',
      type: IsarType.string,
    )
  },
  estimateSize: _expenseEstimateSize,
  serialize: _expenseSerialize,
  deserialize: _expenseDeserialize,
  deserializeProp: _expenseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _expenseGetId,
  getLinks: _expenseGetLinks,
  attach: _expenseAttach,
  version: '3.1.0+1',
);

int _expenseEstimateSize(
  Expense object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.reason.length * 3;
  return bytesCount;
}

void _expenseSerialize(
  Expense object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.reason);
}

Expense _expenseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Expense();
  object.amount = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  object.reason = reader.readString(offsets[2]);
  return object;
}

P _expenseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expenseGetId(Expense object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expenseGetLinks(Expense object) {
  return [];
}

void _expenseAttach(IsarCollection<dynamic> col, Id id, Expense object) {
  object.id = id;
}

extension ExpenseQueryWhereSort on QueryBuilder<Expense, Expense, QWhere> {
  QueryBuilder<Expense, Expense, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpenseQueryWhere on QueryBuilder<Expense, Expense, QWhereClause> {
  QueryBuilder<Expense, Expense, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Expense, Expense, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Expense, Expense, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Expense, Expense, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpenseQueryFilter
    on QueryBuilder<Expense, Expense, QFilterCondition> {
  QueryBuilder<Expense, Expense, QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<Expense, Expense, QAfterFilterCondition> reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reason',
        value: '',
      ));
    });
  }
}

extension ExpenseQueryObject
    on QueryBuilder<Expense, Expense, QFilterCondition> {}

extension ExpenseQueryLinks
    on QueryBuilder<Expense, Expense, QFilterCondition> {}

extension ExpenseQuerySortBy on QueryBuilder<Expense, Expense, QSortBy> {
  QueryBuilder<Expense, Expense, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }
}

extension ExpenseQuerySortThenBy
    on QueryBuilder<Expense, Expense, QSortThenBy> {
  QueryBuilder<Expense, Expense, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<Expense, Expense, QAfterSortBy> thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }
}

extension ExpenseQueryWhereDistinct
    on QueryBuilder<Expense, Expense, QDistinct> {
  QueryBuilder<Expense, Expense, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<Expense, Expense, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Expense, Expense, QDistinct> distinctByReason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }
}

extension ExpenseQueryProperty
    on QueryBuilder<Expense, Expense, QQueryProperty> {
  QueryBuilder<Expense, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Expense, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<Expense, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Expense, String, QQueryOperations> reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActivityLogCollection on Isar {
  IsarCollection<ActivityLog> get activityLogs => this.collection();
}

const ActivityLogSchema = CollectionSchema(
  name: r'ActivityLog',
  id: -3240605868618876905,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _activityLogEstimateSize,
  serialize: _activityLogSerialize,
  deserialize: _activityLogDeserialize,
  deserializeProp: _activityLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _activityLogGetId,
  getLinks: _activityLogGetLinks,
  attach: _activityLogAttach,
  version: '3.1.0+1',
);

int _activityLogEstimateSize(
  ActivityLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.action.length * 3;
  return bytesCount;
}

void _activityLogSerialize(
  ActivityLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeDateTime(offsets[1], object.date);
}

ActivityLog _activityLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActivityLog();
  object.action = reader.readString(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  return object;
}

P _activityLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _activityLogGetId(ActivityLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activityLogGetLinks(ActivityLog object) {
  return [];
}

void _activityLogAttach(
    IsarCollection<dynamic> col, Id id, ActivityLog object) {
  object.id = id;
}

extension ActivityLogQueryWhereSort
    on QueryBuilder<ActivityLog, ActivityLog, QWhere> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActivityLogQueryWhere
    on QueryBuilder<ActivityLog, ActivityLog, QWhereClause> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActivityLogQueryFilter
    on QueryBuilder<ActivityLog, ActivityLog, QFilterCondition> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> actionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      actionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> actionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> actionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'action',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      actionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> actionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> actionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> actionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActivityLogQueryObject
    on QueryBuilder<ActivityLog, ActivityLog, QFilterCondition> {}

extension ActivityLogQueryLinks
    on QueryBuilder<ActivityLog, ActivityLog, QFilterCondition> {}

extension ActivityLogQuerySortBy
    on QueryBuilder<ActivityLog, ActivityLog, QSortBy> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension ActivityLogQuerySortThenBy
    on QueryBuilder<ActivityLog, ActivityLog, QSortThenBy> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ActivityLogQueryWhereDistinct
    on QueryBuilder<ActivityLog, ActivityLog, QDistinct> {
  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctByAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension ActivityLogQueryProperty
    on QueryBuilder<ActivityLog, ActivityLog, QQueryProperty> {
  QueryBuilder<ActivityLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActivityLog, String, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<ActivityLog, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppSettingsCollection on Isar {
  IsarCollection<AppSettings> get appSettings => this.collection();
}

const AppSettingsSchema = CollectionSchema(
  name: r'AppSettings',
  id: -5633561779022347008,
  properties: {
    r'accentColorValue': PropertySchema(
      id: 0,
      name: r'accentColorValue',
      type: IsarType.long,
    ),
    r'isDarkMode': PropertySchema(
      id: 1,
      name: r'isDarkMode',
      type: IsarType.bool,
    ),
    r'largePackPrice': PropertySchema(
      id: 2,
      name: r'largePackPrice',
      type: IsarType.double,
    ),
    r'smallPackPrice': PropertySchema(
      id: 3,
      name: r'smallPackPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _appSettingsEstimateSize,
  serialize: _appSettingsSerialize,
  deserialize: _appSettingsDeserialize,
  deserializeProp: _appSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appSettingsGetId,
  getLinks: _appSettingsGetLinks,
  attach: _appSettingsAttach,
  version: '3.1.0+1',
);

int _appSettingsEstimateSize(
  AppSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appSettingsSerialize(
  AppSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accentColorValue);
  writer.writeBool(offsets[1], object.isDarkMode);
  writer.writeDouble(offsets[2], object.largePackPrice);
  writer.writeDouble(offsets[3], object.smallPackPrice);
}

AppSettings _appSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppSettings();
  object.accentColorValue = reader.readLong(offsets[0]);
  object.id = id;
  object.isDarkMode = reader.readBool(offsets[1]);
  object.largePackPrice = reader.readDouble(offsets[2]);
  object.smallPackPrice = reader.readDouble(offsets[3]);
  return object;
}

P _appSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appSettingsGetId(AppSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appSettingsGetLinks(AppSettings object) {
  return [];
}

void _appSettingsAttach(
    IsarCollection<dynamic> col, Id id, AppSettings object) {
  object.id = id;
}

extension AppSettingsQueryWhereSort
    on QueryBuilder<AppSettings, AppSettings, QWhere> {
  QueryBuilder<AppSettings, AppSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppSettingsQueryWhere
    on QueryBuilder<AppSettings, AppSettings, QWhereClause> {
  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppSettingsQueryFilter
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {
  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      accentColorValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accentColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      accentColorValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accentColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      accentColorValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accentColorValue',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      accentColorValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accentColorValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      isDarkModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDarkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      largePackPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'largePackPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      largePackPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'largePackPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      largePackPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'largePackPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      largePackPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'largePackPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      smallPackPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smallPackPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      smallPackPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smallPackPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      smallPackPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smallPackPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      smallPackPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smallPackPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension AppSettingsQueryObject
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}

extension AppSettingsQueryLinks
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}

extension AppSettingsQuerySortBy
    on QueryBuilder<AppSettings, AppSettings, QSortBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      sortByAccentColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      sortByAccentColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByIsDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByLargePackPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackPrice', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      sortByLargePackPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackPrice', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortBySmallPackPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackPrice', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      sortBySmallPackPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackPrice', Sort.desc);
    });
  }
}

extension AppSettingsQuerySortThenBy
    on QueryBuilder<AppSettings, AppSettings, QSortThenBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      thenByAccentColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      thenByAccentColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColorValue', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByIsDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByLargePackPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackPrice', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      thenByLargePackPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'largePackPrice', Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenBySmallPackPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackPrice', Sort.asc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy>
      thenBySmallPackPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smallPackPrice', Sort.desc);
    });
  }
}

extension AppSettingsQueryWhereDistinct
    on QueryBuilder<AppSettings, AppSettings, QDistinct> {
  QueryBuilder<AppSettings, AppSettings, QDistinct>
      distinctByAccentColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accentColorValue');
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDarkMode');
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctByLargePackPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'largePackPrice');
    });
  }

  QueryBuilder<AppSettings, AppSettings, QDistinct> distinctBySmallPackPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smallPackPrice');
    });
  }
}

extension AppSettingsQueryProperty
    on QueryBuilder<AppSettings, AppSettings, QQueryProperty> {
  QueryBuilder<AppSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppSettings, int, QQueryOperations> accentColorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accentColorValue');
    });
  }

  QueryBuilder<AppSettings, bool, QQueryOperations> isDarkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDarkMode');
    });
  }

  QueryBuilder<AppSettings, double, QQueryOperations> largePackPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'largePackPrice');
    });
  }

  QueryBuilder<AppSettings, double, QQueryOperations> smallPackPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smallPackPrice');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBottleInventoryCollection on Isar {
  IsarCollection<BottleInventory> get bottleInventorys => this.collection();
}

const BottleInventorySchema = CollectionSchema(
  name: r'BottleInventory',
  id: 8733912461686533491,
  properties: {
    r'lastUpdated': PropertySchema(
      id: 0,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'totalLargeBottles': PropertySchema(
      id: 1,
      name: r'totalLargeBottles',
      type: IsarType.long,
    ),
    r'totalSmallBottles': PropertySchema(
      id: 2,
      name: r'totalSmallBottles',
      type: IsarType.long,
    )
  },
  estimateSize: _bottleInventoryEstimateSize,
  serialize: _bottleInventorySerialize,
  deserialize: _bottleInventoryDeserialize,
  deserializeProp: _bottleInventoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bottleInventoryGetId,
  getLinks: _bottleInventoryGetLinks,
  attach: _bottleInventoryAttach,
  version: '3.1.0+1',
);

int _bottleInventoryEstimateSize(
  BottleInventory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bottleInventorySerialize(
  BottleInventory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastUpdated);
  writer.writeLong(offsets[1], object.totalLargeBottles);
  writer.writeLong(offsets[2], object.totalSmallBottles);
}

BottleInventory _bottleInventoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BottleInventory();
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[0]);
  object.totalLargeBottles = reader.readLong(offsets[1]);
  object.totalSmallBottles = reader.readLong(offsets[2]);
  return object;
}

P _bottleInventoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bottleInventoryGetId(BottleInventory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bottleInventoryGetLinks(BottleInventory object) {
  return [];
}

void _bottleInventoryAttach(
    IsarCollection<dynamic> col, Id id, BottleInventory object) {
  object.id = id;
}

extension BottleInventoryQueryWhereSort
    on QueryBuilder<BottleInventory, BottleInventory, QWhere> {
  QueryBuilder<BottleInventory, BottleInventory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BottleInventoryQueryWhere
    on QueryBuilder<BottleInventory, BottleInventory, QWhereClause> {
  QueryBuilder<BottleInventory, BottleInventory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BottleInventoryQueryFilter
    on QueryBuilder<BottleInventory, BottleInventory, QFilterCondition> {
  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalLargeBottlesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalLargeBottles',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalLargeBottlesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalLargeBottles',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalLargeBottlesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalLargeBottles',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalLargeBottlesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalLargeBottles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalSmallBottlesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSmallBottles',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalSmallBottlesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSmallBottles',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalSmallBottlesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSmallBottles',
        value: value,
      ));
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterFilterCondition>
      totalSmallBottlesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSmallBottles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BottleInventoryQueryObject
    on QueryBuilder<BottleInventory, BottleInventory, QFilterCondition> {}

extension BottleInventoryQueryLinks
    on QueryBuilder<BottleInventory, BottleInventory, QFilterCondition> {}

extension BottleInventoryQuerySortBy
    on QueryBuilder<BottleInventory, BottleInventory, QSortBy> {
  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      sortByTotalLargeBottles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLargeBottles', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      sortByTotalLargeBottlesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLargeBottles', Sort.desc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      sortByTotalSmallBottles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSmallBottles', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      sortByTotalSmallBottlesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSmallBottles', Sort.desc);
    });
  }
}

extension BottleInventoryQuerySortThenBy
    on QueryBuilder<BottleInventory, BottleInventory, QSortThenBy> {
  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      thenByTotalLargeBottles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLargeBottles', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      thenByTotalLargeBottlesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLargeBottles', Sort.desc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      thenByTotalSmallBottles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSmallBottles', Sort.asc);
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QAfterSortBy>
      thenByTotalSmallBottlesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSmallBottles', Sort.desc);
    });
  }
}

extension BottleInventoryQueryWhereDistinct
    on QueryBuilder<BottleInventory, BottleInventory, QDistinct> {
  QueryBuilder<BottleInventory, BottleInventory, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QDistinct>
      distinctByTotalLargeBottles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalLargeBottles');
    });
  }

  QueryBuilder<BottleInventory, BottleInventory, QDistinct>
      distinctByTotalSmallBottles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSmallBottles');
    });
  }
}

extension BottleInventoryQueryProperty
    on QueryBuilder<BottleInventory, BottleInventory, QQueryProperty> {
  QueryBuilder<BottleInventory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BottleInventory, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<BottleInventory, int, QQueryOperations>
      totalLargeBottlesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalLargeBottles');
    });
  }

  QueryBuilder<BottleInventory, int, QQueryOperations>
      totalSmallBottlesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSmallBottles');
    });
  }
}
