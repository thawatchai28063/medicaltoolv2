// To parse this JSON data, do
//
//     final mdcModel = mdcModelFromJson(jsonString);

import 'dart:convert';

List<MdcModel> mdcModelFromJson(String str) =>
    List<MdcModel>.from(json.decode(str).map((x) => MdcModel.fromJson(x)));

String mdcModelToJson(List<MdcModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MdcModel {
  String? mdcCd;
  dynamic mdcId;
  String? mdcName;
  String? mdcEquipment;
  String? mdcDoc;
  String? mdcRun;
  String? mdcYeeho;
  String? mdcRisk;
  String? mdcDep;
  String? mdcUbr;
  String? mdcLocation;
  String? mdcInvoiceNo;
  String? mdcPrice;
  String? mdcDepreciation;
  String? mdcDpctPrice;
  String? mdcDpctYy;
  String? mdcDpctLast;
  String? mdcCostlast;
  String? mdcSts;
  String? mdcStsName;

  MdcModel({
    this.mdcCd,
    this.mdcId,
    this.mdcName,
    this.mdcEquipment,
    this.mdcDoc,
    this.mdcRun,
    this.mdcYeeho,
    this.mdcRisk,
    this.mdcDep,
    this.mdcUbr,
    this.mdcLocation,
    this.mdcInvoiceNo,
    this.mdcPrice,
    this.mdcDepreciation,
    this.mdcDpctPrice,
    this.mdcDpctYy,
    this.mdcDpctLast,
    this.mdcCostlast,
    this.mdcSts,
    this.mdcStsName,
  });

  factory MdcModel.fromJson(Map<String, dynamic> json) => MdcModel(
        mdcCd: json["mdc_cd"],
        mdcId: json["mdc_id"],
        mdcName: json["mdc_name"],
        mdcEquipment: json["mdc_Equipment"],
        mdcDoc: json["mdc_doc"],
        mdcRun: json["mdc_run"],
        mdcYeeho: json["mdc_yeeho"],
        mdcRisk: json["mdc_RISK"],
        mdcDep: json["mdc_dep"],
        mdcUbr: json["mdc_ubr"],
        mdcLocation: json["mdc_location"],
        mdcInvoiceNo: json["mdc_InvoiceNo"],
        mdcPrice: json["mdc_price"],
        mdcDepreciation: json["mdc_depreciation"],
        mdcDpctPrice: json["mdc_dpct_price"],
        mdcDpctYy: json["mdc_dpct_yy"],
        mdcDpctLast: json["mdc_dpct_last"],
        mdcCostlast: json["mdc_costlast"],
        mdcSts: json["mdc_sts"],
        mdcStsName: json["mdc_sts_name"],
      );

  Map<String, dynamic> toJson() => {
        "mdc_cd": mdcCd,
        "mdc_id": mdcId,
        "mdc_name": mdcName,
        "mdc_Equipment": mdcEquipment,
        "mdc_doc": mdcDoc,
        "mdc_run": mdcRun,
        "mdc_yeeho": mdcYeeho,
        "mdc_RISK": mdcRisk,
        "mdc_dep": mdcDep,
        "mdc_ubr": mdcUbr,
        "mdc_location": mdcLocation,
        "mdc_InvoiceNo": mdcInvoiceNo,
        "mdc_price": mdcPrice,
        "mdc_depreciation": mdcDepreciation,
        "mdc_dpct_price": mdcDpctPrice,
        "mdc_dpct_yy": mdcDpctYy,
        "mdc_dpct_last": mdcDpctLast,
        "mdc_costlast": mdcCostlast,
        "mdc_sts": mdcSts,
        "mdc_sts_name": mdcStsName,
      };
}
