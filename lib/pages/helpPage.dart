import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  // Контроллеры для управления текстом в полях и его очистки
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Переменные для хранения текстов ошибок
  String? _emailError;
  String? _phoneError;
  String? _messageError;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const telegramColor = Color(0xFF24A1DE);
    const cardBackgroundColor = Color(0xFF2D3035);

    return Scaffold(
      backgroundColor: const Color(0xFF1E1F22),
      appBar: AppBar(
        backgroundColor: telegramColor,
        title: const Text(
          'Поддержка Telegram',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 18, 
            fontWeight: FontWeight.w500),
            ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Нужна помощь?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20, 
                fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            const Text(
              'Оставьте свои контактные данные и напишите проблему/вопрос',
              style: TextStyle(
                color: Colors.grey, 
                fontSize: 14),
            ),

            SizedBox(height: 24),
            
            // Поле email
            _buildInputField(
              controller: _emailController,
              icon: Icons.email_outlined,
              label: 'Email support',
              hint: 'support@telegramapp.com',
              backgroundColor: cardBackgroundColor,
              errorText: _emailError,
            ),
            SizedBox(height: 16),
            
            // Поле телефонного номера
            _buildInputField(
              controller: _phoneController,
              icon: Icons.phone_outlined,
              label: 'Контактный номер',
              hint: '+996 700 112 355',
              backgroundColor: cardBackgroundColor,
              keyboardType: TextInputType.phone,
              errorText: _phoneError,
            ),

            SizedBox(height: 16),
            
            // Поле сообщения
            _buildInputField(
              controller: _messageController,
              icon: Icons.chat_bubble_outline,
              label: 'Ваши сообщения',
              hint: 'Опишите вашу проблему здесь (минимум 50 букв)...',
              backgroundColor: cardBackgroundColor,
              maxLines: 6,
              errorText: _messageError,
            ),
            SizedBox(height: 30),

           
            SizedBox( 
              width: double.infinity,
              height: 50,
              child: ElevatedButton(  // Кнопка "Отправить"
                style: ElevatedButton.styleFrom(
                  backgroundColor: telegramColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  
                  setState(() {  // Вся логика валидации и очистки выполняется прямо здесь без сторонних void-функций
                    // 1) Проверка email на русские буквы
                    if (RegExp(r'[а-яА-ЯёЁ]').hasMatch(_emailController.text)) {
                      _emailError = 'Пожалуйста, пишите латинскими буквами';
                    } else {
                      _emailError = null;
                    }

                    // 2) Проверка телефона на буквы
                    if (RegExp(r'[a-zA-Zа-яА-ЯёЁ]').hasMatch(_phoneController.text)) {
                      _phoneError = 'Пожалуйста, пишите или печатайте номера';
                    } else {
                      _phoneError = null;
                    }

                    // 3) Проверка сообщения на количество букв/символов (минимум 50)
                    if (_messageController.text.trim().length < 50) {
                      _messageError = 'Пожалуйста, введите минимум 50 букв вашей проблемы или вопроса';
                    } else {
                      _messageError = null;
                    }

                    // Если все проверки пройдены, то стираем текст со всех полей экрана
                    if (_emailError == null && _phoneError == null && _messageError == null) {
                      _emailController.clear();
                      _phoneController.clear();
                      _messageController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Сообщение успешно отправлено!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  }
                  );
                },
                child: const Text(
                  'Отправить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

             Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.email_outlined, color: Color(0xFF2AABEE)),
                title: const Text('Наша электронная почта'),
                subtitle: const Text('support@telegramapp.com'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ), 
            
            SizedBox(height: 12), 

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.phone_outlined, color: Color(0xFF2AABEE)),
                title: const Text('Наш котактный номер'),
                subtitle: const Text('+996 777 555 333'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({  // Вспомогательный метод верстки текстового поля
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String hint,
    required Color backgroundColor,
    String? errorText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: errorText != null ? Border.all(color: Colors.red.shade400, width: 1) : null,
          ),

          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: const Color(0xFF24A1DE), size: 20),
                  const SizedBox(width: 8),
                  Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),

              TextField(
                controller: controller,
                maxLines: maxLines,
                keyboardType: keyboardType,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.white30),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 8),
                ),
              ),
            ],
          ),
        ),

        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6),
            child: Text(errorText, style: TextStyle(color: Colors.red.shade400, fontSize: 12)),
        ),
      ],
    );
  }
}