// ignore_for_file: constant_identifier_names

import 'package:app/app/core/database/sqlite_migration_factory.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqliteConnectionFactory {

  static const _VERSION = 1;
  static const _DATABASE_NAME = "TODO_LIST_PROVIDER_DB";

  static SqliteConnectionFactory? _instance;

  Database? _db;
  final _lock = Lock();

  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    return _instance ?? SqliteConnectionFactory._();
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join( databasePath, _DATABASE_NAME );
    if ( _db == null ) {
      _lock.synchronized( () async {
        _db ?? await openDatabase(
            databasePathFinal,
            version: _VERSION,
            onConfigure: onConfigure,
            onCreate: onCreate,
            onUpgrade: onUpgrade,
            onDowngrade: onDowgrade,
          );
      } );
    }
    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> onConfigure(Database db) async {
    await db.execute( "PRAGMA foreign_keys = ON" );
  }

  Future<void> onCreate(Database db, int version) async {
    final batch = db.batch();
    final migrations = SqliteMigrationFactory().getCreateMigration();
    for( var migration in migrations ) {
      migration.create(batch);
    }
    batch.commit();
  }
  
  Future<void> onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();
    final migrations = SqliteMigrationFactory().getUpgradeMigration(oldVersion);
    for( var migration in migrations ) {
      migration.update(batch);
    }
    batch.commit();
  }
  
  Future<void> onDowgrade(Database db, int oldVersion, int version) async {}

}