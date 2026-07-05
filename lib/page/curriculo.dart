import 'package:flutter/material.dart';

class CurriculoPage extends StatelessWidget {
  CurriculoPage({super.key});

  // As "âncoras" de cada seção — como IDs no HTML
  final GlobalKey _sobreKey = GlobalKey();
  final GlobalKey _experienciaKey = GlobalKey();
  final GlobalKey _formacaoKey = GlobalKey();
  final GlobalKey _habilidadesKey = GlobalKey();
  final GlobalKey _projetosKey = GlobalKey();
  final GlobalKey _contatoKey = GlobalKey();

  // Função que rola a tela até a seção
  void _irPara(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cabecalho(),
            _secaoSobre(),
            _secaoExperiencia(),
            _secaoFormacao(),
            _secaoHabilidades(),
            _secaoProjetos(),
            _secaoContato(),
          ],
        ),
      ),
    );
  }

  // ── CABEÇALHO COM MENU ──────────────────────────────
  Widget _cabecalho() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 12,
        children: [
          // Nome no canto esquerdo
          const Text(
            'Thiago Storqui',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Botões de navegação
          Wrap(
            spacing: 8,
            children: [
              _botaoMenu('Sobre', _sobreKey),
              _botaoMenu('Experiência', _experienciaKey),
              _botaoMenu('Formação', _formacaoKey),
              _botaoMenu('Habilidades', _habilidadesKey),
              _botaoMenu('Projetos', _projetosKey),
              _botaoMenu('Contato', _contatoKey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _botaoMenu(String titulo, GlobalKey key) {
    return TextButton(
      onPressed: () => _irPara(key),
      child: Text(
        titulo,
        style: const TextStyle(color: Color(0xFF90CAF9)),
      ),
    );
  }

  // ── SEÇÃO SOBRE ─────────────────────────────────────
  Widget _secaoSobre() {
    return Container(
      key: _sobreKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thiago Winicius Storqui',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Estudante de Análise e Desenvolvimento de Sistemas',
            style: TextStyle(color: Color(0xFF90CAF9), fontSize: 18),
          ),
          const SizedBox(height: 24),
          const Text(
            'Estudante de ADS em busca de oportunidade na área de TI. '
            'Foco em aplicar conhecimentos acadêmicos e experiência em '
            'resolução de problemas adquirida em Hackathons para contribuir '
            'com o crescimento da empresa.',
            style: TextStyle(
              color: Color(0xFFB0B0B0),
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  // ── SEÇÃO EXPERIÊNCIA ────────────────────────────────
  Widget _secaoExperiencia() {
    return Container(
      key: _experienciaKey,
      width: double.infinity,
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titutoSecao('Experiência Profissional'),
          const SizedBox(height: 32),
          _cardExperiencia(
            empresa: 'Cobreaves',
            cargo: 'Auxiliar Administrativo (Faturamento/Orçamentos)',
            descricao: [
              'Emissão de notas fiscais e elaboração de orçamentos.',
              'Organização de dados e atendimento a fornecedores/clientes.',
              'Uso diário de softwares de gestão e planilhas.',
            ],
          ),
          const SizedBox(height: 24),
          _cardExperiencia(
            empresa: 'Escritório de Advocacia Geruza Sodoski',
            cargo: 'Estagiário de Secretariado',
            descricao: [
              'Organização de documentos jurídicos e atendimento ao público.',
              'Gestão de agendas e rotinas administrativas digitais.',
              'Desenvolvimento de comunicação, ética e confidencialidade.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardExperiencia({
    required String empresa,
    required String cargo,
    required List<String> descricao,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            empresa,
            style: const TextStyle(
              color: Color(0xFF90CAF9),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cargo,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          ...descricao.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ',
                        style: TextStyle(color: Color(0xFF90CAF9))),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                            color: Color(0xFFB0B0B0), height: 1.5),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  // ── SEÇÃO FORMAÇÃO ───────────────────────────────────
  Widget _secaoFormacao() {
    return Container(
      key: _formacaoKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titutoSecao('Formação Acadêmica'),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF333333)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Análise e Desenvolvimento de Sistemas',
                  style: TextStyle(
                    color: Color(0xFF90CAF9),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Faculdade Donaduzzi — 4º Período',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  'Previsão de conclusão: Junho/2026',
                  style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── SEÇÃO HABILIDADES ────────────────────────────────
  Widget _secaoHabilidades() {
    return Container(
      key: _habilidadesKey,
      width: double.infinity,
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titutoSecao('Habilidades e Tecnologias'),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              'Flutter/Dart', 'JavaScript', 'TypeScript',
              'React', 'NestJS', 'Node.js', 'Java',
              'Python/Django', 'SQL', 'HTML', 'CSS',
              'Pacote Office', 'Lógica de Programação',
            ].map((h) => _chip(h)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF90CAF9).withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFF90CAF9), fontSize: 14),
      ),
    );
  }

  // ── SEÇÃO PROJETOS ───────────────────────────────────
  Widget _secaoProjetos() {
    return Container(
      key: _projetosKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titutoSecao('Projetos e Participações'),
          const SizedBox(height: 32),
          _cardExperiencia(
            empresa: 'Hackathons Biopark (2 edições)',
            cargo: 'Participante',
            descricao: [
              'Maratonas de programação e inovação com soluções para problemas reais.',
              'Trabalho em equipe multidisciplinar com metodologias ágeis.',
              'Aplicação de lógica de programação em curtos períodos de tempo.',
            ],
          ),
        ],
      ),
    );
  }

  // ── SEÇÃO CONTATO ────────────────────────────────────
  Widget _secaoContato() {
    return Container(
      key: _contatoKey,
      width: double.infinity,
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titutoSecao('Contato'),
          const SizedBox(height: 32),
          _itemContato(Icons.email, 'thiago06storqui@gmail.com'),
          const SizedBox(height: 12),
          _itemContato(Icons.phone, '(45) 98824-4125'),
          const SizedBox(height: 12),
          _itemContato(Icons.location_on, 'Toledo, PR — Linha Aeroporto'),
        ],
      ),
    );
  }

  Widget _itemContato(IconData icone, String texto) {
    return Row(
      children: [
        Icon(icone, color: const Color(0xFF90CAF9), size: 20),
        const SizedBox(width: 12),
        Text(texto, style: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 16)),
      ],
    );
  }

  // ── TÍTULO PADRÃO DE SEÇÃO ───────────────────────────
  Widget _titutoSecao(String titulo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFF90CAF9),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}