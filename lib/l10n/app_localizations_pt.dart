// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get splashSubtitle => 'Diversão + Algoritmos';

  @override
  String get loading => 'Carregando...';

  @override
  String get splashFooter => 'v0.1 • módulo Mochila';

  @override
  String get appTitle => 'APA Learn';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get portuguese => 'Português';

  @override
  String get english => 'Inglês';

  @override
  String get version => 'Versão';

  @override
  String get updateTitle => 'Atualização necessária';

  @override
  String get updateMessage =>
      'Uma nova versão do app já está disponível com melhorias e correções importantes.\n\nPara continuar usando, atualize agora pela loja.';

  @override
  String get updateButton => 'Atualizar agora';

  @override
  String get updateLater => 'Depois';

  @override
  String get updateIgnore => 'Ignorar';

  @override
  String get modules => 'Módulos';

  @override
  String get homeHeroSubtitle => 'Aprenda algoritmos como um jogos';

  @override
  String get xpLabel => 'XP';

  @override
  String get rankLabel => 'Rank';

  @override
  String get difficultyEasy => 'Fácil';

  @override
  String get difficultyMedium => 'Médio';

  @override
  String get difficultyHard => 'Difícil';

  @override
  String get btnGuide => 'Guia';

  @override
  String get btnPlay => 'Jogar';

  @override
  String get knapsackTitle => 'Problema da Mochila';

  @override
  String get knapsackSubtitle =>
      'Escolha itens e maximize o valor sem estourar a capacidade.';

  @override
  String get tspTitle => 'Problema do Caixeiro Viajante';

  @override
  String get tspSubtitle =>
      'Encontre o menor caminho para visitar todas as cidades e voltar ao início.';

  @override
  String get knapsackIntroAppBarTitle => 'Problema da Mochila';

  @override
  String get knapsackIntroChooseDifficulty => 'Escolha sua dificuldade';

  @override
  String get knapsackIntroStartMission => 'Começar missão';

  @override
  String get knapsackIntroHintBeginner =>
      'Dica: foque em itens com alto valor e baixo peso.';

  @override
  String get knapsackIntroHintIntermediate =>
      'Dica: nem sempre o maior valor vence. Pense na combinação.';

  @override
  String get knapsackIntroHintAdvanced =>
      'Dica: maximize eficiência (valor/peso).';

  @override
  String get knapsackIntroHeaderText =>
      'Escolha itens com peso e valor.\nMaximize o valor sem estourar a capacidade.';

  @override
  String get capacityCardTitle => 'Capacidade da mochila';

  @override
  String get capacityCardSubtitle =>
      'Ajuste a capacidade para o desafio ficar do seu jeito.';

  @override
  String difficultyTagItems(int count) {
    return 'Itens: até $count';
  }

  @override
  String difficultyTagCapacity(int min, int max) {
    return 'Cap.: $min-$max';
  }

  @override
  String get difficultyTagHints => 'Dicas';

  @override
  String get difficultyTagTimer => 'Tempo';

  @override
  String valueLabel(int value) {
    return 'Valor';
  }

  @override
  String weightLabel(int used, int capacity) {
    return 'Peso: $used / $capacity';
  }

  @override
  String get knapsackBoardingTitle => 'Problema da Mochila';

  @override
  String get knapsackBoardingSubtitle =>
      'Você é um explorador e encontrou tesouros! Mas sua mochila tem limite de peso.';

  @override
  String get knapsackBoardingHighlight =>
      'Escolha os itens certos para maximizar seu tesouro!';

  @override
  String get knapsackBoardingObjectiveTitle => 'Objetivo';

  @override
  String get knapsackBoardingObjectiveText =>
      'Selecione itens para colocar na mochila respeitando o limite de peso e maximizando o valor total!';

  @override
  String get knapsackBoardingPillWeight => 'Peso Limite';

  @override
  String get knapsackBoardingPillValue => 'Valor Máximo';

  @override
  String get knapsackBoardingCta => 'Começar Aventura';

  @override
  String get knapsackDifficultyBeginnerTitle => 'Iniciante';

  @override
  String get knapsackDifficultyBeginnerSubtitle =>
      'Poucos itens, dicas e sem pressão.';

  @override
  String get knapsackDifficultyIntermediateTitle => 'Intermediário';

  @override
  String get knapsackDifficultyIntermediateSubtitle =>
      'Mais itens e escolhas mais difíceis.';

  @override
  String get knapsackDifficultyAdvancedTitle => 'Avançado';

  @override
  String get knapsackDifficultyAdvancedSubtitle =>
      'Desafio real: mais itens e menos dicas.';

  @override
  String get knapsackItemCoin => 'Moeda';

  @override
  String get knapsackItemGem => 'Gema';

  @override
  String get knapsackItemBook => 'Livro';

  @override
  String get knapsackItemPhone => 'Celular';

  @override
  String get knapsackItemWatch => 'Relógio';

  @override
  String get knapsackItemTablet => 'Tablet';

  @override
  String get knapsackItemKindle => 'Kindle';

  @override
  String get knapsackItemHeadphone => 'Fone';

  @override
  String get knapsackItemVR => 'VR';

  @override
  String get knapsackItemConsole => 'Console';

  @override
  String get knapsackGuideTitle => 'Guia: Problema da Mochila';

  @override
  String get context => 'Contexto';

  @override
  String get whyHard => 'Por que é difícil?';

  @override
  String get howBecomesGame => 'Como vira um jogo?';

  @override
  String get commonAlgorithms => 'Algoritmos comuns';

  @override
  String get knapsackGuideContextText =>
      'Imagine que você vai viajar e só pode levar uma mochila com limite de peso. Cada item tem peso e valor. O objetivo é maximizar o valor sem ultrapassar a capacidade.';

  @override
  String get knapsackGuideWhyHardText =>
      'Testar todas as combinações cresce exponencialmente. Por isso é considerado NP-hard.';

  @override
  String get knapsackGuideHowGameText =>
      'Você arrasta itens para a mochila. Tente chegar o mais próximo possível do valor ótimo. Níveis mais difíceis podem ter tempo e menos dicas.';

  @override
  String get greedyTitle => 'Guloso';

  @override
  String get greedySubtitle => 'Rápido, mas pode não achar o ótimo';

  @override
  String get greedyBullet1 => 'Escolhe pelo melhor valor/peso';

  @override
  String get greedyBullet2 => 'Muito rápido (boa aproximação)';

  @override
  String get greedyBullet3 => 'Pode falhar em casos específicos';

  @override
  String get approxBadge => 'Aproximação';

  @override
  String get dpTitle => 'Programação Dinâmica (DP)';

  @override
  String get dpSubtitle => 'Encontra a solução ótima no 0/1';

  @override
  String get dpBullet1 => 'Constrói tabela dp[item][capacidade]';

  @override
  String get dpBullet2 => 'Garante solução ótima';

  @override
  String get dpBullet3 => 'Complexidade ~ O(n * capacidade)';

  @override
  String get optimalBadge => 'Ótimo';

  @override
  String get bruteforceTitle => 'Backtracking / Força Bruta';

  @override
  String get bruteforceSubtitle => 'Explora combinações possíveis';

  @override
  String get bruteforceBullet1 => 'Mostra explosão combinatória';

  @override
  String get bruteforceBullet2 => 'Ótimo para aprendizado';

  @override
  String get bruteforceBullet3 => 'Fica lento rapidamente';

  @override
  String get didacticBadge => 'Didático';

  @override
  String get resultTitle => 'Resultado';

  @override
  String get capacityLabel => 'Capacidade';

  @override
  String get usedWeightLabel => 'Peso usado';

  @override
  String get failBadge => 'Precisa melhorar';

  @override
  String get okBadge => 'Bom';

  @override
  String get greatBadge => 'Excelente';

  @override
  String percentageOfOptimal(Object percent) {
    return 'Você fez $percent% do ótimo';
  }

  @override
  String get retry => 'Tentar novamente';

  @override
  String get nextLevel => 'Próximo nível';

  @override
  String get homeButton => 'Home';

  @override
  String get suggestion => 'Sugestão';

  @override
  String get viewOptimalSolution => 'Ver solução ótima';

  @override
  String get knapsackGuideHeroBadge => 'Problema da Mochila';

  @override
  String get knapsackGuideHeroTitle =>
      'Escolha itens e maximize o valor sem passar do peso.';

  @override
  String get knapsackGuideHeroSubtitle =>
      'Entenda o contexto e os algoritmos antes de jogar.';

  @override
  String get knapsackPlayTitle => 'Jogo: Mochila';

  @override
  String get knapsackPlayTimerPrefix => '⏱';

  @override
  String get knapsackPlayTimerSuffix => 's';

  @override
  String get knapsackPlayResetTooltip => 'Reiniciar';

  @override
  String get knapsackPlayHintBeginner =>
      'Dica: tente colocar itens leves com bom valor. Combine bem!';

  @override
  String get knapsackPlayHintIntermediate =>
      'Dica: nem sempre o item mais valioso é a melhor escolha.';

  @override
  String get knapsackPlayHintAdvanced =>
      'Dica: maximize eficiência (valor/peso).';

  @override
  String get knapsackPlaySelectedTitle => 'Na mochila (toque para remover)';

  @override
  String get knapsackPlayAvailableTitle => 'Itens disponíveis (arraste)';

  @override
  String get knapsackPlayJumpLeftTooltip => 'Voltar 1 item';

  @override
  String get knapsackPlayJumpRightTooltip => 'Avançar 1 item';

  @override
  String get knapsackPlayScrollHintLabel => 'Deslize';

  @override
  String get knapsackPlayFinishCta => 'Finalizar';

  @override
  String get knapsackPlayNoItemSelected => 'Nenhum item selecionado ainda.';

  @override
  String get knapsackPlayTap => 'Toque';

  @override
  String get knapsackPlayDropHere => 'Solte aqui!';

  @override
  String get knapsackPlayDragItemstoTheBag => 'Arraste itens para a mochila';

  @override
  String get knapsackResultTitle => 'Resultado';

  @override
  String get knapsackResultGreatTitle => 'Ótimo! Excelente decisão';

  @override
  String get knapsackResultOkTitle => 'Ok! Boa escolha';

  @override
  String get knapsackResultFailTitle => 'Quase lá! Você pode melhorar';

  @override
  String get knapsackResultBadgeFail => 'REPROVADO';

  @override
  String get knapsackResultBadgeOk => 'OK';

  @override
  String get knapsackResultBadgeGreat => 'ÓTIMO';

  @override
  String get knapsackResultOptimalDpLabel => 'Ótimo (DP)';

  @override
  String get knapsackResultGapLabel => 'Lacuna';

  @override
  String get knapsackResultSeeOptimalCta => 'Ver solução ótima (DP)';

  @override
  String get knapsackResultRetryCta => 'Tentar novamente';

  @override
  String get knapsackResultNextLevelCta => 'Próximo nível';

  @override
  String get knapsackResultHomeCta => 'Home';

  @override
  String get knapsackResultCloseCta => 'Close';

  @override
  String knapsackResultPctOfOptimal(int pct) {
    return '$pct% do ideal';
  }

  @override
  String knapsackResultCapacityUsedWeight(int cap, int used) {
    return 'Capacidade: $cap • Peso usado: $used';
  }

  @override
  String knapsackResultValue(int value) {
    return 'Valor: $value';
  }

  @override
  String knapsackResultSuggestionLeftoverWithItem(
    int waste,
    String name,
    int weight,
    int value,
  ) {
    return 'Você deixou $waste de capacidade sobrando. Tente adicionar \"$name\" (peso $weight, valor $value).';
  }

  @override
  String knapsackResultSuggestionLeftoverGeneric(int waste) {
    return 'Você deixou $waste de capacidade sem uso. Tente adicionar um item leve para aumentar o valor.';
  }

  @override
  String knapsackResultSuggestionTryInclude(
    String name,
    int weight,
    int value,
  ) {
    return 'Dica: soluções ótimas geralmente incluem \"$name\" (peso $weight, valor $value). Tente trocar os itens para se adequar.';
  }

  @override
  String get knapsackResultSuggestionGenericLow =>
      'Tente priorizar itens com melhor relação valor-peso (⭐/💪). Itens mais pesados ​​nem sempre valem a pena.';

  @override
  String get knapsackResultOptimalSheetTitle => 'Solução ótima (DP)';

  @override
  String get profileScreenSoon => 'Perfil (em breve)';

  @override
  String get tpsScreenSoon => 'Introdução ao Caixeiro Viajante (em breve)';
}
