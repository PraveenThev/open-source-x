import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<String> generateResponse(String prompt) async {
  const apiKey = "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";

  var url = Uri.https("api.openai.com", "/v1/chat/completions");

  log("modelId 'gpt-3.5-turbo-0613'");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization":
          "Bearer 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"
    },
    body: json.encode({
      "model": "gpt-3.5-turbo-0613",
      "messages": [
        {"role": "user", "content": prompt}
      ],
      'max_tokens': 300,
    }),
  );

  Map<String, dynamic> newresponse = jsonDecode(response.body);
  if (newresponse.containsKey('choices') &&
      newresponse['choices'] is List &&
      newresponse['choices'].isNotEmpty &&
      newresponse['choices'][0] is Map<String, dynamic> &&
      newresponse['choices'][0].containsKey('message')) {
    return newresponse['choices'][0]['message']["content"];
  } else {
    // Handle the case where the response structure is not as expected.
    return 'Error: Invalid response format';
  }
}
