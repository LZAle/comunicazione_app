import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D7DD2)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

const Color kBg = Color(0xFFEDF1F7);
const Color kNavBg = Color(0xFFEDF1F7);
const Color kExtraBg = Color(0xFFF7F4EE);
const Color kExtraBorder = Color(0xFFE0D9CC);
const Color kCard = Colors.white;
const Color kBorder = Color(0xFFCDD5E0);
const Color kTextMuted = Color(0xFF7A8899);
const Color kTextMain = Color(0xFF1A2744);
const Color kAccent = Color(0xFF2D7DD2);

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
    'Qualcuno',
    'Nessuno',
    'Ognuno',
    'Mio figlio',
    'Mia figlia',
    'Mia moglie',
    'Mio marito',
    'Il dottore',
    'L\'infermiera',
    'La famiglia',
  ],
  'verbo': [
    'voglio',
    'vorrei',
    'ho bisogno di',
    'ho',
    'non ho',
    'sento',
    'non sento',
    'sto',
    'non sto bene',
    'mi fa male',
    'posso',
    'non posso',
    'devo',
    'non devo',
    'riesco',
    'non riesco',
    'capisco',
    'non capisco',
    'chiedo',
    'aspetto',
    'vado',
    'vengo',
    'mangio',
    'bevo',
    'dormo',
    'mi sveglio',
    'mi alzo',
    'mi siedo',
    'chiamo',
    'ringrazio',
    'preferisco',
    'ricordo',
    'penso',
  ],
  'complemento': [
    'acqua',
    'caffè',
    'tè',
    'succo',
    'cibo',
    'qualcosa da mangiare',
    'medicine',
    'il dottore',
    'l\'infermiera',
    'aiuto',
    'il bagno',
    'a casa',
    'la famiglia',
    'il telefono',
    'riposare',
    'dormire',
    'uscire',
    'compagnia',
    'silenzio',
    'musica',
    'la televisione',
    'un libro',
    'il giornale',
    'qualcosa di caldo',
    'qualcosa di freddo',
    'una coperta',
    'un cuscino',
  ],
  'aggettivo': [
    'stanco',
    'riposato',
    'meglio',
    'peggio',
    'bene',
    'male',
    'felice',
    'triste',
    'preoccupato',
    'tranquillo',
    'agitato',
    'confuso',
    'lucido',
    'solo',
    'pronto',
    'occupato',
    'urgente',
    'importante',
    'difficile',
    'facile',
    'caldo',
    'freddo',
    'dolorante',
    'a disagio',
    'comodo',
    'affamato',
    'assetato',
    'assonnato',
    'annoiato',
    'contento',
  ],
  'avverbio': [
    'sì',
    'no',
    'non',
    'forse',
    'non lo so',
    'adesso',
    'subito',
    'dopo',
    'più tardi',
    'domani',
    'oggi',
    'sempre',
    'mai',
    'spesso',
    'a volte',
    'ancora',
    'già',
    'molto',
    'poco',
    'abbastanza',
    'troppo',
    'qui',
    'là',
    'vicino',
    'lontano',
    'per favore',
    'grazie',
    'prego',
    'scusa',
    'piano',
    'forte',
    'lentamente',
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
  'Ho freddo, mi serve una coperta',
  'Ho caldo',
  'Non ho appetito',
  'Vorrei un po\' di compagnia',
  'Sto meglio, grazie',
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
    'label': 'Salute',
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

const Map<String, Color> catBg = {
  'soggetto': Color(0xFFDCEEFD),
  'verbo': Color(0xFFE5E3FD),
  'complemento': Color(0xFFFEEDD4),
  'aggettivo': Color(0xFFD4F0E5),
  'avverbio': Color(0xFFFFE0E0),
  'preferito': Color(0xFFFFE0EF),
  'categoria': Color(0xFFEDEBE3),
  'dizionario': Color(0xFFDCEEFD),
};
const Map<String, Color> catFg = {
  'soggetto': Color(0xFF0C447C),
  'verbo': Color(0xFF3C3489),
  'complemento': Color(0xFF633806),
  'aggettivo': Color(0xFF085041),
  'avverbio': Color(0xFF791F1F),
  'preferito': Color(0xFF72243E),
  'categoria': Color(0xFF444441),
  'dizionario': Color(0xFF0C447C),
};
const Map<String, Color> catBorder = {
  'soggetto': Color(0xFF9AC6EF),
  'verbo': Color(0xFFABA6E9),
  'complemento': Color(0xFFEFBA7A),
  'aggettivo': Color(0xFF7DD4B0),
  'avverbio': Color(0xFFEFA0A0),
  'preferito': Color(0xFFEFA0C0),
  'categoria': Color(0xFFCCC9BE),
  'dizionario': Color(0xFF9AC6EF),
};
const Map<String, String> CLS = {
  'soggetto': 'soggetto',
  'verbo': 'verbo',
  'complemento': 'complemento',
  'aggettivo': 'aggettivo',
  'avverbio': 'avverbio',
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> frase = [];
  String mainTab = 'soggetto';
  String? sidePanel;
  String? catAperta;

  Map<String, List<String>> extraWords = {};
  Map<String, List<String>> extraCatWords = {};
  Map<String, List<String>> wordOrder = {}; // ordine completo per ogni tab
  List<String> frasi = [...baseFrasi];
  List<String> preferiti = [];
  List<String> dizTutte = [];

  final TextEditingController _fraseCtrl = TextEditingController();
  final FocusNode _fraseFocus = FocusNode();
  bool _editMode = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    for (final k in baseWords.keys) extraWords[k] = [];
    for (final k in baseWords.keys) wordOrder[k] = [];
    for (final k in categorie.keys) extraCatWords[k] = [];
    WidgetsBinding.instance.addPostFrameCallback((_) => _cercaDiz(''));
  }

  @override
  void dispose() {
    _fraseCtrl.dispose();
    _fraseFocus.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      preferiti = prefs.getStringList('preferiti') ?? [];
      frasi = prefs.getStringList('frasi') ?? [...baseFrasi];
      for (final k in baseWords.keys)
        extraWords[k] = prefs.getStringList('extra_$k') ?? [];
      for (final k in baseWords.keys)
        wordOrder[k] = prefs.getStringList('order_$k') ?? [];
      for (final k in categorie.keys)
        extraCatWords[k] = prefs.getStringList('extracat_$k') ?? [];
    });
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('preferiti', preferiti);
    await prefs.setStringList('frasi', frasi);
    for (final k in baseWords.keys)
      await prefs.setStringList('extra_$k', extraWords[k] ?? []);
    for (final k in baseWords.keys)
      await prefs.setStringList('order_$k', wordOrder[k] ?? []);
    for (final k in categorie.keys)
      await prefs.setStringList('extracat_$k', extraCatWords[k] ?? []);
  }

  String get _testoFrase => frase.map((w) => w['parola']!).join(' ');

  void _addWord(String parola, String cat) {
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    if (parola == ultima) return;
    if (_editMode) _chiudiEdit();
    setState(() => frase.add({'parola': parola, 'cat': cat}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _fraseCtrl.text = _testoFrase);
    });
  }

  void _undo() {
    if (_editMode) _chiudiEdit();
    if (frase.isNotEmpty)
      setState(() {
        frase.removeLast();
        _fraseCtrl.text = _testoFrase;
      });
  }

  void _clear() {
    _chiudiEdit();
    setState(() {
      frase.clear();
      _fraseCtrl.clear();
    });
  }

  void _attivaEdit() {
    setState(() {
      _editMode = true;
      _fraseCtrl.text = _testoFrase;
    });
    _fraseFocus.requestFocus();
  }

  void _chiudiEdit() {
    FocusManager.instance.primaryFocus?.unfocus();
    final t = _fraseCtrl.text.trim();
    setState(() {
      _editMode = false;
      if (t.isNotEmpty && t != _testoFrase) {
        frase = [
          {'parola': t, 'cat': 'preferito'},
        ];
      } else if (t.isEmpty) {
        frase.clear();
      }
      _fraseCtrl.text = _testoFrase;
    });
  }

  void _mostraGrande() {
    if (_editMode) _chiudiEdit();
    final testo = _fraseCtrl.text.trim().isNotEmpty
        ? _fraseCtrl.text.trim()
        : _testoFrase;
    if (testo.isEmpty) return;
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                testo,
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w700,
                  color: kTextMain,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Chiudi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cercaDiz(String q) {
    final ql = q.toLowerCase();
    final List<String> tutte = dizionarioItaliano
        .map((w) => w['parola']!)
        .where((p) => ql.isEmpty || p.toLowerCase().contains(ql))
        .toList();
    tutte.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    setState(() => dizTutte = tutte);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    // La scelta si basa sull'altezza disponibile, non sul tipo di dispositivo.
    // Schermo basso (orizzontale su telefono) -> azioni compatte nella nav.
    // Schermo alto -> barra azioni grande in fondo.
    final isShort = mq.size.height < 500;

    return GestureDetector(
      onTap: () {
        if (_editMode) _chiudiEdit();
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        backgroundColor: kBg,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              _buildFraseBar(),
              _buildExtraZone(),
              _buildNavZone(isShort),
              Expanded(child: _buildContenuto()),
              _buildAzioni(isShort),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFraseBar() {
    return GestureDetector(
      onTap: _attivaEdit,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 80),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: kCard,
          border: Border(bottom: BorderSide(color: kBorder)),
        ),
        child: _editMode
            ? TextField(
                controller: _fraseCtrl,
                focusNode: _fraseFocus,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kTextMain,
                  height: 1.4,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Scrivi qui...',
                  hintStyle: TextStyle(
                    color: kTextMuted,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                maxLines: null,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _chiudiEdit(),
              )
            : frase.isEmpty
            ? const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tocca per scrivere, o scegli le parole sotto.',
                  style: TextStyle(color: kTextMuted, fontSize: 17),
                ),
              )
            : Text(
                _testoFrase,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kTextMain,
                  height: 1.4,
                ),
              ),
      ),
    );
  }

  Widget _buildExtraZone() {
    return Container(
      color: kExtraBg,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Row(
        children: [
          _extraBtn(
            'pref',
            Icons.star_rounded,
            'Preferiti',
            const Color(0xFFFFF0F6),
            const Color(0xFF72243E),
            const Color(0xFFEFA0C0),
          ),
          const SizedBox(width: 8),
          _extraBtn(
            'cat',
            Icons.grid_view_rounded,
            'Categorie',
            const Color(0xFFFFF8EE),
            const Color(0xFF633806),
            const Color(0xFFEFBA7A),
          ),
          const SizedBox(width: 8),
          _extraBtn(
            'diz',
            Icons.menu_book_rounded,
            'Dizionario',
            const Color(0xFFEEF5FD),
            const Color(0xFF0C447C),
            const Color(0xFF9AC6EF),
          ),
        ],
      ),
    );
  }

  Widget _extraBtn(
    String id,
    IconData icon,
    String label,
    Color bg,
    Color fg,
    Color border,
  ) {
    final active = sidePanel == id;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          sidePanel = active ? null : id;
          catAperta = null;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? bg : kCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: active ? border : kBorder),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 22, color: active ? fg : kTextMuted),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: active ? fg : kTextMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Nav zone: su tablet le azioni stanno qui affianco a Frasi
  Widget _buildNavZone(bool isShort) {
    final tabs = [
      ('soggetto', 'Soggetto'),
      ('verbo', 'Verbo'),
      ('complemento', 'Complemento'),
      ('aggettivo', 'Aggettivo'),
      ('avverbio', 'Avverbio'),
    ];

    final tabWidgets = tabs.map((t) {
      final isActive = sidePanel == null && mainTab == t.$1;
      return GestureDetector(
        key: ValueKey(t.$1),
        onTap: () => setState(() {
          mainTab = t.$1;
          sidePanel = null;
          catAperta = null;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: isActive ? (catBg[t.$1] ?? kCard) : kCard,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isActive ? (catBorder[t.$1] ?? kAccent) : kBorder,
            ),
          ),
          child: Text(
            t.$2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isActive ? (catFg[t.$1] ?? kAccent) : kTextMuted,
            ),
          ),
        ),
      );
    }).toList();

    // Tab "Frasi"
    final frasiActive = sidePanel == null && mainTab == 'frasi';
    final frasiTab = GestureDetector(
      onTap: () => setState(() {
        mainTab = 'frasi';
        sidePanel = null;
        catAperta = null;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: frasiActive ? const Color(0xFFEDEBE3) : kCard,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: frasiActive ? const Color(0xFFCCC9BE) : kBorder,
          ),
        ),
        child: Text(
          'Frasi',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: frasiActive ? const Color(0xFF444441) : kTextMuted,
          ),
        ),
      ),
    );

    // Schermo basso -> icone azioni compatte affianco a Frasi
    final showCompact = isShort;

    return Container(
      color: kNavBg,
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
      child: showCompact
          ? Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final w in tabWidgets) ...[
                          w,
                          const SizedBox(width: 6),
                        ],
                        frasiTab,
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _azioneIcona(Icons.undo_rounded, _undo),
                const SizedBox(width: 6),
                _azioneIcona(Icons.close_rounded, _clear),
                const SizedBox(width: 6),
                _azioneIcona(
                  Icons.visibility_rounded,
                  _mostraGrande,
                  accent: true,
                ),
              ],
            )
          : Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [...tabWidgets, frasiTab],
            ),
    );
  }

  Widget _azioneIcona(
    IconData icon,
    VoidCallback onTap, {
    bool accent = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: accent ? kAccent : kCard,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: accent ? kAccent : kBorder),
        ),
        child: Icon(icon, size: 20, color: accent ? Colors.white : kTextMuted),
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

  Widget _buildParole(String cat) {
    final base = baseWords[cat] ?? [];
    final extra = extraWords[cat] ?? [];
    // Se esiste un ordine salvato e contiene tutte le parole, usalo
    // altrimenti usa base + extra
    final savedOrder = wordOrder[cat] ?? [];
    final allParole = [...base, ...extra];
    List<String> all;
    if (savedOrder.isNotEmpty &&
        savedOrder.length == allParole.length &&
        savedOrder.toSet().containsAll(allParole.toSet())) {
      all = savedOrder;
    } else {
      all = allParole;
    }

    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    final cls = CLS[cat] ?? 'soggetto';

    return ReorderableGridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 52,
      ),
      itemCount: all.length + 1,
      onReorder: (oldIndex, newIndex) {
        if (oldIndex >= all.length || newIndex > all.length) return;
        if (newIndex > oldIndex) newIndex--;
        setState(() {
          final newOrder = [...all];
          final item = newOrder.removeAt(oldIndex);
          newOrder.insert(newIndex, item);
          wordOrder[cat] = newOrder;
          // Aggiorna anche extraWords in base al nuovo ordine
          extraWords[cat] = newOrder.where((p) => !base.contains(p)).toList();
        });
        _save();
      },
      itemBuilder: (context, i) {
        if (i == all.length) {
          return _addChip(
            key: const ValueKey('__add__'),
            onAdd: (v) {
              setState(() {
                extraWords[cat]!.add(v);
                wordOrder[cat] = [...all, v];
              });
              _save();
            },
          );
        }
        final p = all[i];
        final isBase = base.contains(p);
        return _wordChip(
          key: ValueKey('$cat\_$i\_$p'),
          label: p,
          cat: cls,
          disabled: p == ultima,
          canDelete: !isBase,
          onTap: () => _addWord(p, cls),
          onDelete: () {
            setState(() {
              extraWords[cat]!.remove(p);
              wordOrder[cat] = [...all]..remove(p);
            });
            _save();
          },
        );
      },
    );
  }

  Widget _buildFrasi() {
    return Column(
      children: [
        Expanded(
          child: ReorderableListView(
            padding: const EdgeInsets.all(10),
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
              return Container(
                key: ValueKey(f + i.toString()),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: kCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kBorder),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  title: Text(
                    f,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: kTextMain,
                    ),
                  ),
                  leading: const Icon(
                    Icons.drag_handle,
                    color: kTextMuted,
                    size: 26,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 24,
                      color: kTextMuted,
                    ),
                    onPressed: () {
                      setState(() => frasi.removeAt(i));
                      _save();
                    },
                  ),
                  onTap: () {
                    if (_editMode) _chiudiEdit();
                    setState(() {
                      frase = [
                        {'parola': f, 'cat': 'preferito'},
                      ];
                      _fraseCtrl.text = f;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: _addRow(
            hint: 'Nuova frase prefatta...',
            onAdd: (v) {
              setState(() => frasi.add(v));
              _save();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPreferiti() {
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    return Column(
      children: [
        Expanded(
          child: preferiti.isEmpty
              ? const Center(
                  child: Text(
                    'Nessun preferito ancora.',
                    style: TextStyle(color: kTextMuted, fontSize: 17),
                  ),
                )
              : ReorderableListView(
                  padding: const EdgeInsets.all(10),
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
                    return Container(
                      key: ValueKey(p + i.toString()),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: kCard,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kBorder),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        title: Text(
                          p,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: kTextMain,
                          ),
                        ),
                        leading: const Icon(
                          Icons.drag_handle,
                          color: kTextMuted,
                          size: 26,
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            size: 24,
                            color: kTextMuted,
                          ),
                          onPressed: () {
                            setState(() => preferiti.removeAt(i));
                            _save();
                          },
                        ),
                        onTap: p == ultima
                            ? null
                            : () => _addWord(p, 'preferito'),
                      ),
                    );
                  }).toList(),
                ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: _addRow(
            hint: 'Aggiungi parola o frase...',
            onAdd: (v) {
              setState(() => preferiti.add(v));
              _save();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCatGrid() {
    return GridView.count(
      padding: const EdgeInsets.all(12),
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.05,
      children: categorie.entries.map((e) {
        final id = e.key;
        final data = e.value;
        return GestureDetector(
          onTap: () => setState(() => catAperta = id),
          child: Container(
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: kBorder),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    data['icon'] as IconData,
                    size: 28,
                    color: kAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    data['label'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: kTextMain,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
          child: GestureDetector(
            onTap: () => setState(() => catAperta = null),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: kCard,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kBorder),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: kTextMuted,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  cat['label'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kTextMain,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReorderableGridView.builder(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 52,
            ),
            itemCount: all.length + 1,
            onReorder: (o, n) {
              if (o >= all.length || n > all.length) return;
              if (n > o) n--;
              setState(() {
                final combined = [...base, ...extraCatWords[catAperta!]!];
                final item = combined.removeAt(o);
                combined.insert(n, item);
                extraCatWords[catAperta!] = combined.sublist(base.length);
              });
              _save();
            },
            itemBuilder: (context, i) {
              if (i == all.length) {
                return _addChip(
                  key: const ValueKey('__add__'),
                  onAdd: (v) {
                    setState(() => extraCatWords[catAperta!]!.add(v));
                    _save();
                  },
                );
              }
              final p = all[i];
              final isBase = i < base.length;
              return _wordChip(
                key: ValueKey('cat_$i\_$p'),
                label: p,
                cat: 'categoria',
                disabled: p == ultima,
                canDelete: !isBase,
                onTap: () => _addWord(p, 'categoria'),
                onDelete: () {
                  setState(
                    () => extraCatWords[catAperta!]!.removeAt(i - base.length),
                  );
                  _save();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDizionario() {
    final ultima = frase.isNotEmpty ? frase.last['parola'] : null;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Container(
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kBorder),
            ),
            child: TextField(
              style: const TextStyle(fontSize: 16, color: kTextMain),
              decoration: const InputDecoration(
                hintText: 'Cerca una parola...',
                hintStyle: TextStyle(color: kTextMuted),
                prefixIcon: Icon(Icons.search, size: 20, color: kTextMuted),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 13),
              ),
              onChanged: (v) => _cercaDiz(v),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: dizTutte
                  .map(
                    (p) => GestureDetector(
                      onTap: p == ultima
                          ? null
                          : () => _addWord(p, 'dizionario'),
                      child: Opacity(
                        opacity: p == ultima ? 0.3 : 1.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCEEFD),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF9AC6EF).withOpacity(0.6),
                            ),
                          ),
                          child: Text(
                            p,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0C447C),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAzioni(bool isShort) {
    // Schermo basso: le icone sono già nella nav, niente barra in fondo
    if (isShort) return const SizedBox.shrink();
    // Portrait: barra azioni in fondo grande
    final hasTesto =
        frase.isNotEmpty || (_editMode && _fraseCtrl.text.trim().isNotEmpty);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
      decoration: BoxDecoration(
        color: kCard,
        border: Border(top: BorderSide(color: kBorder)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _undo,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      color: kBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kBorder),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.undo_rounded, size: 18, color: kTextMuted),
                        SizedBox(width: 6),
                        Text(
                          'Annulla',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kTextMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: _clear,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      color: kBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kBorder),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close_rounded, size: 18, color: kTextMuted),
                        SizedBox(width: 6),
                        Text(
                          'Cancella',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kTextMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: hasTesto ? _mostraGrande : null,
            child: AnimatedOpacity(
              opacity: hasTesto ? 1.0 : 0.38,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: kAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: hasTesto
                      ? [
                          BoxShadow(
                            color: kAccent.withOpacity(0.35),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.visibility_rounded,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Mostra grande',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _wordChip({
    required Key key,
    required String label,
    required String cat,
    required bool disabled,
    required bool canDelete,
    required VoidCallback onTap,
    required VoidCallback onDelete,
  }) {
    return GestureDetector(
      key: key,
      onTap: disabled ? null : onTap,
      child: AnimatedOpacity(
        opacity: disabled ? 0.3 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          padding: EdgeInsets.only(
            left: 14,
            top: 10,
            bottom: 10,
            right: canDelete ? 6 : 14,
          ),
          decoration: BoxDecoration(
            color: catBg[cat] ?? const Color(0xFFEDEBE3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: (catBorder[cat] ?? Colors.grey).withOpacity(0.6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: catFg[cat] ?? kTextMain,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (canDelete) ...[
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: (catFg[cat] ?? kTextMain).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: (catFg[cat] ?? kTextMain).withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _addChip({required Key key, required Function(String) onAdd}) {
    return GestureDetector(
      key: key,
      onTap: () => _showAddDialog(onAdd),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kBorder),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 20, color: kTextMuted),
            SizedBox(width: 4),
            Text(
              'Aggiungi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kTextMuted,
              ),
            ),
          ],
        ),
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 28,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aggiungi parola',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kTextMain,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ctrl,
              autofocus: true,
              style: const TextStyle(fontSize: 18, color: kTextMain),
              decoration: InputDecoration(
                hintText: 'Scrivi la parola...',
                hintStyle: const TextStyle(color: kTextMuted),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: kBorder),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onSubmitted: (v) {
                if (v.trim().isNotEmpty) {
                  onAdd(v.trim());
                  Navigator.pop(ctx);
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text(
                    'Annulla',
                    style: TextStyle(fontSize: 16, color: kTextMuted),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (ctrl.text.trim().isNotEmpty) {
                      onAdd(ctrl.text.trim());
                      Navigator.pop(ctx);
                    }
                  },
                  child: const Text(
                    'Aggiungi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addRow({required String hint, required Function(String) onAdd}) {
    final ctrl = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kBorder),
            ),
            child: TextField(
              controller: ctrl,
              style: const TextStyle(fontSize: 16, color: kTextMain),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: kTextMuted),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onSubmitted: (v) {
                if (v.trim().isNotEmpty) {
                  onAdd(v.trim());
                  ctrl.clear();
                }
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            if (ctrl.text.trim().isNotEmpty) {
              onAdd(ctrl.text.trim());
              ctrl.clear();
            }
          },
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: kAccent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.add, size: 24, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
