import 'package:flutter/material.dart';
import 'inicio.dart';

class PantallaLogin extends StatelessWidget {
  PantallaLogin({super.key});

  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> mostrarPassword = ValueNotifier<bool>(false);

  void iniciarSesion(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PantallaInicio(correo: correoController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGEN DE CABECERA
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'assets/images/login_header.jpg',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      width: double.infinity,
                      color: const Color(0xFFE8DDC9),
                      child: const Icon(
                        Icons.agriculture,
                        size: 70,
                        color: Color(0xFF8B7656),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),

              // TITULO
              const Text(
                'Bienvenido de vuelta',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF24231F),
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 16),

              // DESCRIPCION
              const Text(
                'Inicia sesión para ver tus pedidos y tu carrito guardado.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.4,
                  color: Color(0xFF766F62),
                ),
              ),

              const SizedBox(height: 36),

              // CORREO
              const Text(
                'Correo electrónico',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF24231F),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'nombre@correo.com',
                  hintStyle: const TextStyle(
                    color: Color(0xFF817867),
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon(
                    Icons.mail_outline,
                    color: Color(0xFF817867),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF1EBDD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                      color: Color(0xFF4C974C),
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 23,
                    horizontal: 16,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // CONTRASEÑA
              const Text(
                'Contraseña',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF24231F),
                ),
              ),

              const SizedBox(height: 12),

              ValueListenableBuilder<bool>(
                valueListenable: mostrarPassword,
                builder: (context, mostrar, child) {
                  return TextField(
                    controller: passwordController,
                    obscureText: !mostrar,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: const TextStyle(
                        color: Color(0xFF817867),
                        fontSize: 20,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFF817867),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          mostrar
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF817867),
                        ),
                        onPressed: () {
                          mostrarPassword.value = !mostrarPassword.value;
                        },
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF1EBDD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(
                          color: Color(0xFF4C974C),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 23,
                        horizontal: 16,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // OLVIDASTE CONTRASEÑA
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Color(0xFF438244),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // BOTON INICIAR SESION
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: () => iniciarSesion(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C974C),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // SEPARADOR
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: Color(0xFFE1D8C7), thickness: 1.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'o continúa con',
                      style: TextStyle(fontSize: 17, color: Color(0xFF766F62)),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: Color(0xFFE1D8C7), thickness: 1.5),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // GOOGLE
              SizedBox(
                width: double.infinity,
                height: 64,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Text(
                    'G',
                    style: TextStyle(
                      color: Color(0xFF4285F4),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  label: const Text(
                    'Continuar con Google',
                    style: TextStyle(
                      color: Color(0xFF24231F),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFE4D8C2)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // REGISTRO
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text.rich(
                    TextSpan(
                      text: '¿No tienes una cuenta? ',
                      style: TextStyle(color: Color(0xFF766F62), fontSize: 18),
                      children: [
                        TextSpan(
                          text: 'Regístrate',
                          style: TextStyle(
                            color: Color(0xFF438244),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
