import 'dart:developer';
import 'package:credbevy/controller/connection_service.dart';
import 'package:credbevy/model/error_message.dart';
import 'package:credbevy/view/utils/components/my_snackbar.dart';
import 'package:credbevy/view/utils/theme/app_theme.dart';
import 'package:get/get.dart';








//NETWORK CALLS POWERED BY GETX (NO NEED TO USE HTTP/DIO PACKAGES)
class ApiService extends GetConnect {


  final connectionController = ConnectionService();
  final String url = 'https://credbevyinterview.jbenergyservices.com/public/api/user/interview';


  /*ApiService() {
    httpClient.baseUrl = url;
  }*/

  // Define headers with optional token
  Map<String, String> _buildHeaders({String? token}) {
    return {
      "Accept": "*/*",
      //"Accept-Encoding": "gzip, deflate, br",
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  // Handle Response and Errors
  Future<Response> handleResponse(Response response) async {
    try {
      if (connectionController.isConnected.value) {
        log("Connection is active");

        if (response.isOk) {
          return response;
        } 
        /*else {
          showMySnackBar(message: "Something went wrong", backgroundColor: AppColor.redColor);
          throw ApiError(
            statusCode: response.statusCode ?? 500,
            message: response.statusText ?? 'Unknown Error',
          );
        }*/

        else {
          log('HTTP Error: ${response.statusCode} - ${response.statusText} - ${response.body}');

          String message;
          switch (response.statusCode) {
            case 400:
            message = 'Oops! Something went wrong with your request.';
            break;
            case 401:
            message = 'You need to log in to access this feature.';
            break;
            case 403:
            message = 'You don’t have permission to perform this action.';
            break;
            case 404:
            message = 'We couldn’t find what you’re looking for.';
            break;
            case 408:
            message = 'The request took too long. Please try again.';
            break;
            case 409:
            message = 'There’s a conflict with your request. Please check and try again.';
            break;
            case 413:
            message = 'The file you uploaded is too large. Try a smaller one.';
            break;
            case 415:
            message = 'Unsupported file format. Please use a valid format.';
            break;
            case 422:
            message = 'Some required fields are missing or incorrect.';
            break;
            case 429:
            message = 'You’re making too many requests. Slow down a bit!';
            break;
            case 500:
            message = 'Our servers are having an issue. Please try again later.';
            break;
            case 502:
            message = 'Bad gateway. Please try again in a moment.';
            break;
            case 503:
            message = 'Service is temporarily unavailable. Please be patient.';
            break;
            case 504:
            message = 'The server took too long to respond. Try again later.';
            break;
            default:
            message = 'Something unexpected happened. Please try again.';
           } 
           showMySnackBar(message: message, backgroundColor: AppColor.redColor);
           throw ApiError(
            statusCode: response.statusCode ?? 500,
            message: response.statusText ?? 'Unknown Error',
          );
        }
      } 
      else {
        const noConnectionMessage = "No Internet Connection Available";
        showMySnackBar(message: noConnectionMessage, backgroundColor: AppColor.redColor);
        throw ApiError(
          statusCode: 400,
          message: noConnectionMessage,
        );
      }
    } catch (e, stackTrace) {
      log("Unexpected error: $e ~~ $stackTrace");
      throw ApiError(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }

  // Unified GET request
  Future<Response> getData({required String endpoint, String? token}) async {
    log("$url$endpoint");
    final response = await get("$url$endpoint", headers: _buildHeaders(token: token));
    return handleResponse(response);
  }

  // Unified POST request
  Future<Response> postData({required String endpoint, required Map<String, dynamic> body, String? token}) async {
    log("$url$endpoint");
    final response = await post("$url$endpoint", body, headers: _buildHeaders(token: token));
    return handleResponse(response);
  }


  // Unified PATCH request
  Future<Response> patchData({required String endpoint, required Map<String, dynamic> body, String? token}) async {
    log("$url$endpoint");
    final response = await patch("$url$endpoint", body, headers: _buildHeaders(token: token));
    return handleResponse(response);
  }

  // Unified PUT request
  Future<Response> putData({required String endpoint, required Map<String, dynamic> body, String? token}) async {
    log("$url$endpoint");
    final response = await put("$url$endpoint", body, headers: _buildHeaders(token: token));
    return handleResponse(response);
  }

  // Unified DELETE request
  Future<Response> deleteData({required String endpoint, String? token}) async {
    final response = await delete("$url$endpoint", headers: _buildHeaders(token: token));
    return handleResponse(response);
  }
}

