import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:credbevy/controller/api_service.dart';
import 'package:credbevy/model/balance._model.dart';
import 'package:credbevy/model/beneficiaries_model.dart';
import 'package:credbevy/model/credit_card_model.dart';
import 'package:credbevy/model/expenses_model.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:get/get.dart';










class AppService extends GetxController {
  

  int selectedIndexFavorite = -1;
  int selectedIndexAmount = -1;
  final amountSuggestions = [
    "10",
    "100",
    "1000",
    "10000"
  ];

  final selectedAmountString = "".obs;
  final selectedBefId = 2.obs;

  final nameTextController = TextEditingController();
  final amountTextController = TextEditingController();
  final referenceTextController = TextEditingController();

  void onSelectAmount(int index) { 
    selectedIndexAmount = index;
    amountTextController.text = amountSuggestions[index];
    update();
  }

  void onSelectFavorite(int index) { 
    selectedIndexFavorite = index;
    selectedBefId.value = beneficiariesArray[index].id;
    nameTextController.text = beneficiariesArray[index].fullname; 
    update();
  }



  final isLoading = false.obs;
  
  final baseService = Get.find<ApiService>();

  Future<void> transferMoney({required int receiverId, required int amount, required VoidCallback onSuccess}) async {
    const endPoint = '/transfer';

    final body = {
      "receiver_id": receiverId,
      "amount": amount
    };

    try {
      isLoading(true);
      final response = await baseService.postData(endpoint: endPoint, body: body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('success res: ${response.statusCode} -- ${response.body}');
        onSuccess();
      } else {
        debugPrint('Failed to send funds: ${response.statusCode} ${response.body}');
      }
    } 
    catch (e, stackTrace) {
      debugPrint('Error sending funds: $e => $stackTrace');
    } 
    finally {
      isLoading(false);
    }
  }
  
  //ALL CREDIT CARDS
  final creditCardsArray = <CardData>[].obs;
  Future<void> getAllCreditCards() async {
    const endPoint = '/cards'; 

    try {
      isLoading(true);
      final response = await baseService.getData(endpoint: endPoint,);
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('success res: ${response.statusCode} -- ${response.body}');
        final CreditCard jsonArray = CreditCard.fromJson(response.body);
        creditCardsArray
        ..clear()
        ..addAll(jsonArray.data);
      } else {
        debugPrint('Failed to fetch credit cards: ${response.statusCode} ${response.body}');
      }
    } 
    catch (e, stackTrace) {
      debugPrint('Error fetching cards: $e => $stackTrace');
    } 
    finally {
      isLoading(false);
    }
  }

  //ALL MY EXPENSES
  final expensesArray = <ExpenseRecord>[].obs;
  Future<void> getAllMyExpenses() async {
    const endPoint = '/myexpenses'; 

    try {
      isLoading(true);
      final response = await baseService.getData(endpoint: endPoint,);
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('success res: ${response.statusCode} -- ${response.body}');
        final Expenses jsonArray = Expenses.fromJson(response.body);

        log("$jsonArray");
        expensesArray
        ..clear()
        ..addAll(jsonArray.data);
      } else {
        debugPrint('Failed to fetch my expenses: ${response.statusCode} ${response.body}');
      }
    } 
    catch (e, stackTrace) {
      debugPrint('Error fetching data: $e => $stackTrace');
    } 
    finally {
      isLoading(false);
    }
  }

  //ALL MY BENEFICIARIES
  final beneficiariesArray = <UserRecord>[].obs;
  Future<void> getAllMyBeneficiaries() async {
    const endPoint = '/beneficiaries'; 

    try {
      isLoading(true);
      final response = await baseService.getData(endpoint: endPoint,);
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('success res: ${response.statusCode} -- ${response.body}');
        final UserResponse jsonArray = UserResponse.fromJson(response.body);
        beneficiariesArray
        ..clear()
        ..addAll(jsonArray.data);
      } else {
        debugPrint('Failed to fetch my beneficiaries: ${response.statusCode} ${response.body}');
      }
    } 
    catch (e, stackTrace) {
      debugPrint('Error fetching data: $e => $stackTrace');
    } 
    finally {
      isLoading(false);
    }
  }

  //GET SINGLE BENEFICIARY
  Future<dynamic> getSingleBeneficiary({required int id}) async {
    String endPoint = '/beneficiary/$id'; 

    try {
      isLoading(true);
      final response = await baseService.getData(endpoint: endPoint,);
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('sucess res: ${response.statusCode} -- ${response.body}');
        final dynamic jsonObject = response.body;
        return jsonObject;
      } else {
        debugPrint('Failed to fetch single beneficiary: ${response.statusCode} ${response.body}');
      }
    } 
    catch (e, stackTrace) {
      debugPrint('Error fetching data: $e => $stackTrace');
    } 
    finally {
      isLoading(false);
    }
  }

  //GET MY DOLLAR ACCOUNT BALANCE
  final accBalance = "0.00".obs;
  Future<void> getMyBalance() async {
    String endPoint = '/balance'; 

    try {
      isLoading(true);
      final response = await baseService.getData(endpoint: endPoint,);
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint('sucess res: ${response.statusCode} -- ${response.body}');
        final Balance jsonObject = Balance.fromJson(response.body);
        debugPrint("json object: $jsonObject");
        accBalance.value = jsonObject.data.toString();
      } else {
        debugPrint('Failed to fetch account balance: ${response.statusCode} ${response.body}');
      }
    } 
    catch (e, stackTrace) {
      debugPrint('Error fetching data: $e => $stackTrace');
    } 
    finally {
      isLoading(false);
    }
  }

   

  @override
  void onInit() {
    // TODO: implement onInit
    getAllCreditCards()
    .whenComplete(()
    => getAllMyExpenses()
    .whenComplete(() 
    => getAllMyBeneficiaries()
    .whenComplete(() => getMyBalance())
    )
    );

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  

  @override
  void dispose() {
    // TODO: implement onClose
    nameTextController.dispose();
    amountTextController.dispose();
    referenceTextController.dispose();

    super.dispose();
  }

}