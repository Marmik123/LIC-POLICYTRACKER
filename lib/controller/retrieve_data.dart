import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lic_policies_clone/view/policies.dart';
import 'package:lic_policies_clone/view/sb__policy_view.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String table = 'Policies';
final String sb_p_table = 'SBPolicies';
final String columnName = 'MembName';
var dbContent;
late final String dbPath;
late String query;
late dynamic db;
late final File file;

class DbConfiguration {

  Future<void> initializeDatabase() async {
    print("DATABASE INITIALIZER");
    dbContent = await rootBundle.load('assets/mm_lips.db');
    dbPath = await getDatabasesPath();
    print('DBPATH $dbPath');
    file = File(join(dbPath, 'mm_lips.db'));
    await file.writeAsBytes(dbContent.buffer.asUint8List());
    db = await openDatabase(join(dbPath, 'mm_lips.db'));
    print("---------##--------##--------##-----");
    print(file);
    print(db);
  }
  Future<List<Map<String, dynamic>>> getData() async {
    print("getData called");
    final results = await db.query(table);
    print(results);
    return await db.query(table);
  }
  Future<List<Map<String, dynamic>>> getSBData() async {
    print("getSBData called");
    query = 'SELECT * FROM ${sb_p_table}';
    final results = await db.rawQuery(query);
    print(results);
    return await results;
  }



  Future<List<Map<String, dynamic>>> searchPolicy(
      {required String searchArg,required Option option}) async {
    print("SEARCH_POLICY called");
    print("##@#@#@###@@@@#####@");
    print(option);
    if(option==Option.policyNo){
      query = 'SELECT * FROM ${table} WHERE PolicyNo LIKE ?';
    }else if (option==Option.groupName){
      query = 'SELECT * FROM ${table} WHERE GroupName LIKE ?';
    }else  query = 'SELECT * FROM ${table} WHERE MembName LIKE ?';

    final args = ['%$searchArg%'];
    final results = await db.rawQuery(query, args);
    print(results);
    return results;

  }


  Future<List<Map<String, dynamic>>> searchSBPolicy(
      {required String searchArg,required sBOption sb}) async {
    print("SEARCH_POLICY called");
    print("##@#@#@###@@@@#####@");
    print(sBOption);
    if(sb==sBOption.policyNo){
      query = 'SELECT * FROM ${sb_p_table} WHERE PolicyNo LIKE ?';
    }else if (sb==sBOption.groupName){
      query = 'SELECT * FROM ${sb_p_table} WHERE GroupName LIKE ?';
    }else  query = 'SELECT * FROM ${sb_p_table} WHERE MembName LIKE ?';

    final args = ['%$searchArg%'];
    final results = await db.rawQuery(query, args);
    print(results);
    return results;

  }


/*Future<List<Map<String, dynamic>>> searchByPolicyHolderName(
      {required String searchArg}) async {
    print("POLICY HOLDER called");
    print("##@#@#@###@@@@#####@");
    final query = 'SELECT * FROM ${table} WHERE MembName LIKE ?';
    final args = ['%$searchArg%'];
    final results = await db.rawQuery(query, args);
    print(results);
    return results;
  }

  Future<List<Map<String, dynamic>>> searchByGroupName(
      {required String searchArg}) async {
    print("SEARCH BY GROUPNAME called");
    print("##@#@#@###@@@@#####@");
    final query = 'SELECT * FROM ${table} WHERE GroupName LIKE ?';
    final args = ['%$searchArg%'];
    final results = await db.rawQuery(query, args);
    print(results);
    return results;
  }*/
}