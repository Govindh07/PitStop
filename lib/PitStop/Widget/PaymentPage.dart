import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: PaymentPage(),));
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with SingleTickerProviderStateMixin {
  final _cardFormKey = GlobalKey<FormState>();
  final _upiFormKey = GlobalKey<FormState>();
  final _walletFormKey = GlobalKey<FormState>();
  final _netbankingFormKey = GlobalKey<FormState>();

  late TabController _tabController;

  String cardNumber = '', expiry = '', cvv = '', cardHolder = '';
  String upiId = '';
  String selectedWallet = 'Paytm';
  String selectedBank = 'HDFC Bank';

  final List<String> wallets = ['Paytm', 'PhonePe', 'Google Pay'];
  final List<String> banks = ['HDFC Bank', 'ICICI Bank', 'SBI', 'Axis Bank'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _showSuccessDialog(String method) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Payment Successful", style: TextStyle(color: Colors.greenAccent)),
        content: Text("Your payment via $method has been completed.",
            style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            child: const Text("OK", style: TextStyle(color: Colors.yellow)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Payment Gateway',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.yellow,
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(text: 'Card'),
            Tab(text: 'UPI'),
            Tab(text: 'Wallet'),
            Tab(text: 'Netbanking'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCardForm(),
          _buildUpiForm(),
          _buildWalletForm(),
          _buildNetbankingForm(),
        ],
      ),
    );
  }

  Widget _buildCardForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _cardFormKey,
        child: ListView(
          children: [
            _buildInputField(
              hint: 'Card Number',
              icon: Icons.credit_card,
              keyboardType: TextInputType.number,
              onSaved: (val) => cardNumber = val!,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    hint: 'Expiry Date',
                    icon: Icons.date_range,
                    keyboardType: TextInputType.datetime,
                    onSaved: (val) => expiry = val!,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInputField(
                    hint: 'CVV',
                    icon: Icons.lock,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    onSaved: (val) => cvv = val!,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInputField(
              hint: 'Card Holder Name',
              icon: Icons.person,
              onSaved: (val) => cardHolder = val!,
            ),
            const SizedBox(height: 24),
            _buildPayButton(() {
              if (_cardFormKey.currentState!.validate()) {
                _cardFormKey.currentState!.save();
                _showSuccessDialog("Card");
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildUpiForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _upiFormKey,
        child: Column(
          children: [
            _buildInputField(
              hint: 'Enter UPI ID',
              icon: Icons.account_balance_wallet,
              keyboardType: TextInputType.emailAddress,
              onSaved: (val) => upiId = val!,
            ),
            const SizedBox(height: 24),
            _buildPayButton(() {
              if (_upiFormKey.currentState!.validate()) {
                _upiFormKey.currentState!.save();
                _showSuccessDialog("UPI");
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _walletFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Wallet", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[900],
              value: selectedWallet,
              items: wallets
                  .map((wallet) => DropdownMenuItem(
                value: wallet,
                child: Text(wallet, style: const TextStyle(color: Colors.white)),
              ))
                  .toList(),
              decoration: _dropdownDecoration(),
              onChanged: (val) => setState(() => selectedWallet = val!),
            ),
            const SizedBox(height: 24),
            _buildPayButton(() {
              _showSuccessDialog("Wallet ($selectedWallet)");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNetbankingForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _netbankingFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Bank", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[900],
              value: selectedBank,
              items: banks
                  .map((bank) => DropdownMenuItem(
                value: bank,
                child: Text(bank, style: const TextStyle(color: Colors.white)),
              ))
                  .toList(),
              decoration: _dropdownDecoration(),
              onChanged: (val) => setState(() => selectedBank = val!),
            ),
            const SizedBox(height: 24),
            _buildPayButton(() {
              _showSuccessDialog("Netbanking ($selectedBank)");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPayButton(VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: const Text("Pay Now", style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[900],
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.yellow),
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.yellow),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
      onSaved: onSaved,
    );
  }
}
