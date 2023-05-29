import 'dart:convert';

ThemeResponse themeResponseFromJson(String str) => ThemeResponse.fromJson(json.decode(str));

String themeResponseToJson(ThemeResponse data) => json.encode(data.toJson());

class ThemeResponse {
    final String token;
    final LoginTheme theme;

    ThemeResponse({
        required this.token,
        required this.theme,
    });

    factory ThemeResponse.fromJson(Map<String, dynamic> json) => ThemeResponse(
        token: json["token"],
        theme: LoginTheme.fromJson(json["theme"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "theme": theme.toJson(),
    };
}

class LoginTheme {
    final String name;
    final List<Palette> palettes;
    final String primaryTextColor;
    final String textColor;

    LoginTheme({
        required this.name,
        required this.palettes,
        required this.primaryTextColor,
        required this.textColor,
    });

    factory LoginTheme.fromJson(Map<String, dynamic> json) => LoginTheme(
        name: json["name"],
        palettes: List<Palette>.from(json["palettes"].map((x) => Palette.fromJson(x))),
        primaryTextColor: json["primaryTextColor"],
        textColor: json["textColor"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "palettes": List<dynamic>.from(palettes.map((x) => x.toJson())),
        "primaryTextColor": primaryTextColor,
        "textColor": textColor,
    };
}

class Palette {
    final String label;
    final String value;

    Palette({
        required this.label,
        required this.value,
    });

    factory Palette.fromJson(Map<String, dynamic> json) => Palette(
        label: json["label"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
    };
}
