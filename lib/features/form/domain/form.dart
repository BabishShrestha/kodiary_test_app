class FormData {
  final String? title;
  final List<Field> fields;
  final bool canDelete;

  FormData(
      {required this.title, required this.canDelete, required this.fields});

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
        title: json["title"],
        fields: List<Field>.from(
            json["fields"].map((field) => Field.fromJson(field))),
        canDelete: json["canDelete"],
      );
  Map<String, dynamic> toJson() => {
        "title": title,
        "fields": List<dynamic>.from(fields.map((field) => field.toJson())),
        "canDelete": canDelete,
      };
}

class Field {
 final String name;
    final int span;
    final String text;
    final String group;
    final String label;
    final dynamic value;
    final String? append;
    final Event events;
    final String? prepend;
    final bool disabled;
    final bool isUnique;
    final bool? clearable;
    final String fieldType;
    final int? maxlength;
    final bool? isRequired;
    final int labelWidth;
    final dynamic defaultValue;
    final bool? showPassword;
    final bool? showWordLimit;
    final bool addMoreFeature;
    final bool? advancedOptions;
    final bool? isHelpBlockVisible;
    final bool? isPlaceholderVisible;
    final bool? isSignature;
    final String? activeText;
    final String? inActiveText;
    final bool? remote;
    final String? dataUrl;
    final List<Option>? options;
    final bool? multiple;
    final bool? isFromUrl;
    final bool? filterable;
    final String? labelField;
    final String? valueField;
    final bool? isHazardous;

 Field({
        required this.name,
        required this.span,
        required this.text,
        required this.group,
        required this.label,
        this.value,
        this.append,
        required this.events,
        this.prepend,
        required this.disabled,
        required this.isUnique,
        this.clearable,
        required this.fieldType,
        this.maxlength,
        this.isRequired,
        required this.labelWidth,
        required this.defaultValue,
        this.showPassword,
        this.showWordLimit,
        required this.addMoreFeature,
        this.advancedOptions,
        this.isHelpBlockVisible,
        this.isPlaceholderVisible,
        this.isSignature,
        this.activeText,
        this.inActiveText,
        this.remote,
        this.dataUrl,
        this.options,
        this.multiple,
        this.isFromUrl,
        this.filterable,
        this.labelField,
        this.valueField,
        this.isHazardous,
    });
    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        span: json["span"],
        text: json["text"],
        group: json["group"],
        label: json["label"],
        value: json["value"],
        append: json["append"],
        events: Event.fromJson(json["events"]),
        prepend: json["prepend"],
        disabled: json["disabled"],
        isUnique: json["isUnique"],
        clearable: json["clearable"],
        fieldType: json["fieldType"],
        maxlength: json["maxlength"],
        isRequired: json["isRequired"],
        labelWidth: json["labelWidth"],
        defaultValue: json["defaultValue"],
        showPassword: json["showPassword"],
        showWordLimit: json["showWordLimit"],
        addMoreFeature: json["addMoreFeature"],
        advancedOptions: json["advancedOptions"],
        isHelpBlockVisible: json["isHelpBlockVisible"],
        isPlaceholderVisible: json["isPlaceholderVisible"],
        isSignature: json["isSignature"],
        activeText: json["activeText"],
        inActiveText: json["inActiveText"],
        remote: json["remote"],
        dataUrl: json["dataUrl"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((option) => Option.fromJson(option))),
        multiple: json["multiple"],
        isFromUrl: json["isFromUrl"],
        filterable: json["filterable"],
        labelField: json["labelField"],
        valueField: json["valueField"],
        isHazardous: json["isHazardous"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "span": span,
        "text": text,
        "group": group,
        "label": label,
        "value": value,
        "append": append,
        "events": events.toJson(),
        "prepend": prepend,
        "disabled": disabled,
        "isUnique": isUnique,
        "clearable": clearable,
        "fieldType": fieldType,
        "maxlength": maxlength,
        "isRequired": isRequired,
        "labelWidth": labelWidth,
        "defaultValue": defaultValue,
        "showPassword": showPassword,
        "showWordLimit": showWordLimit,
        "addMoreFeature": addMoreFeature,
        "advancedOptions": advancedOptions,
        "isHelpBlockVisible": isHelpBlockVisible,
        "isPlaceholderVisible": isPlaceholderVisible,
        "isSignature": isSignature,
        "activeText": activeText,
        "inActiveText": inActiveText,
        "remote": remote,
        "dataUrl": dataUrl,
        "options": options == null ? [] : List<dynamic>.from(options!.map((option) => option.toJson())),
        "multiple": multiple,
        "isFromUrl": isFromUrl,
        "filterable": filterable,
        "labelField": labelField,
        "valueField": valueField,
        "isHazardous": isHazardous,
    };

}

class DefaultValueClass {
    DefaultValueClass();

    factory DefaultValueClass.fromJson(Map<String, dynamic> json) => DefaultValueClass(
    );

    Map<String, dynamic> toJson() => {
    };
}
class Event {
    final List<dynamic>? values;
  final String? listens;
  final String? triggers;

  Event({this.values, required this.listens, required this.triggers});
   factory Event.fromJson(Map<String, dynamic> json) => Event(
        values: json["values"] == null ? [] : List<dynamic>.from(json["values"]!.map((value) => value)),
        listens: json["listens"],
        triggers: json["triggers"],
    );
    Map<String, dynamic> toJson() => {
        "values": values == null ? [] : List<dynamic>.from(values!.map((value) => value)),
        "listens": listens,
        "triggers": triggers,
    };
}

class Option {
    final String color;
    final bool isFaulty;
    final String optionLabel;
    final String optionValue;

    Option({
        required this.color,
        required this.isFaulty,
        required this.optionLabel,
        required this.optionValue,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        color: json["color"],
        isFaulty: json["is_faulty"],
        optionLabel: json["optionLabel"],
        optionValue: json["optionValue"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "is_faulty": isFaulty,
        "optionLabel": optionLabel,
        "optionValue": optionValue,
    };
}
