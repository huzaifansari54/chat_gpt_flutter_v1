const String OPEN_AI_KEY = "<-- your api key -->";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      // "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
Map<String, String> headerBearerOption1(String token) => {
      "Content-Type": "application/x-www-form-urlencode",
      'Authorization': 'Bearer $token',
    };
