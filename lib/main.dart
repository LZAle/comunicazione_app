import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'dizionario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  runApp(const ComunicazioneApp());
}

class ComunicazioneApp extends StatelessWidget {
  const ComunicazioneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunicazione',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7F77DD)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

// ─── DATI ───────────────────────────────────────────────────────────────────

const Map<String, List<String>> baseWords = {
  'soggetto': [
    'Io',
    'Tu',
    'Lui',
    'Lei',
    'Noi',
    'Voi',
    'Tutti',
    'Quello',
    'Quella',
  ],
  'verbo': [
    'voglio',
    'ho bisogno di',
    'sento',
    'sto',
    'posso',
    'devo',
    'vorrei',
    'non voglio',
    'non riesco',
    'capisco',
    'non capisco',
    'chiedo',
    'aspetto',
  ],
  'complemento': [
    'acqua',
    'cibo',
    'medicine',
    'aiuto',
    'il bagno',
    'a casa',
    'il dottore',
    'la famiglia',
    'il telefono',
    'riposare',
    'uscire',
    'compagnia',
  ],
  'aggettivo': [
    'stanco',
    'meglio',
    'male',
    'felice',
    'triste',
    'preoccupato',
    'confuso',
    'solo',
    'pronto',
    'urgente',
    'difficile',
    'importante',
  ],
  'avverbio': [
    'adesso',
    'subito',
    'dopo',
    'domani',
    'sempre',
    'mai',
    'ancora',
    'molto',
    'per favore',
    'grazie',
    'sì',
    'no',
    'forse',
  ],
};

const List<String> baseFrasi = [
  'Ho sete, vorrei dell\'acqua',
  'Ho bisogno di andare al bagno',
  'Mi fa male qualcosa',
  'Voglio chiamare la famiglia',
  'Non mi sento bene oggi',
  'Vorrei riposare un po\'',
  'Grazie per l\'aiuto',
  'Puoi restare con me?',
  'Puoi ripetere più lentamente?',
  'Ho bisogno del medico',
];

const Map<String, Map<String, dynamic>> categorie = {
  'azioni': {
    'label': 'Azioni',
    'icon': Icons.directions_run,
    'parole': [
      'camminare',
      'correre',
      'mangiare',
      'bere',
      'dormire',
      'svegliarsi',
      'alzarsi',
      'sedersi',
      'aprire',
      'chiudere',
      'chiamare',
      'parlare',
      'ascoltare',
      'guardare',
      'aiutare',
      'portare',
      'prendere',
      'dare',
      'andare',
      'venire',
    ],
  },
  'descrizioni': {
    'label': 'Descrizioni',
    'icon': Icons.text_fields,
    'parole': [
      'grande',
      'piccolo',
      'bello',
      'brutto',
      'nuovo',
      'vecchio',
      'alto',
      'basso',
      'lungo',
      'corto',
      'caldo',
      'freddo',
      'veloce',
      'lento',
      'facile',
      'difficile',
      'giusto',
      'sbagliato',
      'importante',
      'urgente',
    ],
  },
  'personale': {
    'label': 'Personale',
    'icon': Icons.person,
    'parole': [
      'io',
      'mio',
      'mia',
      'nome',
      'età',
      'casa',
      'famiglia',
      'compleanno',
      'preferito',
      'abitudine',
      'bisogno',
      'desiderio',
      'paura',
      'speranza',
      'ricordo',
      'salute',
      'umore',
      'carattere',
      'vita',
      'storia',
    ],
  },
  'persone': {
    'label': 'Persone',
    'icon': Icons.group,
    'parole': [
      'mamma',
      'papà',
      'figlio',
      'figlia',
      'nipote',
      'nonno',
      'nonna',
      'fratello',
      'sorella',
      'marito',
      'moglie',
      'amico',
      'medico',
      'infermiera',
      'vicino',
      'collega',
      'insegnante',
      'bambino',
      'adulto',
      'anziano',
    ],
  },
  'domande': {
    'label': 'Domande',
    'icon': Icons.help_outline,
    'parole': [
      'chi',
      'cosa',
      'dove',
      'quando',
      'come',
      'perché',
      'quanto',
      'quale',
      'puoi',
      'posso',
      'hai',
      'ho',
      'è',
      'sono',
      'vuoi',
      'voglio',
      'sai',
      'so',
      'vai',
      'vado',
    ],
  },
  'giochi': {
    'label': 'Giochi',
    'icon': Icons.sports_esports,
    'parole': [
      'giocare',
      'partita',
      'squadra',
      'vincere',
      'perdere',
      'carte',
      'scacchi',
      'puzzle',
      'domino',
      'bingo',
      'tombola',
      'gioco',
      'palla',
      'sport',
      'passatempo',
      'divertimento',
      'tv',
      'film',
      'musica',
      'libro',
    ],
  },
  'salute': {
    'label': 'Corpo e salute',
    'icon': Icons.medical_services,
    'parole': [
      'testa',
      'schiena',
      'stomaco',
      'braccio',
      'gamba',
      'piede',
      'mano',
      'occhio',
      'orecchio',
      'naso',
      'dolore',
      'febbre',
      'tosse',
      'farmaco',
      'dottore',
      'ospedale',
      'visita',
      'sangue',
      'pressione',
      'allergia',
    ],
  },
  'luoghi': {
    'label': 'Luoghi',
    'icon': Icons.place,
    'parole': [
      'casa',
      'ospedale',
      'chiesa',
      'mercato',
      'farmacia',
      'parco',
      'giardino',
      'ristorante',
      'bar',
      'supermercato',
      'banca',
      'posta',
      'strada',
      'piazza',
      'città',
      'paese',
      'stazione',
      'aeroporto',
      'mare',
      'montagna',
    ],
  },
  'colori': {
    'label': 'Colori',
    'icon': Icons.palette,
    'parole': [
      'rosso',
      'blu',
      'verde',
      'giallo',
      'arancione',
      'viola',
      'rosa',
      'bianco',
      'nero',
      'grigio',
      'marrone',
      'beige',
      'azzurro',
      'celeste',
      'bordeaux',
      'oro',
      'argento',
      'turchese',
      'corallo',
      'lilla',
    ],
  },
  'animali': {
    'label': 'Animali',
    'icon': Icons.pets,
    'parole': [
      'cane',
      'gatto',
      'uccello',
      'pesce',
      'coniglio',
      'cavallo',
      'mucca',
      'pecora',
      'gallina',
      'maiale',
      'leone',
      'tigre',
      'elefante',
      'scimmia',
      'serpente',
      'tartaruga',
      'farfalla',
      'ape',
      'topo',
      'volpe',
    ],
  },
  'casa': {
    'label': 'Casa',
    'icon': Icons.home,
    'parole': [
      'cucina',
      'bagno',
      'camera',
      'salotto',
      'letto',
      'sedia',
      'tavolo',
      'finestra',
      'porta',
      'frigorifero',
      'forno',
      'televisione',
      'divano',
      'armadio',
      'lampada',
      'tappeto',
      'cuscino',
      'coperta',
      'doccia',
      'vasca',
    ],
  },
  'comunicazione': {
    'label': 'Comunicazione',
    'icon': Icons.chat_bubble_outline,
    'parole': [
      'sì',
      'no',
      'forse',
      'grazie',
      'prego',
      'scusa',
      'aiuto',
      'aspetta',
      'capisco',
      'non capisco',
      'ancora',
      'lentamente',
      'ripeti',
      'scrivi',
      'leggi',
      'guarda',
      'ascolta',
      'parla',
      'chiama',
      'messaggio',
    ],
  },
  'intrattenimento': {
    'label': 'Intrattenimento',
    'icon': Icons.movie_outlined,
    'parole': [
      'televisione',
      'film',
      'musica',
      'radio',
      'libro',
      'giornale',
      'canzone',
      'concerto',
      'teatro',
      'cinema',
      'fotografia',
      'disegno',
      'pittura',
      'ballo',
      'festa',
      'vacanza',
      'gita',
      'viaggio',
      'notizie',
      'podcast',
    ],
  },
  'lavoro': {
    'label': 'Lavoro',
    'icon': Icons.work_outline,
    'parole': [
      'ufficio',
      'riunione',
      'collega',
      'capo',
      'progetto',
      'computer',
      'telefono',
      'email',
      'documento',
      'firma',
      'stipendio',
      'compito',
      'scadenza',
      'cliente',
      'contratto',
      'pausa',
      'ferie',
      'pensione',
      'carriera',
      'mestiere',
    ],
  },
  'scuola': {
    'label': 'Scuola',
    'icon': Icons.school_outlined,
    'parole': [
      'lezione',
      'compiti',
      'libro',
      'quaderno',
      'penna',
      'matita',
      'zaino',
      'classe',
      'insegnante',
      'voto',
      'esame',
      'interrogazione',
      'ricreazione',
      'mensa',
      'gita',
      'diploma',
      'università',
      'studio',
      'ricerca',
      'biblioteca',
    ],
  },
  'vestiti': {
    'label': 'Vestiti',
    'icon': Icons.checkroom,
    'parole': [
      'camicia',
      'pantaloni',
      'gonna',
      'vestito',
      'giacca',
      'cappotto',
      'scarpe',
      'calze',
      'maglia',
      'maglione',
      'cappello',
      'sciarpa',
      'guanti',
      'pigiama',
      'biancheria',
      'cintura',
      'borsa',
      'occhiali',
      'orologio',
      'anello',
    ],
  },
  'numeri': {
    'label': 'Numeri',
    'icon': Icons.tag,
    'parole': [
      'uno',
      'due',
      'tre',
      'quattro',
      'cinque',
      'sei',
      'sette',
      'otto',
      'nove',
      'dieci',
      'venti',
      'trenta',
      'cento',
      'mille',
      'primo',
      'secondo',
      'terzo',
      'metà',
      'tutto',
      'niente',
    ],
  },
  'hobby': {
    'label': 'Hobby',
    'icon': Icons.favorite_border,
    'parole': [
      'giardinaggio',
      'cucina',
      'lettura',
      'pittura',
      'fotografia',
      'musica',
      'ballo',
      'yoga',
      'meditazione',
      'raccolta',
      'ricamo',
      'maglia',
      'bricolage',
      'scacchi',
      'sudoku',
      'carte',
      'cucito',
      'collezionismo',
      'camminata',
      'nuoto',
    ],
  },
  'vacanze': {
    'label': 'Vacanze',
    'icon': Icons.beach_access,
    'parole': [
      'mare',
      'montagna',
      'campagna',
      'albergo',
      'valigia',
      'passaporto',
      'aereo',
      'treno',
      'macchina',
      'traghetto',
      'spiaggia',
      'piscina',
      'gita',
      'escursione',
      'ristorante',
      'souvenir',
      'mappa',
      'guida',
      'prenotazione',
      'partenza',
    ],
  },
  'soldi': {
    'label': 'Soldi',
    'icon': Icons.euro,
    'parole': [
      'euro',
      'soldi',
      'prezzo',
      'costo',
      'costoso',
      'economico',
      'pagare',
      'comprare',
      'vendere',
      'banca',
      'bancomat',
      'carta',
      'scontrino',
      'sconto',
      'offerta',
      'spesa',
      'risparmio',
      'pensione',
      'bolletta',
      'rata',
    ],
  },
  'tecnologia': {
    'label': 'Tecnologia',
    'icon': Icons.smartphone,
    'parole': [
      'telefono',
      'tablet',
      'computer',
      'internet',
      'wifi',
      'schermo',
      'batteria',
      'caricatore',
      'applicazione',
      'messaggio',
      'chiamata',
      'video',
      'fotografia',
      'email',
      'password',
      'tastiera',
      'mouse',
      'stampante',
      'televisione',
      'telecomando',
    ],
  },
  'trasporti': {
    'label': 'Trasporti',
    'icon': Icons.directions_car,
    'parole': [
      'autobus',
      'treno',
      'macchina',
      'bicicletta',
      'taxi',
      'aereo',
      'traghetto',
      'metro',
      'tram',
      'motorino',
      'ambulanza',
      'fermata',
      'stazione',
      'aeroporto',
      'biglietto',
      'orario',
      'ritardo',
      'corsa',
      'parcheggio',
      'patente',
    ],
  },
};

// ─── COLORI CATEGORIE GRAMMATICALI ──────────────────────────────────────────

const Map<String, Color> catColors = {
  'soggetto': Color(0xFFE6F1FB),
  'verbo': Color(0xFFEEEDFE),
  'complemento': Color(0xFFFAEEDA),
  'aggettivo': Color(0xFFE1F5EE),
  'avverbio': Color(0xFFFCEBEB),
  'preferito': Color(0xFFFBEAF0),
  'categoria': Color(0xFFF1EFE8),
  'dizionario': Color(0xFFE6F1FB),
};
const Map<String, Color> catTextColors = {
  'soggetto': Color(0xFF0C447C),
  'verbo': Color(0xFF3C3489),
  'complemento': Color(0xFF633806),
  'aggettivo': Color(0xFF085041),
  'avverbio': Color(0xFF791F1F),
  'preferito': Color(0xFF72243E),
  'categoria': Color(0xFF444441),
  'dizionario': Color(0xFF0C447C),
};

// ─── HOME SCREEN ─────────────────────────────────────────────────────────────

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Frase costruita
  List<Map<String, String>> frase = [];

