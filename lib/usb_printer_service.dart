import 'dart:js' as js;
import 'invoice_service.dart';

class USBPrinterService {

  final InvoiceService invoiceService = InvoiceService();

  Future<void> printUSBInvoice(Map<String, dynamic> order) async {
    String invoiceData = await invoiceService.generateInvoice(order);
    js.context.callMethod("printUSB", [invoiceData]);
  }
}
