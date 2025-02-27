import 'package:esc_pos_utils/esc_pos_utils.dart';

class InvoiceService {
  Future<String> generateInvoice(Map<String, dynamic> order) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    List<int> bytes = [];

    bytes += generator.text('Cloud Kitchen',
        styles: const PosStyles(align: PosAlign.center, height: PosTextSize.size2, width: PosTextSize.size2));
    bytes += generator.text('----------------------------');

    bytes += generator.text('Order ID: ${order['orderId']}');
    bytes += generator.text('Customer: ${order['customerName']}');

    for (var item in order['items']) {
      bytes += generator.text('${item['name']} x${item['quantity']} - Rs. ${item['price']}');
    }

    bytes += generator.text('----------------------------');
    bytes += generator.text('Total: \$${order['totalAmount']}', styles: const PosStyles(align: PosAlign.right));
    bytes += generator.text('Thank You!', styles: const PosStyles(align: PosAlign.center));

    return String.fromCharCodes(bytes);
  }
}