  // Schermata corrente
  String mainTab =
      'soggetto'; // soggetto | verbo | complemento | aggettivo | avverbio | frasi
  String? sidePanel; // null | pref | cat | diz
  String? catAperta; // id categoria aperta

  // Dati persistenti
  Map<String, List<String>> extraWords = {};
  Map<String, List<String>> extraCatWords = {};
  List<String> frasi = [...baseFrasi];
  List<String> preferiti = [];

  // Dizionario
  String dizQuery = '';
  Map<String, List<String>> dizResults = {};
  bool dizLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    for (final k in baseWords.keys) extraWords[k] = [];
    for (final k in categorie.keys) extraCatWords[k] = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cercaDiz('');
    });
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      preferiti = prefs.getStringList('preferiti') ?? [];
      frasi = prefs.getStringList('frasi') ?? [...baseFrasi];
      for (final k in baseWords.keys) {
        extraWords[k] = prefs.getStringList('extra_$k') ?? [];
      }
      for (final k in categorie.keys) {
        extraCatWords[k] = prefs.getStringList('extracat_$k') ?? [];
      }
    });
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('preferiti', preferiti);
    await prefs.setStringList('frasi', frasi);
    for (final k in baseWords.keys) {
      await prefs.setStringList('extra_$k', extraWords[k] ?? []);
    }
    for (final k in categorie.keys) {
      await prefs.setStringList('extracat_$k', extraCatWords[k] ?? []);
    }
  }

  void _addWord(String parola, String cat) {
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    if (parola == ultima) return;
    setState(() => frase.add({'parola': parola, 'cat': cat}));
  }

  void _removeWord(int i) => setState(() => frase.removeAt(i));
  void _undo() {
    if (frase.isNotEmpty) setState(() => frase.removeLast());
  }

  void _clear() => setState(() => frase.clear());

  void _mostraGrande() {
    final testo = frase.map((w) => w['parola']!).join(' ');
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                testo,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Chiudi'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cercaDiz(String q) {
    final ql = q.toLowerCase();
    final Map<String, List<String>> res = {
      'sostantivo': [],
      'verbo': [],
      'aggettivo': [],
      'avverbio': [],
    };
    for (final w in dizionarioItaliano) {
      final parola = w['parola']!;
      final tipo = w['tipo']!;
      if (ql.isEmpty || parola.toLowerCase().contains(ql)) {
        res[tipo]?.add(parola);
      }
    }
    res.forEach(
      (k, v) => v.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase())),
    );
    setState(() {
      dizResults = res;
      dizLoading = false;
    });
  }

  // ─── BUILD ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _buildFraseBar(),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildCenter()),
                    const SizedBox(width: 10),
                    _buildSidebar(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildAzioni(),
            ],
          ),
        ),
      ),
    );
  }

  // ─── BARRA FRASE ─────────────────────────────────────────────────────────

  Widget _buildFraseBar() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 56),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: frase.isEmpty
          ? const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'La frase apparirà qui...',
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            )
          : Wrap(
              spacing: 6,
              runSpacing: 6,
              children: frase.asMap().entries.map((e) {
                final i = e.key;
                final w = e.value;
                final cat = w['cat']!;
                return GestureDetector(
                  onTap: () => _removeWord(i),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: catColors[cat] ?? const Color(0xFFF1EFE8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          w['parola']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: catTextColors[cat] ?? Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.close,
                          size: 12,
                          color: (catTextColors[cat] ?? Colors.black87)
                              .withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }

  // ─── CENTRO ──────────────────────────────────────────────────────────────

  Widget _buildCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopNav(),
        const SizedBox(height: 6),
        Expanded(child: _buildContenuto()),
      ],
    );
  }

  Widget _buildTopNav() {
    final tabs = [
      'soggetto',
      'verbo',
      'complemento',
      'aggettivo',
      'avverbio',
      'frasi',
    ];
    final labels = {
      'soggetto': 'Soggetto',
      'verbo': 'Verbo',
      'complemento': 'Complemento',
      'aggettivo': 'Aggettivo',
      'avverbio': 'Avverbio',
      'frasi': 'Frasi prefatte',
    };
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((t) {
          final isActive = sidePanel == null && mainTab == t;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: GestureDetector(
              onTap: () => setState(() {
                mainTab = t;
                sidePanel = null;
                catAperta = null;
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? (catColors[t] ?? const Color(0xFFEAF3DE))
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isActive
                        ? (catTextColors[t] ?? Colors.green).withOpacity(0.4)
                        : Colors.black12,
                  ),
                ),
                child: Text(
                  labels[t]!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isActive
                        ? (catTextColors[t] ?? const Color(0xFF27500A))
                        : Colors.black54,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContenuto() {
    if (sidePanel == 'pref') return _buildPreferiti();
    if (sidePanel == 'cat')
      return catAperta != null ? _buildCatWords() : _buildCatGrid();
    if (sidePanel == 'diz') return _buildDizionario();
    if (mainTab == 'frasi') return _buildFrasi();
    return _buildParole(mainTab);
  }

  // ─── GRIGLIA PAROLE ───────────────────────────────────────────────────────

  Widget _buildParole(String cat) {
    final base = baseWords[cat] ?? [];
    final extra = extraWords[cat] ?? [];
    final all = [...base, ...extra];
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    final cls = CLS[cat] ?? 'soggetto';

    return SingleChildScrollView(
      child: Wrap(
        spacing: 7,
        runSpacing: 7,
        children: [
          ...all.asMap().entries.map((e) {
            final i = e.key;
            final p = e.value;
            final isBase = i < base.length;
            final disabled = p == ultima;
            return _wordChip(
              label: p,
              cat: cls,
              disabled: disabled,
              canDelete: !isBase,
              onTap: () => _addWord(p, cls),
              onDelete: () {
                setState(() {
                  extraWords[cat]!.removeAt(i - base.length);
                });
                _save();
              },
            );
          }),
          _addChip(
            onAdd: (v) {
              setState(() => extraWords[cat]!.add(v));
              _save();
            },
          ),
        ],
      ),
    );
  }

  // ─── FRASI PREFATTE ───────────────────────────────────────────────────────

  Widget _buildFrasi() {
    return Column(
      children: [
        Expanded(
          child: ReorderableListView(
            onReorder: (o, n) {
              setState(() {
                if (n > o) n--;
                final item = frasi.removeAt(o);
                frasi.insert(n, item);
              });
              _save();
            },
            children: frasi.asMap().entries.map((e) {
              final i = e.key;
              final f = e.value;
              return ListTile(
                key: ValueKey(f + i.toString()),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                title: Text(
                  f,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: const Icon(Icons.drag_handle, color: Colors.black26),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: Colors.black38,
                  ),
                  onPressed: () {
                    setState(() => frasi.removeAt(i));
                    _save();
                  },
                ),
                onTap: () => setState(() {
                  frase = [
                    {'parola': f, 'cat': 'preferito'},
                  ];
                }),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        _addRow(
          hint: 'Nuova frase prefatta...',
          onAdd: (v) {
            setState(() => frasi.add(v));
            _save();
          },
          color: const Color(0xFF27500A),
          bg: const Color(0xFFEAF3DE),
          border: const Color(0xFF97C459),
        ),
      ],
    );
  }

  // ─── PREFERITI ────────────────────────────────────────────────────────────

  Widget _buildPreferiti() {
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    return Column(
      children: [
        Expanded(
          child: preferiti.isEmpty
              ? const Center(
                  child: Text(
                    'Nessun preferito. Aggiungine uno.',
                    style: TextStyle(color: Colors.black38),
                  ),
                )
              : ReorderableListView(
                  onReorder: (o, n) {
                    setState(() {
                      if (n > o) n--;
                      final item = preferiti.removeAt(o);
                      preferiti.insert(n, item);
                    });
                    _save();
                  },
                  children: preferiti.asMap().entries.map((e) {
                    final i = e.key;
                    final p = e.value;
                    return ListTile(
                      key: ValueKey(p + i.toString()),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      title: Text(
                        p,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: const Icon(
                        Icons.drag_handle,
                        color: Colors.black26,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          size: 18,
                          color: Colors.black38,
                        ),
                        onPressed: () {
                          setState(() => preferiti.removeAt(i));
                          _save();
                        },
                      ),
                      onTap: p == ultima
                          ? null
                          : () => _addWord(p, 'preferito'),
                    );
                  }).toList(),
                ),
        ),
        const SizedBox(height: 8),
        _addRow(
          hint: 'Aggiungi parola o frase...',
          onAdd: (v) {
            setState(() => preferiti.add(v));
            _save();
          },
          color: const Color(0xFF72243E),
          bg: const Color(0xFFFBEAF0),
          border: const Color(0xFFED93B1),
        ),
      ],
    );
  }

  // ─── CATEGORIE ────────────────────────────────────────────────────────────

  Widget _buildCatGrid() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.2,
      children: categorie.entries.map((e) {
        final id = e.key;
        final data = e.value;
        return GestureDetector(
          onTap: () => setState(() => catAperta = id),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(data['icon'] as IconData, size: 26, color: Colors.black54),
                const SizedBox(height: 6),
                Text(
                  data['label'] as String,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCatWords() {
    final cat = categorie[catAperta!]!;
    final base = cat['parole'] as List<String>;
    final extra = extraCatWords[catAperta!] ?? [];
    final all = [...base, ...extra];
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => catAperta = null),
          child: Row(
            children: [
              const Icon(Icons.arrow_back, size: 16, color: Colors.black45),
              const SizedBox(width: 4),
              Text(
                cat['label'] as String,
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                ...all.asMap().entries.map((e) {
                  final i = e.key;
                  final p = e.value;
                  final isBase = i < base.length;
                  return _wordChip(
                    label: p,
                    cat: 'categoria',
                    disabled: p == ultima,
                    canDelete: !isBase,
                    onTap: () => _addWord(p, 'categoria'),
                    onDelete: () {
                      setState(
                        () => extraCatWords[catAperta!]!.removeAt(
                          i - base.length,
                        ),
                      );
                      _save();
                    },
                  );
                }),
                _addChip(
                  onAdd: (v) {
                    setState(() => extraCatWords[catAperta!]!.add(v));
                    _save();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─── DIZIONARIO ───────────────────────────────────────────────────────────

  Widget _buildDizionario() {
    final tipoLabel = {
      'sostantivo': 'Sostantivi',
      'verbo': 'Verbi',
      'aggettivo': 'Aggettivi',
      'avverbio': 'Avverbi',
    };
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Cerca una parola',
            prefixIcon: const Icon(Icons.search, size: 18),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (v) {
            dizQuery = v;
            _cercaDiz(v);
          },
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: tipoLabel.entries.map((e) {
              final parole = dizResults[e.key] ?? [];
              if (parole.isEmpty) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15, //grandezza tasti dizionario
                      vertical: 10,
                    ),
                    child: Text(
                      e.value,
                      style: const TextStyle(
                        fontSize: 15, //Grandezza testo dizionario
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 2.5,
                    children: parole
                        .map(
                          (p) => GestureDetector(
                            onTap: () => _addWord(p, 'dizionario'),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Text(
                                p,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── SIDEBAR ─────────────────────────────────────────────────────────────

  Widget _buildSidebar() {
    return Column(
      children: [
        _sideBtn(
          'pref',
          Icons.star_border,
          'Preferiti',
          const Color(0xFFFBEAF0),
          const Color(0xFF72243E),
          const Color(0xFFED93B1),
        ),
        const SizedBox(height: 6),
        _sideBtn(
          'cat',
          Icons.grid_view,
          'Categorie',
          const Color(0xFFFAEEDA),
          const Color(0xFF633806),
          const Color(0xFFEF9F27),
        ),
        const SizedBox(height: 6),
        _sideBtn(
          'diz',
          Icons.menu_book_outlined,
          'Dizionario',
          const Color(0xFFE6F1FB),
          const Color(0xFF0C447C),
          const Color(0xFF85B7EB),
        ),
      ],
    );
  }

  Widget _sideBtn(
    String id,
    IconData icon,
    String label,
    Color bg,
    Color fg,
    Color border,
  ) {
    final active = sidePanel == id;
    return GestureDetector(
      onTap: () => setState(() {
        sidePanel = active ? null : id;
        catAperta = null;
      }),
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? bg : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: active ? border : Colors.black12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: active ? fg : Colors.black45),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: active ? fg : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── AZIONI ──────────────────────────────────────────────────────────────

  Widget _buildAzioni() {
    return Row(
      children: [
        _actionBtn(Icons.undo, onTap: _undo),
        const SizedBox(width: 7),
        Expanded(
          child: _actionBtn(Icons.close, label: 'Cancella', onTap: _clear),
        ),
        const SizedBox(width: 7),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: frase.isEmpty ? null : _mostraGrande,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                color: frase.isEmpty
                    ? const Color(0xFFEEEDFE).withOpacity(0.5)
                    : const Color(0xFFEEEDFE),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFAFA9EC)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.visibility_outlined,
                    size: 18,
                    color: Color(0xFF3C3489),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Mostra grande',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: frase.isEmpty
                          ? const Color(0xFF3C3489).withOpacity(0.4)
                          : const Color(0xFF3C3489),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionBtn(
    IconData icon, {
    String? label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 11,
          horizontal: label != null ? 12 : 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: Colors.black54),
            if (label != null) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─── WIDGET HELPER ───────────────────────────────────────────────────────

  Widget _wordChip({
    required String label,
    required String cat,
    required bool disabled,
    required bool canDelete,
    required VoidCallback onTap,
    required VoidCallback onDelete,
  }) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Opacity(
        opacity: disabled ? 0.35 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (canDelete) ...[
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.close,
                    size: 11,
                    color: Colors.black38,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _addChip({required Function(String) onAdd}) {
    return GestureDetector(
      onTap: () => _showAddDialog(onAdd),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black26, style: BorderStyle.solid),
        ),
        child: const Icon(Icons.add, size: 18, color: Colors.black38),
      ),
    );
  }

  void _showAddDialog(Function(String) onAdd) {
    final ctrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aggiungi parola',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Scrivi la parola...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (v) {
                if (v.trim().isNotEmpty) {
                  onAdd(v.trim());
                  Navigator.pop(ctx);
                }
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Annulla'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (ctrl.text.trim().isNotEmpty) {
                      onAdd(ctrl.text.trim());
                      Navigator.pop(ctx);
                    }
                  },
                  child: const Text('Aggiungi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addRow({
    required String hint,
    required Function(String) onAdd,
    required Color color,
    required Color bg,
    required Color border,
  }) {
    final ctrl = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: ctrl,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: border),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (v) {
              if (v.trim().isNotEmpty) {
                onAdd(v.trim());
                ctrl.clear();
              }
            },
          ),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            if (ctrl.text.trim().isNotEmpty) {
              onAdd(ctrl.text.trim());
              ctrl.clear();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: border),
            ),
            child: Icon(Icons.add, size: 20, color: color),
          ),
        ),
      ],
    );
  }
}

const Map<String, String> CLS = {
  'soggetto': 'soggetto',
  'verbo': 'verbo',
  'complemento': 'complemento',
  'aggettivo': 'aggettivo',
  'avverbio': 'avverbio',
};
