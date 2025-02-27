import 'package:flutter/material.dart';
import 'usb_printer_service.dart';

class PrinterScreen extends StatelessWidget {
  PrinterScreen({super.key});

  final USBPrinterService usbPrinterService = USBPrinterService();

  void printUSBInvoice(Map<String, dynamic> order) {
    usbPrinterService.printUSBInvoice(order);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> testOrder = {
      "orderId": "12345",
      "customerName": "John Doe",
      "items": [{"name": "Burger", "quantity": 2, "price": 5.99}],
      "totalAmount": 11.98
    };

    return Scaffold(
      appBar: AppBar(title: const Text("USB Printer Test")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => printUSBInvoice(testOrder),
          child: const Text("Print Test Invoice"),
        ),
      ),
    );
  }
}
