import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt'),
    Locale('en'),
  ];

  /// No description provided for @splashSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Diversão + Algoritmos'**
  String get splashSubtitle;

  /// No description provided for @loading.
  ///
  /// In pt, this message translates to:
  /// **'Carregando...'**
  String get loading;

  /// No description provided for @splashFooter.
  ///
  /// In pt, this message translates to:
  /// **'v0.1 • módulo Mochila'**
  String get splashFooter;

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'APA Learn'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In pt, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @portuguese.
  ///
  /// In pt, this message translates to:
  /// **'Português'**
  String get portuguese;

  /// No description provided for @english.
  ///
  /// In pt, this message translates to:
  /// **'Inglês'**
  String get english;

  /// No description provided for @version.
  ///
  /// In pt, this message translates to:
  /// **'Versão'**
  String get version;

  /// No description provided for @updateTitle.
  ///
  /// In pt, this message translates to:
  /// **'Atualização necessária'**
  String get updateTitle;

  /// No description provided for @updateMessage.
  ///
  /// In pt, this message translates to:
  /// **'Uma nova versão do app já está disponível com melhorias e correções importantes.\n\nPara continuar usando, atualize agora pela loja.'**
  String get updateMessage;

  /// No description provided for @updateButton.
  ///
  /// In pt, this message translates to:
  /// **'Atualizar agora'**
  String get updateButton;

  /// No description provided for @updateLater.
  ///
  /// In pt, this message translates to:
  /// **'Depois'**
  String get updateLater;

  /// No description provided for @updateIgnore.
  ///
  /// In pt, this message translates to:
  /// **'Ignorar'**
  String get updateIgnore;

  /// No description provided for @modules.
  ///
  /// In pt, this message translates to:
  /// **'Módulos'**
  String get modules;

  /// No description provided for @homeHeroSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Aprenda algoritmos como um jogos'**
  String get homeHeroSubtitle;

  /// No description provided for @xpLabel.
  ///
  /// In pt, this message translates to:
  /// **'XP'**
  String get xpLabel;

  /// No description provided for @rankLabel.
  ///
  /// In pt, this message translates to:
  /// **'Rank'**
  String get rankLabel;

  /// No description provided for @difficultyEasy.
  ///
  /// In pt, this message translates to:
  /// **'Fácil'**
  String get difficultyEasy;

  /// No description provided for @difficultyMedium.
  ///
  /// In pt, this message translates to:
  /// **'Médio'**
  String get difficultyMedium;

  /// No description provided for @difficultyHard.
  ///
  /// In pt, this message translates to:
  /// **'Difícil'**
  String get difficultyHard;

  /// No description provided for @btnGuide.
  ///
  /// In pt, this message translates to:
  /// **'Guia'**
  String get btnGuide;

  /// No description provided for @btnPlay.
  ///
  /// In pt, this message translates to:
  /// **'Jogar'**
  String get btnPlay;

  /// No description provided for @knapsackTitle.
  ///
  /// In pt, this message translates to:
  /// **'Problema da Mochila'**
  String get knapsackTitle;

  /// No description provided for @knapsackSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Escolha itens e maximize o valor sem estourar a capacidade.'**
  String get knapsackSubtitle;

  /// No description provided for @tspTitle.
  ///
  /// In pt, this message translates to:
  /// **'Problema do Caixeiro Viajante'**
  String get tspTitle;

  /// No description provided for @tspSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Encontre o menor caminho para visitar todas as cidades e voltar ao início.'**
  String get tspSubtitle;

  /// No description provided for @knapsackIntroAppBarTitle.
  ///
  /// In pt, this message translates to:
  /// **'Problema da Mochila'**
  String get knapsackIntroAppBarTitle;

  /// No description provided for @knapsackIntroChooseDifficulty.
  ///
  /// In pt, this message translates to:
  /// **'Escolha sua dificuldade'**
  String get knapsackIntroChooseDifficulty;

  /// No description provided for @knapsackIntroStartMission.
  ///
  /// In pt, this message translates to:
  /// **'Começar missão'**
  String get knapsackIntroStartMission;

  /// No description provided for @knapsackIntroHintBeginner.
  ///
  /// In pt, this message translates to:
  /// **'Dica: foque em itens com alto valor e baixo peso.'**
  String get knapsackIntroHintBeginner;

  /// No description provided for @knapsackIntroHintIntermediate.
  ///
  /// In pt, this message translates to:
  /// **'Dica: nem sempre o maior valor vence. Pense na combinação.'**
  String get knapsackIntroHintIntermediate;

  /// No description provided for @knapsackIntroHintAdvanced.
  ///
  /// In pt, this message translates to:
  /// **'Dica: maximize eficiência (valor/peso).'**
  String get knapsackIntroHintAdvanced;

  /// No description provided for @knapsackIntroHeaderText.
  ///
  /// In pt, this message translates to:
  /// **'Escolha itens com peso e valor.\nMaximize o valor sem estourar a capacidade.'**
  String get knapsackIntroHeaderText;

  /// No description provided for @capacityCardTitle.
  ///
  /// In pt, this message translates to:
  /// **'Capacidade da mochila'**
  String get capacityCardTitle;

  /// No description provided for @capacityCardSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Ajuste a capacidade para o desafio ficar do seu jeito.'**
  String get capacityCardSubtitle;

  /// No description provided for @difficultyTagItems.
  ///
  /// In pt, this message translates to:
  /// **'Itens: até {count}'**
  String difficultyTagItems(int count);

  /// No description provided for @difficultyTagCapacity.
  ///
  /// In pt, this message translates to:
  /// **'Cap.: {min}-{max}'**
  String difficultyTagCapacity(int min, int max);

  /// No description provided for @difficultyTagHints.
  ///
  /// In pt, this message translates to:
  /// **'Dicas'**
  String get difficultyTagHints;

  /// No description provided for @difficultyTagTimer.
  ///
  /// In pt, this message translates to:
  /// **'Tempo'**
  String get difficultyTagTimer;

  /// No description provided for @valueLabel.
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String valueLabel(int value);

  /// No description provided for @weightLabel.
  ///
  /// In pt, this message translates to:
  /// **'Peso: {used} / {capacity}'**
  String weightLabel(int used, int capacity);

  /// No description provided for @knapsackBoardingTitle.
  ///
  /// In pt, this message translates to:
  /// **'Problema da Mochila'**
  String get knapsackBoardingTitle;

  /// No description provided for @knapsackBoardingSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Você é um explorador e encontrou tesouros! Mas sua mochila tem limite de peso.'**
  String get knapsackBoardingSubtitle;

  /// No description provided for @knapsackBoardingHighlight.
  ///
  /// In pt, this message translates to:
  /// **'Escolha os itens certos para maximizar seu tesouro!'**
  String get knapsackBoardingHighlight;

  /// No description provided for @knapsackBoardingObjectiveTitle.
  ///
  /// In pt, this message translates to:
  /// **'Objetivo'**
  String get knapsackBoardingObjectiveTitle;

  /// No description provided for @knapsackBoardingObjectiveText.
  ///
  /// In pt, this message translates to:
  /// **'Selecione itens para colocar na mochila respeitando o limite de peso e maximizando o valor total!'**
  String get knapsackBoardingObjectiveText;

  /// No description provided for @knapsackBoardingPillWeight.
  ///
  /// In pt, this message translates to:
  /// **'Peso Limite'**
  String get knapsackBoardingPillWeight;

  /// No description provided for @knapsackBoardingPillValue.
  ///
  /// In pt, this message translates to:
  /// **'Valor Máximo'**
  String get knapsackBoardingPillValue;

  /// No description provided for @knapsackBoardingCta.
  ///
  /// In pt, this message translates to:
  /// **'Começar Aventura'**
  String get knapsackBoardingCta;

  /// No description provided for @knapsackDifficultyBeginnerTitle.
  ///
  /// In pt, this message translates to:
  /// **'Iniciante'**
  String get knapsackDifficultyBeginnerTitle;

  /// No description provided for @knapsackDifficultyBeginnerSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Poucos itens, dicas e sem pressão.'**
  String get knapsackDifficultyBeginnerSubtitle;

  /// No description provided for @knapsackDifficultyIntermediateTitle.
  ///
  /// In pt, this message translates to:
  /// **'Intermediário'**
  String get knapsackDifficultyIntermediateTitle;

  /// No description provided for @knapsackDifficultyIntermediateSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Mais itens e escolhas mais difíceis.'**
  String get knapsackDifficultyIntermediateSubtitle;

  /// No description provided for @knapsackDifficultyAdvancedTitle.
  ///
  /// In pt, this message translates to:
  /// **'Avançado'**
  String get knapsackDifficultyAdvancedTitle;

  /// No description provided for @knapsackDifficultyAdvancedSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Desafio real: mais itens e menos dicas.'**
  String get knapsackDifficultyAdvancedSubtitle;

  /// No description provided for @knapsackItemCoin.
  ///
  /// In pt, this message translates to:
  /// **'Moeda'**
  String get knapsackItemCoin;

  /// No description provided for @knapsackItemGem.
  ///
  /// In pt, this message translates to:
  /// **'Gema'**
  String get knapsackItemGem;

  /// No description provided for @knapsackItemBook.
  ///
  /// In pt, this message translates to:
  /// **'Livro'**
  String get knapsackItemBook;

  /// No description provided for @knapsackItemPhone.
  ///
  /// In pt, this message translates to:
  /// **'Celular'**
  String get knapsackItemPhone;

  /// No description provided for @knapsackItemWatch.
  ///
  /// In pt, this message translates to:
  /// **'Relógio'**
  String get knapsackItemWatch;

  /// No description provided for @knapsackItemTablet.
  ///
  /// In pt, this message translates to:
  /// **'Tablet'**
  String get knapsackItemTablet;

  /// No description provided for @knapsackItemKindle.
  ///
  /// In pt, this message translates to:
  /// **'Kindle'**
  String get knapsackItemKindle;

  /// No description provided for @knapsackItemHeadphone.
  ///
  /// In pt, this message translates to:
  /// **'Fone'**
  String get knapsackItemHeadphone;

  /// No description provided for @knapsackItemVR.
  ///
  /// In pt, this message translates to:
  /// **'VR'**
  String get knapsackItemVR;

  /// No description provided for @knapsackItemConsole.
  ///
  /// In pt, this message translates to:
  /// **'Console'**
  String get knapsackItemConsole;

  /// No description provided for @knapsackGuideTitle.
  ///
  /// In pt, this message translates to:
  /// **'Guia: Problema da Mochila'**
  String get knapsackGuideTitle;

  /// No description provided for @context.
  ///
  /// In pt, this message translates to:
  /// **'Contexto'**
  String get context;

  /// No description provided for @whyHard.
  ///
  /// In pt, this message translates to:
  /// **'Por que é difícil?'**
  String get whyHard;

  /// No description provided for @howBecomesGame.
  ///
  /// In pt, this message translates to:
  /// **'Como vira um jogo?'**
  String get howBecomesGame;

  /// No description provided for @commonAlgorithms.
  ///
  /// In pt, this message translates to:
  /// **'Algoritmos comuns'**
  String get commonAlgorithms;

  /// No description provided for @knapsackGuideContextText.
  ///
  /// In pt, this message translates to:
  /// **'Imagine que você vai viajar e só pode levar uma mochila com limite de peso. Cada item tem peso e valor. O objetivo é maximizar o valor sem ultrapassar a capacidade.'**
  String get knapsackGuideContextText;

  /// No description provided for @knapsackGuideWhyHardText.
  ///
  /// In pt, this message translates to:
  /// **'Testar todas as combinações cresce exponencialmente. Por isso é considerado NP-hard.'**
  String get knapsackGuideWhyHardText;

  /// No description provided for @knapsackGuideHowGameText.
  ///
  /// In pt, this message translates to:
  /// **'Você arrasta itens para a mochila. Tente chegar o mais próximo possível do valor ótimo. Níveis mais difíceis podem ter tempo e menos dicas.'**
  String get knapsackGuideHowGameText;

  /// No description provided for @greedyTitle.
  ///
  /// In pt, this message translates to:
  /// **'Guloso'**
  String get greedyTitle;

  /// No description provided for @greedySubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Rápido, mas pode não achar o ótimo'**
  String get greedySubtitle;

  /// No description provided for @greedyBullet1.
  ///
  /// In pt, this message translates to:
  /// **'Escolhe pelo melhor valor/peso'**
  String get greedyBullet1;

  /// No description provided for @greedyBullet2.
  ///
  /// In pt, this message translates to:
  /// **'Muito rápido (boa aproximação)'**
  String get greedyBullet2;

  /// No description provided for @greedyBullet3.
  ///
  /// In pt, this message translates to:
  /// **'Pode falhar em casos específicos'**
  String get greedyBullet3;

  /// No description provided for @approxBadge.
  ///
  /// In pt, this message translates to:
  /// **'Aproximação'**
  String get approxBadge;

  /// No description provided for @dpTitle.
  ///
  /// In pt, this message translates to:
  /// **'Programação Dinâmica (DP)'**
  String get dpTitle;

  /// No description provided for @dpSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Encontra a solução ótima no 0/1'**
  String get dpSubtitle;

  /// No description provided for @dpBullet1.
  ///
  /// In pt, this message translates to:
  /// **'Constrói tabela dp[item][capacidade]'**
  String get dpBullet1;

  /// No description provided for @dpBullet2.
  ///
  /// In pt, this message translates to:
  /// **'Garante solução ótima'**
  String get dpBullet2;

  /// No description provided for @dpBullet3.
  ///
  /// In pt, this message translates to:
  /// **'Complexidade ~ O(n * capacidade)'**
  String get dpBullet3;

  /// No description provided for @optimalBadge.
  ///
  /// In pt, this message translates to:
  /// **'Ótimo'**
  String get optimalBadge;

  /// No description provided for @bruteforceTitle.
  ///
  /// In pt, this message translates to:
  /// **'Backtracking / Força Bruta'**
  String get bruteforceTitle;

  /// No description provided for @bruteforceSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Explora combinações possíveis'**
  String get bruteforceSubtitle;

  /// No description provided for @bruteforceBullet1.
  ///
  /// In pt, this message translates to:
  /// **'Mostra explosão combinatória'**
  String get bruteforceBullet1;

  /// No description provided for @bruteforceBullet2.
  ///
  /// In pt, this message translates to:
  /// **'Ótimo para aprendizado'**
  String get bruteforceBullet2;

  /// No description provided for @bruteforceBullet3.
  ///
  /// In pt, this message translates to:
  /// **'Fica lento rapidamente'**
  String get bruteforceBullet3;

  /// No description provided for @didacticBadge.
  ///
  /// In pt, this message translates to:
  /// **'Didático'**
  String get didacticBadge;

  /// No description provided for @resultTitle.
  ///
  /// In pt, this message translates to:
  /// **'Resultado'**
  String get resultTitle;

  /// No description provided for @capacityLabel.
  ///
  /// In pt, this message translates to:
  /// **'Capacidade'**
  String get capacityLabel;

  /// No description provided for @usedWeightLabel.
  ///
  /// In pt, this message translates to:
  /// **'Peso usado'**
  String get usedWeightLabel;

  /// No description provided for @failBadge.
  ///
  /// In pt, this message translates to:
  /// **'Precisa melhorar'**
  String get failBadge;

  /// No description provided for @okBadge.
  ///
  /// In pt, this message translates to:
  /// **'Bom'**
  String get okBadge;

  /// No description provided for @greatBadge.
  ///
  /// In pt, this message translates to:
  /// **'Excelente'**
  String get greatBadge;

  /// No description provided for @percentageOfOptimal.
  ///
  /// In pt, this message translates to:
  /// **'Você fez {percent}% do ótimo'**
  String percentageOfOptimal(Object percent);

  /// No description provided for @retry.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get retry;

  /// No description provided for @nextLevel.
  ///
  /// In pt, this message translates to:
  /// **'Próximo nível'**
  String get nextLevel;

  /// No description provided for @homeButton.
  ///
  /// In pt, this message translates to:
  /// **'Home'**
  String get homeButton;

  /// No description provided for @suggestion.
  ///
  /// In pt, this message translates to:
  /// **'Sugestão'**
  String get suggestion;

  /// No description provided for @viewOptimalSolution.
  ///
  /// In pt, this message translates to:
  /// **'Ver solução ótima'**
  String get viewOptimalSolution;

  /// No description provided for @knapsackGuideHeroBadge.
  ///
  /// In pt, this message translates to:
  /// **'Problema da Mochila'**
  String get knapsackGuideHeroBadge;

  /// No description provided for @knapsackGuideHeroTitle.
  ///
  /// In pt, this message translates to:
  /// **'Escolha itens e maximize o valor sem passar do peso.'**
  String get knapsackGuideHeroTitle;

  /// No description provided for @knapsackGuideHeroSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Entenda o contexto e os algoritmos antes de jogar.'**
  String get knapsackGuideHeroSubtitle;

  /// No description provided for @knapsackPlayTitle.
  ///
  /// In pt, this message translates to:
  /// **'Jogo: Mochila'**
  String get knapsackPlayTitle;

  /// No description provided for @knapsackPlayTimerPrefix.
  ///
  /// In pt, this message translates to:
  /// **'⏱'**
  String get knapsackPlayTimerPrefix;

  /// No description provided for @knapsackPlayTimerSuffix.
  ///
  /// In pt, this message translates to:
  /// **'s'**
  String get knapsackPlayTimerSuffix;

  /// No description provided for @knapsackPlayResetTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Reiniciar'**
  String get knapsackPlayResetTooltip;

  /// No description provided for @knapsackPlayHintBeginner.
  ///
  /// In pt, this message translates to:
  /// **'Dica: tente colocar itens leves com bom valor. Combine bem!'**
  String get knapsackPlayHintBeginner;

  /// No description provided for @knapsackPlayHintIntermediate.
  ///
  /// In pt, this message translates to:
  /// **'Dica: nem sempre o item mais valioso é a melhor escolha.'**
  String get knapsackPlayHintIntermediate;

  /// No description provided for @knapsackPlayHintAdvanced.
  ///
  /// In pt, this message translates to:
  /// **'Dica: maximize eficiência (valor/peso).'**
  String get knapsackPlayHintAdvanced;

  /// No description provided for @knapsackPlaySelectedTitle.
  ///
  /// In pt, this message translates to:
  /// **'Na mochila (toque para remover)'**
  String get knapsackPlaySelectedTitle;

  /// No description provided for @knapsackPlayAvailableTitle.
  ///
  /// In pt, this message translates to:
  /// **'Itens disponíveis (arraste)'**
  String get knapsackPlayAvailableTitle;

  /// No description provided for @knapsackPlayJumpLeftTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Voltar 1 item'**
  String get knapsackPlayJumpLeftTooltip;

  /// No description provided for @knapsackPlayJumpRightTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Avançar 1 item'**
  String get knapsackPlayJumpRightTooltip;

  /// No description provided for @knapsackPlayScrollHintLabel.
  ///
  /// In pt, this message translates to:
  /// **'Deslize'**
  String get knapsackPlayScrollHintLabel;

  /// No description provided for @knapsackPlayFinishCta.
  ///
  /// In pt, this message translates to:
  /// **'Finalizar'**
  String get knapsackPlayFinishCta;

  /// No description provided for @knapsackPlayNoItemSelected.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum item selecionado ainda.'**
  String get knapsackPlayNoItemSelected;

  /// No description provided for @knapsackPlayTap.
  ///
  /// In pt, this message translates to:
  /// **'Toque'**
  String get knapsackPlayTap;

  /// No description provided for @knapsackPlayDropHere.
  ///
  /// In pt, this message translates to:
  /// **'Solte aqui!'**
  String get knapsackPlayDropHere;

  /// No description provided for @knapsackPlayDragItemstoTheBag.
  ///
  /// In pt, this message translates to:
  /// **'Arraste itens para a mochila'**
  String get knapsackPlayDragItemstoTheBag;

  /// No description provided for @knapsackResultTitle.
  ///
  /// In pt, this message translates to:
  /// **'Resultado'**
  String get knapsackResultTitle;

  /// No description provided for @knapsackResultGreatTitle.
  ///
  /// In pt, this message translates to:
  /// **'Ótimo! Excelente decisão'**
  String get knapsackResultGreatTitle;

  /// No description provided for @knapsackResultOkTitle.
  ///
  /// In pt, this message translates to:
  /// **'Ok! Boa escolha'**
  String get knapsackResultOkTitle;

  /// No description provided for @knapsackResultFailTitle.
  ///
  /// In pt, this message translates to:
  /// **'Quase lá! Você pode melhorar'**
  String get knapsackResultFailTitle;

  /// No description provided for @knapsackResultBadgeFail.
  ///
  /// In pt, this message translates to:
  /// **'REPROVADO'**
  String get knapsackResultBadgeFail;

  /// No description provided for @knapsackResultBadgeOk.
  ///
  /// In pt, this message translates to:
  /// **'OK'**
  String get knapsackResultBadgeOk;

  /// No description provided for @knapsackResultBadgeGreat.
  ///
  /// In pt, this message translates to:
  /// **'ÓTIMO'**
  String get knapsackResultBadgeGreat;

  /// No description provided for @knapsackResultOptimalDpLabel.
  ///
  /// In pt, this message translates to:
  /// **'Ótimo (DP)'**
  String get knapsackResultOptimalDpLabel;

  /// No description provided for @knapsackResultGapLabel.
  ///
  /// In pt, this message translates to:
  /// **'Lacuna'**
  String get knapsackResultGapLabel;

  /// No description provided for @knapsackResultSeeOptimalCta.
  ///
  /// In pt, this message translates to:
  /// **'Ver solução ótima (DP)'**
  String get knapsackResultSeeOptimalCta;

  /// No description provided for @knapsackResultRetryCta.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get knapsackResultRetryCta;

  /// No description provided for @knapsackResultNextLevelCta.
  ///
  /// In pt, this message translates to:
  /// **'Próximo nível'**
  String get knapsackResultNextLevelCta;

  /// No description provided for @knapsackResultHomeCta.
  ///
  /// In pt, this message translates to:
  /// **'Home'**
  String get knapsackResultHomeCta;

  /// No description provided for @knapsackResultCloseCta.
  ///
  /// In pt, this message translates to:
  /// **'Close'**
  String get knapsackResultCloseCta;

  /// No description provided for @knapsackResultPctOfOptimal.
  ///
  /// In pt, this message translates to:
  /// **'{pct}% do ideal'**
  String knapsackResultPctOfOptimal(int pct);

  /// No description provided for @knapsackResultCapacityUsedWeight.
  ///
  /// In pt, this message translates to:
  /// **'Capacidade: {cap} • Peso usado: {used}'**
  String knapsackResultCapacityUsedWeight(int cap, int used);

  /// No description provided for @knapsackResultValue.
  ///
  /// In pt, this message translates to:
  /// **'Valor: {value}'**
  String knapsackResultValue(int value);

  /// No description provided for @knapsackResultSuggestionLeftoverWithItem.
  ///
  /// In pt, this message translates to:
  /// **'Você deixou {waste} de capacidade sobrando. Tente adicionar \"{name}\" (peso {weight}, valor {value}).'**
  String knapsackResultSuggestionLeftoverWithItem(
    int waste,
    String name,
    int weight,
    int value,
  );

  /// No description provided for @knapsackResultSuggestionLeftoverGeneric.
  ///
  /// In pt, this message translates to:
  /// **'Você deixou {waste} de capacidade sem uso. Tente adicionar um item leve para aumentar o valor.'**
  String knapsackResultSuggestionLeftoverGeneric(int waste);

  /// No description provided for @knapsackResultSuggestionTryInclude.
  ///
  /// In pt, this message translates to:
  /// **'Dica: soluções ótimas geralmente incluem \"{name}\" (peso {weight}, valor {value}). Tente trocar os itens para se adequar.'**
  String knapsackResultSuggestionTryInclude(String name, int weight, int value);

  /// No description provided for @knapsackResultSuggestionGenericLow.
  ///
  /// In pt, this message translates to:
  /// **'Tente priorizar itens com melhor relação valor-peso (⭐/💪). Itens mais pesados ​​nem sempre valem a pena.'**
  String get knapsackResultSuggestionGenericLow;

  /// No description provided for @knapsackResultOptimalSheetTitle.
  ///
  /// In pt, this message translates to:
  /// **'Solução ótima (DP)'**
  String get knapsackResultOptimalSheetTitle;

  /// No description provided for @profileScreenSoon.
  ///
  /// In pt, this message translates to:
  /// **'Perfil (em breve)'**
  String get profileScreenSoon;

  /// No description provided for @tpsScreenSoon.
  ///
  /// In pt, this message translates to:
  /// **'Introdução ao Caixeiro Viajante (em breve)'**
  String get tpsScreenSoon;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
