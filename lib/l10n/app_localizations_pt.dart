// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Falha ao carregar os dados';

  @override
  String get errorNoData => 'Não há dados para exibir.';

  @override
  String get noData => 'Sem dados';

  @override
  String get noDate => 'Sem data';

  @override
  String get shareAction => 'Compartilhar';

  @override
  String get loginAction => 'Entrar';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsChangeLanguage => 'Mudar idioma';

  @override
  String get settingsLogout => 'Sair';

  @override
  String get tryAgainButton => 'Tentar novamente';

  @override
  String get moreButton => '... Mais';

  @override
  String get seeDetailsLink => 'Ver detalhes ->';

  @override
  String get bottomNavHome => 'Início';

  @override
  String get bottomNavInfo => 'Informações';

  @override
  String get bottomNavSupport => 'Apoiar';

  @override
  String get bottomNavFutureFeatures => 'Recursos futuros';

  @override
  String termLabel(String termNumber) {
    return 'Legislatura: $termNumber';
  }

  @override
  String termMenuItem(int termNumber, String termYears) {
    return 'Legislatura $termNumber $termYears';
  }

  @override
  String get errorNoDataForTerm =>
      'Não há dados para exibir para a legislatura selecionada.';

  @override
  String get sectionPopularVotes => 'Votações populares';

  @override
  String get sectionUpcoming => 'Em breve';

  @override
  String get sectionLegislationInProcess => 'Legislação em processo';

  @override
  String get sectionMpProfiles => 'Perfis de deputados';

  @override
  String get buttonBrowseVotes => 'Navegador de votações';

  @override
  String get buttonScheduledMeetings => 'Sessões agendadas';

  @override
  String get buttonBillsInProgress => 'Leis em andamento';

  @override
  String get buttonAllMps => 'Todos os deputados';

  @override
  String get buttonCheckProfile => 'Ver perfil';

  @override
  String get errorNoDeputiesData => 'Sem dados sobre os deputados.';

  @override
  String get errorNoDataLastVote => 'Sem dados sobre a última votação.';

  @override
  String get errorNoDataUpcomingVote => 'Sem dados sobre a próxima votação.';

  @override
  String get errorNoSummaryLastVote => 'Sem resumo da última votação.';

  @override
  String get errorNoSummaryUpcomingVote => 'Sem resumo da próxima votação.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Sem dados sobre a legislação em processo.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Sem resumo da legislação em processo.';

  @override
  String get keyPoints => 'Pontos-chave';

  @override
  String get noKeyPoints => 'Nenhum ponto-chave';

  @override
  String get votingResultsTitle => 'RESULTADOS DA VOTAÇÃO';

  @override
  String get labelFor => 'A favor:';

  @override
  String get labelAgainst => 'Contra:';

  @override
  String get labelAbstained => 'Abstenções:';

  @override
  String get noStatusInfo => 'Nenhuma informação de status';

  @override
  String scheduledMeetingDate(String date) {
    return 'Sessão agendada: $date';
  }

  @override
  String get noScheduledMeetingDate => 'Nenhuma data de sessão agendada';

  @override
  String processStartDate(String date) {
    return 'Início do processo: $date';
  }

  @override
  String get noProcessStartDate => 'Nenhuma data de início do processo';

  @override
  String mpDistrict(String districtNumber) {
    return 'Distrito: $districtNumber';
  }

  @override
  String get actionCollapse => 'Recolher';

  @override
  String get actionExpand => 'Expandir mais...';

  @override
  String get votingFor => 'A favor';

  @override
  String get votingAgainst => 'Contra';

  @override
  String get votingAbstainShort => 'Abst.';

  @override
  String get citizenPollTitle => 'Enquete cidadã';

  @override
  String get pollTemporarilyUnavailable =>
      'Enquete temporariamente indisponível. Por favor, tente novamente mais tarde.';

  @override
  String get errorDisplayingPollBar =>
      'Erro ao exibir os resultados da enquete.';

  @override
  String get pollNoForAgainstVotes => 'Sem votos a favor/contra';

  @override
  String get pollNoVotesCast => 'Nenhum voto registrado';

  @override
  String pollTotalVotes(int count) {
    return 'Votos registrados: $count';
  }

  @override
  String get pollSupport => 'Apoio';

  @override
  String get pollDontSupport => 'Não apoio';

  @override
  String get loginToVote => 'Faça login para votar';

  @override
  String get dialogChooseLanguage => 'Escolher idioma';

  @override
  String get dialogCancel => 'Cancelar';

  @override
  String get infoScreenTitle => 'Informações';

  @override
  String get infoTitle1 => 'Separando a política da mídia';

  @override
  String get infoParagraph1 =>
      'Lustra é um aplicativo para acompanhar a política usando dados oficiais. Com tecnologia de IA, resumos de leis e resultados de votações são apresentados de forma concisa, clara e imparcial. Acompanhar a política não exige mais esforço ou tempo - apenas alguns cliques.';

  @override
  String get infoTitle2 => 'Interesses comuns acima das divisões';

  @override
  String get infoParagraph2 =>
      'Como sociedade, compartilhamos objetivos comuns como liberdade, segurança e prosperidade. As diferenças de pontos de vista são uma parte natural da democracia - elas moldam o debate e permitem diferentes perspectivas. Com acesso a informações confiáveis, podemos tomar decisões mais informadas e participar da vida pública com base em fatos, não em emoções ou narrativas da mídia.';

  @override
  String get infoTitle3 => 'Ações, não palavras';

  @override
  String get infoParagraph3 =>
      'Você não precisa mais confiar em promessas eleitorais - pode rever o histórico de votações de deputados individuais e analisar suas decisões. O perfil de cada político inclui uma lista com marcadores, permitindo uma avaliação rápida e independente de seu histórico. O histórico de trabalho completo será expandido à medida que o aplicativo se desenvolver.';

  @override
  String get infoTitle4 => 'Pessoas, não partidos';

  @override
  String get infoParagraph4 =>
      'Os deputados devem considerar os interesses de seus eleitores, não apenas votar de acordo com a linha do partido. O sistema partidário divide a sociedade, mas tudo pode ser mudado com pequenos passos. O primeiro é a conscientização pública. Use o aplicativo, converse, compartilhe votações, participe de enquetes e mantenha-se informado. A política afeta quase todos os aspectos de nossas vidas, então não há razão para que poucos decidam tudo.';

  @override
  String get linkHowTechnologyWorks => 'Como a tecnologia funciona?';

  @override
  String get linkTermsAndPrivacy => 'Termos e Política de Privacidade';

  @override
  String get supportScreenTitle => 'Apoie o projeto';

  @override
  String get supportParagraph1 =>
      'Lustra é meu projeto pessoal pro bono. O aplicativo sempre será gratuito, sem recursos pagos, extensões, anúncios ou limitações. Acredito que todos deveriam ter acesso irrestrito a informações acessíveis - sem comentários opinativos ou filtros. Se você concorda com a missão, encorajo-o a apoiá-la com uma doação de qualquer valor. Cada contribuição, por menor que seja, me ajudará a manter o aplicativo e a desenvolvê-lo ainda mais.';

  @override
  String get buttonSupportFinancially => 'Apoiar financeiramente';

  @override
  String get supportThankYou =>
      'Obrigado por sua confiança e por toda forma de engajamento';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Criador do Aplicativo';

  @override
  String get leaderboardTitle => 'Maiores doadores (Último mês)';

  @override
  String get futureFeaturesScreenTitle => 'Recursos futuros';

  @override
  String get futureFeaturesHeader => 'Funcionalidades planejadas';

  @override
  String get futureFeatureReferendum => 'Convocação de um referendo';

  @override
  String get futureFeatureSenate => 'Senado e senadores';

  @override
  String get futureFeatureCitizenInitiative =>
      'Iniciativa legislativa popular - projetos de lei';

  @override
  String get futureFeatureIndependentCandidates =>
      'Candidatos independentes ao parlamento';

  @override
  String get futureFeaturePetitions => 'Petições ao parlamento';

  @override
  String get comingSoon => 'Em breve';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Concluído - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Atualizar dados';

  @override
  String get advancedSearchHint => 'Busca avançada...';

  @override
  String get filterTypeLabel => 'Tipo: ';

  @override
  String get filterStatusLabel => 'Status: ';

  @override
  String get allOption => 'Todos';

  @override
  String get errorFetchData =>
      'Falha ao buscar dados. Por favor, tente novamente.';

  @override
  String get emptyListFilterMessage =>
      'Nenhuma lei encontrada que corresponda aos critérios selecionados.';

  @override
  String get emptyListDefaultMessage =>
      'Nenhuma lei concluída para exibir para esta fonte.';

  @override
  String get searchDialogTitle => 'Buscar e Filtrar';

  @override
  String get searchDialogHint => 'Digite o termo de busca...';

  @override
  String get searchDialogTimePeriodLabel => 'Período de tempo';

  @override
  String get searchDialogSearchButton => 'Buscar';

  @override
  String get searchDialogSelectDateRange => 'Selecionar intervalo';

  @override
  String get searchDialogDateRangePickerHelp =>
      'Selecione um intervalo de datas';

  @override
  String get searchDialogDateRangePickerCancel => 'CANCELAR';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'SALVAR';

  @override
  String get timePeriodLastWeek => 'Última semana';

  @override
  String get timePeriodLastMonth => 'Último mês';

  @override
  String get timePeriodLast3Months => 'Últimos 3 meses';

  @override
  String get timePeriodLastYear => 'Último ano';

  @override
  String get timePeriodAll => 'Todo o período';

  @override
  String get timePeriodCustom => 'Intervalo personalizado';

  @override
  String get categoryAll => 'Todos';

  @override
  String get categoryHealth => 'Saúde';

  @override
  String get categoryFamily => 'Família';

  @override
  String get categoryTaxes => 'Impostos';

  @override
  String get categoryMigration => 'Migração';

  @override
  String get categoryLabor => 'Trabalho';

  @override
  String get categorySecurity => 'Segurança';

  @override
  String get categoryEducation => 'Educação';

  @override
  String get categoryEnvironment => 'Meio ambiente';

  @override
  String get categoryCourtsAndLaw => 'Tribunais e lei';

  @override
  String get categoryTransport => 'Transporte';

  @override
  String get categoryBenefits => 'Benefícios';

  @override
  String get categoryRealEstate => 'Imobiliário';

  @override
  String get categoryMediaAndCulture => 'Mídia e cultura';

  @override
  String get categoryLocalGovernment => 'Governo local';

  @override
  String get categoryAgriculture => 'Agricultura';

  @override
  String get categoryPublicInvestments => 'Investimentos públicos';

  @override
  String get categoryInformatization => 'Informatização';

  @override
  String get categoryEconomy => 'Economia';

  @override
  String get categoryOther => 'Outro';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Próximas Leis - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Buscar e Filtrar (Avançado)';

  @override
  String get emptyListFilterMessageFuture =>
      'Nenhuma próxima lei encontrada que corresponda aos critérios selecionados.';

  @override
  String get emptyListDefaultMessageFuture =>
      'Nenhuma lei agendada para exibir para esta fonte.';

  @override
  String get noScheduledMeetings => 'Nenhuma sessão agendada';

  @override
  String get dateFormatError => 'Erro de formatação de data';

  @override
  String get upcomingMeetings => 'Próximas sessões:';

  @override
  String get keyPointsTitle => 'Pontos-chave:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Leis em Processo - $parliamentName';
  }

  @override
  String get searchHint => 'Buscar...';

  @override
  String get emptyListFilterMessageProcess =>
      'Nenhuma lei em processo encontrada que corresponda aos critérios selecionados.';

  @override
  String get emptyListDefaultMessageProcess =>
      'Nenhuma lei ativa no processo legislativo para esta fonte.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Início do processo: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Próximas sessões:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Compartilhar';

  @override
  String get keyPointsSectionTitle => 'Pontos-chave:';

  @override
  String get officialContentButton => 'Texto oficial';

  @override
  String get processPageButton => 'Página do processo';

  @override
  String get fullVotingResultsPDF => 'Resultados completos da votação (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Sessões agendadas';

  @override
  String get additionalInfoSectionTitle => 'Informações adicionais';

  @override
  String printNumberLabel(String id) {
    return 'Número de impressão: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Data de início do processo: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Data da votação: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'Nº da sessão: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'Nº da votação: $number';
  }

  @override
  String get sourceLabel => 'Fonte: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Resumido por: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Prompt usado: $prompt';
  }

  @override
  String get reportErrorButton => 'Reportar um erro';

  @override
  String get noUrlAvailableSnackbar => 'Nenhum URL disponível.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'Não foi possível abrir o link: $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Seu voto já foi registrado.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Função de compartilhamento (a ser implementada)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Função de relatório de erros (a ser implementada)';

  @override
  String get loginScreenTitle => 'Entrar';

  @override
  String get registrationScreenTitle => 'Cadastro';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get loginButton => 'Entrar';

  @override
  String get registerButton => 'Cadastrar';

  @override
  String get orDivider => 'OU';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get continueWithFacebook => 'Continuar com o Facebook';

  @override
  String get promptToRegister => 'Não tem uma conta? Cadastre-se';

  @override
  String get promptToLogin => 'Já tem uma conta? Entre';

  @override
  String get validatorInvalidEmail =>
      'Por favor, insira um endereço de e-mail válido.';

  @override
  String get validatorPasswordTooShort =>
      'A senha deve ter pelo menos 6 caracteres.';

  @override
  String get authErrorInvalidCredentials => 'E-mail ou senha inválidos.';

  @override
  String get authErrorEmailInUse => 'Este endereço de e-mail já está em uso.';

  @override
  String get authErrorWeakPassword => 'A senha é muito fraca.';

  @override
  String get authErrorDefault => 'Ocorreu um erro. Por favor, tente novamente.';

  @override
  String get authErrorUnexpected => 'Ocorreu um erro inesperado.';

  @override
  String get authErrorGoogleFailed =>
      'A entrada com o Google falhou. Por favor, tente novamente.';

  @override
  String get authErrorFacebookFailed =>
      'A entrada com o Facebook falhou. Por favor, tente novamente.';

  @override
  String get authErrorAccountExists =>
      'Já existe uma conta com este e-mail. Por favor, entre com sua senha.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Deputados - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Buscar deputados...';

  @override
  String get allFilter => 'Todos';

  @override
  String get noMPsForSource => 'Nenhum deputado disponível para esta fonte.';

  @override
  String get noMPsMatchFilter => 'Nenhum deputado corresponde aos critérios.';

  @override
  String get attendanceLabelShort => 'Presença';

  @override
  String get attendanceTooltipWarning =>
      'Presença calculada com base em uma legislatura com um pequeno número de votações.\nOs dados podem ser menos representativos.';

  @override
  String get supportLabel => 'Apoio: ';

  @override
  String get unaffiliatedClub => 'Não afiliado';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Compartilhar perfil';

  @override
  String get socialPollSectionTitle => 'Enquete social';

  @override
  String get parliamentaryActivitySectionTitle => 'Atividade parlamentar';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Tempo de mandato parlamentar: $years anos';
  }

  @override
  String get parliamentaryTenureNoData =>
      'Tempo de mandato parlamentar: Sem dados';

  @override
  String get tenureTooltip =>
      'O número de anos é um valor aproximado, calculado com base nos dados abaixo, sem levar em conta a expiração prematura do mandato parlamentar.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '$romanNumeralª legislatura do Sejm da República da Polônia $duration';
  }

  @override
  String get unknownTermDuration => 'Período desconhecido';

  @override
  String get noTermData => 'Sem dados detalhados sobre as legislaturas.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Nota: Dados históricos da 1ª e 2ª legislaturas do Sejm da República da Polônia não estão disponíveis e não são incluídos.';

  @override
  String get personalDataSectionTitle => 'Dados pessoais';

  @override
  String get contactSectionTitle => 'Contato';

  @override
  String get dataSourceLabel => 'Fonte de dados: API do Sejm RP';

  @override
  String get mandateStatusActive => 'Mandato de deputado: ativo';

  @override
  String get mandateStatusFulfilled => 'Mandato de deputado: cumprido';

  @override
  String get mandateStatusCancelled => 'Mandato de deputado: cancelado';

  @override
  String get mandateStatusInactive => 'Mandato de deputado: inativo';

  @override
  String get followingAddedSnackbar => 'Adicionado aos seguidos';

  @override
  String get followingRemovedSnackbar => 'Removido dos seguidos';

  @override
  String clubLabel(String clubName) {
    return 'Grupo: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (anteriormente: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Profissão: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Distrito: $districtName (nº $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Votos obtidos: $votes';
  }

  @override
  String get birthDateLabel => 'Data de nascimento';

  @override
  String get ageLabel => 'Idade';

  @override
  String ageUnit(int age) {
    return '$age anos';
  }

  @override
  String get birthPlaceLabel => 'Local de nascimento';

  @override
  String get educationLabel => 'Educação';

  @override
  String get voivodeshipLabel => 'Voivodia';

  @override
  String get emailLabelWithColon => 'E-mail:';

  @override
  String get votingsTab => 'Votações recentes';

  @override
  String get interpellationsTab => 'Interpelações';

  @override
  String get attendanceLabel => 'Presença geral em votações';

  @override
  String get attendanceTooltipBase =>
      'A escala avalia o nível de cumprimento do dever parlamentar básico. Os intervalos adotados baseiam-se na suposição de que uma alta presença é uma medida de responsabilidade para com os eleitores.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nO deputado exerceu o mandato por parte da legislatura. A presença refere-se a este período.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nPresença calculada com base em uma legislatura com um pequeno número de votações. Os dados podem ser menos representativos.';

  @override
  String get errorLoadVotings => 'Falha ao carregar o histórico de votações.';

  @override
  String get errorLoadInterpellations => 'Falha ao carregar as interpelações.';

  @override
  String get noVotingsData =>
      'Sem dados sobre votações importantes para exibir.';

  @override
  String get noInterpellationsData => 'Sem dados.';

  @override
  String get loadVotingsButton => 'Tentar carregar votações';

  @override
  String get loadMoreButton => 'Mostrar mais';

  @override
  String interpellationSentDate(String date) {
    return 'Data de envio: $date';
  }

  @override
  String get interpellationReplyFrom => 'Resposta de: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'Não foi possível abrir o link da resposta: $url';
  }

  @override
  String get pollResultNoVotes => 'sem votos';

  @override
  String get pollResultOverwhelmingMajority => 'maioria esmagadora';

  @override
  String get pollResultMajority => 'maioria';

  @override
  String get pollResultMinority => 'minoria';

  @override
  String get pollResultOverwhelmingMinority => 'minoria esmagadora';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Número de votos registrados: $count';
  }

  @override
  String get pollVoteToAction => 'Vote para ver os resultados';

  @override
  String get voteTypeFor => 'A favor';

  @override
  String get voteTypeAgainst => 'Contra';

  @override
  String get voteTypeAbstain => 'Abstenção';

  @override
  String get voteTypeAbsent => 'Ausente';

  @override
  String get defaultPrompt => 'Prompt';

  @override
  String get statusInProgress => 'Em andamento';

  @override
  String get statusPassedSejmToSenat => 'Aprovada e enviada ao Senado';

  @override
  String get statusRejectedSejm => 'Rejeitada';

  @override
  String get statusRejectedBySenate => 'Rejeitada pelo Senado';

  @override
  String get statusToPresident => 'Enviada ao Presidente';

  @override
  String get statusVetoPresident => 'VETO do Presidente';

  @override
  String get statusToConstitutionalTribunal =>
      'Remetida ao Tribunal Constitucional';

  @override
  String get statusSignedByPresident => 'Assinada pelo Presidente';

  @override
  String get statusEnacted => 'Promulgada';

  @override
  String get statusExpired => 'Expirada';

  @override
  String get statusAdoptedResolution => 'Aprovada';

  @override
  String get statusRejectedResolution => 'Rejeitada';

  @override
  String get statusImmediateRejection => 'Rejeição imediata';

  @override
  String get statusWithdrawn => 'Retirada';

  @override
  String get filterStatusAll => 'Todos';

  @override
  String get filterStatusPassed => 'Aprovados';

  @override
  String get filterStatusRejected => 'Rejeitados';

  @override
  String get docTypeBill => 'Projeto de lei';

  @override
  String get docTypeResolution => 'Projeto de resolução';

  @override
  String get statusUpcoming => 'Agendado';

  @override
  String get statusIntroducedInHouse =>
      'Apresentado na Câmara dos Representantes';

  @override
  String get statusReportedToSenate => 'Relatado ao Senado';

  @override
  String get statusReportedInHouse => 'Relatado na Câmara';

  @override
  String get statusReferredInSenate => 'Remetido ao Senado';

  @override
  String get statusReferredInHouse => 'Remetido à Câmara';

  @override
  String get statusReferenceChangeSenate => 'Mudança de remessa no Senado';

  @override
  String get statusReceivedInSenate => 'Recebido no Senado';

  @override
  String get statusPlacedOnCalendarSenate => 'Colocado no calendário do Senado';

  @override
  String get statusIntroducedInSenate => 'Apresentado no Senado';

  @override
  String get statusEngrossedInHouse => 'Aprovado em forma final na Câmara';

  @override
  String get statusAgreedToSenate => 'Aprovado no Senado';

  @override
  String get statusEngrossedAmendmentHouse => 'Emenda aprovada na Câmara';

  @override
  String get statusFailedPassageSenate => 'Rejeitado no Senado';

  @override
  String get statusLaidOnTableInHouse => 'Arquivado na Câmara';

  @override
  String get statusPrivateLaw => 'Lei Privada';

  @override
  String get statusPublicLaw => 'Lei Pública';

  @override
  String get statusAdopted => 'Adotado';

  @override
  String get statusDeBundesratApproved => 'O Bundesrat aprovou';

  @override
  String get statusDeAdopted => 'Adotado';

  @override
  String get statusDeIntroductionApproved => 'Introdução aprovada';

  @override
  String get statusDeAnnounced => 'Promulgado';

  @override
  String get statusDeRejected => 'Rejeitado';

  @override
  String get statusDeBundesratDenied => 'O Bundesrat negou o consentimento';

  @override
  String get statusDeIntroductionRejected => 'Introdução rejeitada';

  @override
  String get statusDeDeclaredCompleted => 'Declarado concluído';

  @override
  String get statusDeCompletedByTermEnd =>
      'Concluído no final do período legislativo';

  @override
  String get statusDeDeclaredUnconstitutional => 'Declarado inconstitucional';

  @override
  String get statusDeWithdrawn => 'Retirado';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Processo no Bundesrat concluído';

  @override
  String get statusDeCompleted => 'Concluído';

  @override
  String get statusDeCompletedSeeProcess => 'Concluído - ver procedimento';

  @override
  String get statusDeRecommendationAvailable =>
      'Recomendação de resolução disponível';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Transmitido ao Bundesrat - ainda não deliberado';

  @override
  String get statusDeAssignedToCommittees => 'Atribuído às comissões';

  @override
  String get statusDeNotYetDeliberated => 'Ainda não deliberado';

  @override
  String get statusDeMergedWith => 'Fundido com... (ver procedimento)';

  @override
  String get statusDeReferred => 'Remetido';

  @override
  String get statusFrLawPublished => 'Lei publicada';

  @override
  String get statusFrOrdinancePublished => 'Portaria publicada';

  @override
  String get statusFrResolutionPublished => 'Resolução publicada';

  @override
  String get statusFrDecreePublished => 'Decreto publicado';

  @override
  String get statusFrDecision => 'Decisão';

  @override
  String get statusFrRejected => 'Rejeitado';

  @override
  String get statusFrPrescribed => 'Prescrito';

  @override
  String get statusFrPropositionLoi => 'Projeto de Lei (Parlamentar)';

  @override
  String get statusFrProjetLoi => 'Projeto de Lei (Governo)';

  @override
  String get statusUkActOfParliament => 'Ato do Parlamento';

  @override
  String get statusUkRoyalAssent => 'Consentimento Real';

  @override
  String get statusUkWithdrawn => 'Retirado';

  @override
  String get statusUkRejected => 'Rejeitado';

  @override
  String get statusUk1stReading => '1ª leitura';

  @override
  String get statusUk2ndReading => '2ª leitura';

  @override
  String get statusUk3rdReading => '3ª leitura';

  @override
  String get statusUkCommitteeStage => 'Fase de comissão';

  @override
  String get statusUkCommonsExaminers => 'Examinadores da Câmara dos Comuns';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Comissão Especial de Projetos de Lei Públicos da Câmara dos Lordes';

  @override
  String get statusUkMoneyResolution => 'Resolução financeira';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Apreciação das emendas dos Lordes';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Apreciação da mensagem dos Lordes';

  @override
  String get statusUkOrderOfCommitmentDischarged =>
      'Ordem de remessa à comissão anulada';

  @override
  String get statusUkProgrammeMotion => 'Moção de programação';

  @override
  String get statusUkReportStage => 'Fase de relatório';

  @override
  String get statusUkSecondReadingCommittee => 'Comissão de segunda leitura';

  @override
  String get statusUkWaysAndMeansResolution => 'Resolução \'Ways and Means\'';

  @override
  String get errorCheckConnection =>
      'Por favor, verifique a sua ligação à internet.';

  @override
  String get buttonRetry => 'Tentar novamente';

  @override
  String get shareAsPost => 'Compartilhar como post (1:1)';

  @override
  String get shareAsStory => 'Compartilhar como story (16:9)';

  @override
  String get morePointsInApp =>
      '...informações completas estão disponíveis no aplicativo Lustra';

  @override
  String get pollVotingViaApp => 'Votação disponível no aplicativo!';

  @override
  String get supportPollTitle => 'Sondagem de apoio';

  @override
  String get termsCountLabel => 'Número de mandatos';

  @override
  String get settingsNotificationsNewLaws =>
      'Notificações sobre novas legislações';

  @override
  String get settingsNotificationsVoteResults =>
      'Notificações sobre resultados de votação';

  @override
  String get detailsButton => 'Detalhes';

  @override
  String get errorNoVotingsDetails => 'SEM DADOS DETALHADOS DE VOTAÇÃO';

  @override
  String get clearText => 'Limpar';

  @override
  String get consideredOnLabel => 'Em consideração em:';

  @override
  String get legislationFooterAiDisclaimer =>
      'O resumo acima foi gerado por IA e é uma elaboração do documento governamental original, respeitando todos os princípios de imparcialidade e livre informação. Detalhes da consulta utilizada e seu esquema podem ser encontrados na aba de informações.';

  @override
  String get legislationFooterModelUsed => 'Modelo utilizado:';

  @override
  String get legislationFooterSourceData =>
      'Os dados de origem estão disponíveis gratuitamente no sistema governamental em:';

  @override
  String get appMotto =>
      '... ou seja, informação legislativa imparcial e sem qualquer coloração política.';

  @override
  String get acceptTermsPrefix => 'Aceito os';

  @override
  String get termsAndConditions => 'Termos e a Política de Privacidade';

  @override
  String get validatorAcceptTerms =>
      'Você deve aceitar os termos para continuar.';

  @override
  String get joinSupportClubPrefix => 'Quero me juntar ao';

  @override
  String get supportClub => 'Clube de Apoio Lustra';

  @override
  String get supportClubDescription =>
      'Você receberá informações especiais sobre o desenvolvimento do projeto e futuras iniciativas.';

  @override
  String get registrationFinishTitle => 'Concluir registo';

  @override
  String get welcomeMessage => 'Bem-vindo!';

  @override
  String get finalStepMessage =>
      'Apenas um último passo. Por favor, aceite os termos para continuar.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get selectYourParliament => 'Selecione o seu parlamento';

  @override
  String get validatorSelectParliament =>
      'Por favor, selecione um parlamento para continuar.';

  @override
  String get forgotPasswordButton => 'Esqueceu-se da palavra-passe?';

  @override
  String get passwordResetEmailSent =>
      'Foi enviado um link para redefinir a palavra-passe para o seu e-mail.';

  @override
  String get authErrorUserNotFound =>
      'Nenhum utilizador encontrado com este endereço de e-mail.';

  @override
  String get settingsDeleteAccount => 'Eliminar conta';

  @override
  String get errorDeleteAccount =>
      'Falha ao eliminar a conta. Por favor, tente novamente.';

  @override
  String get dialogReauthenticateTitle => 'Confirme a sua identidade';

  @override
  String get dialogConfirm => 'Confirmar';

  @override
  String get dialogDeleteAccountTitle =>
      'Tem a certeza de que deseja eliminar a sua conta?';

  @override
  String get dialogDeleteAccountContent =>
      'Esta ação não pode ser desfeita. Todos os seus dados, incluindo o seu histórico de votação, serão eliminados permanentemente.';

  @override
  String get dialogDelete => 'Eliminar';

  @override
  String get termsOfServiceContent =>
      '<b>Termos de Serviço da Aplicação \"Lustra\"</b>\n\nÚltima atualização: 10 de agosto de 2025\n\nOlá! Daqui o criador da aplicação Lustra.\nFico feliz por estares aqui. Criei a Lustra porque acredito que cada um de nós merece um acesso simples e transparente à informação sobre como são feitas as leis que afetam as nossas vidas.\n\nEste documento são os termos de serviço – uma espécie de acordo entre mim e ti. Escrevi-o em linguagem simples para que saibas exatamente quais são as regras da aplicação. Por favor, lê-o com calma. Ao usar a Lustra, confirmas que aceitas estas regras.\n\n<b>1. Glossário, ou seja, de quem e do que estamos a falar</b>\n•\t<b>Eu, meu, me</b> – ou seja, eu, Jacek, o criador da aplicação, a operar através da empresa FO&WO VENTURES SP. Z O.O. com sede em Wrocław.\n•\t<b>Tu, teu, te</b> – ou seja, tu, a pessoa que está a usar a aplicação.\n•\t<b>Aplicação</b> ou <b>Lustra</b> – a aplicação móvel \"Lustra\" que estás a usar.\n•\t<b>Conta</b> – a tua conta pessoal na aplicação, que podes criar para usar funcionalidades adicionais.\n•\t<b>Termos</b> – este mesmo documento.\n\n<b>2. Do que se trata a Lustra? (Princípios gerais)</b>\n•\tA Lustra é uma aplicação gratuita cujo objetivo é fornecer-te informação acessível sobre os processos legislativos em parlamentos selecionados. Aqui encontrarás resumos de projetos de lei, resultados de votações e dados sobre os deputados.\n•\tTens de ter pelo menos 16 anos para usar a aplicação. Se criares uma Conta, confirmas que cumpres esta condição.\n•\tO uso das funcionalidades informativas básicas não requer a criação de uma Conta.\n\n<b>3. A tua Conta na aplicação</b>\n•\tPodes criar uma Conta usando o teu endereço de e-mail. Isto permitir-te-á usar funcionalidades adicionais, como votar em sondagens ou receber notificações personalizadas.\n•\tPor favor, lembra-te que só podes ter uma Conta.\n•\tÉs responsável por manter a tua palavra-passe confidencial e por tudo o que acontece na tua Conta.\n\n<b>4. Como podes usar o conteúdo? (Licença)</b>\n•\tTodos os dados-fonte (ex: textos completos de leis, resultados de votações, dados de deputados) provêm de fontes oficiais e públicas e são informação pública.\n•\tO conteúdo que eu crio usando o meu sistema proprietário e tecnologia de IA (ou seja, resumos, títulos simplificados, pontos-chave) é-te disponibilizado para uso livre para fins informativos, educacionais e privados. Podes lê-lo e partilhá-lo como capturas de ecrã.\n•\tPeço-te encarecidamente que não copies estes dados de forma massiva (não faças scraping). Criar e manter este sistema custa-me tempo e dinheiro. Portanto, para proteger este projeto, os Termos proíbem-te de:\n\t\to\tDescarregar automaticamente e criar a tua própria base de dados com base no conteúdo gerado na aplicação.\n\t\to\tUtilizar o conteúdo da aplicação para fins comerciais.\n\t\to\tTentar quebrar a segurança, descompilar a aplicação ou perturbar o seu funcionamento.\n•\tTens uma ideia para usar os dados da Lustra de uma forma interessante? Estou aberto a colaborações! Escreve-me para jacek@lustra.dev – terei todo o gosto em falar sobre isso.\n\n<b>5. Sondagens e fiabilidade dos dados</b>\n•\tUma das funcionalidades da aplicação são as sondagens onde podes expressar o teu apoio a uma determinada lei. Para que os resultados destas sondagens sejam o mais fiáveis possível, por favor, seleciona nas definições o parlamento do país do qual és cidadão (se estiver disponível na lista).\n\n<b>6. A minha responsabilidade (ou melhor, a falta dela)</b>\n•\tForneço a aplicação \"tal como está\" (em inglês, \"as is\"). Faço todos os esforços para garantir que os dados estão atuais e corretos, mas eles provêm de APIs governamentais externas, que podem conter erros. Portanto, não posso ser responsabilizado por eventuais imprecisões nos dados-fonte.\n•\tA Lustra é um projeto pro bono que mantenho com os meus próprios fundos. Farei o meu melhor para que funcione ininterruptamente, mas devo reservar que podem ocorrer pausas técnicas. Reservo-me também o direito de terminar o serviço se, por exemplo, ficar sem fundos para o manter.\n•\tO conteúdo na aplicação, especialmente o gerado por IA, tem fins informativos e educacionais. Não constitui aconselhamento jurídico.\n\n<b>7. Clube de Apoio Lustra</b>\n•\tPodes juntar-te ao \"Clube de Apoio Lustra\" dando o teu consentimento separado e voluntário. Isto significa que poderei enviar-te e-mails sobre o desenvolvimento da aplicação, novas funcionalidades, e também pedir apoio em discussões sobre o futuro do projeto ou ajuda financeira, se necessário. Encontrarás mais detalhes sobre isto na Política de Privacidade.\n\n<b>8. Termo do nosso acordo</b>\n•\tTu podes terminá-lo a qualquer momento. Basta usar a opção \"Apagar conta\" nas definições da aplicação. Isto resultará na eliminação irreversível da tua Conta e dos dados associados.\n•\tEu posso bloquear ou apagar a tua Conta se violares gravemente estes Termos, por exemplo, tentando prejudicar o funcionamento da aplicação.\n\n<b>9. Alterações aos Termos</b>\n•\tO mundo muda, e a aplicação também mudará. Reservo-me o direito de alterar estes Termos. Informar-te-ei de qualquer alteração importante com antecedência, por exemplo, através de uma mensagem na aplicação. O uso continuado da Lustra após a introdução das alterações significará a sua aceitação.\n\n<b>10. Contacto e disposições finais</b>\n•\tSe tiveres alguma questão, não hesites em escrever para: jacek@lustra.dev.\n•\tEm todas as matérias não reguladas por estes Termos, aplicar-se-á a lei polaca.\n\nObrigado por estares aqui e por ajudares a criar um estado transparente!';

  @override
  String get termsAndPrivacyTitle => 'Termos e Privacidade';

  @override
  String get termsOfServiceTab => 'Termos';

  @override
  String get privacyPolicyTab => 'Privacidade';

  @override
  String get privacyPolicyContent =>
      '<b>Política de Privacidade da Aplicação \"Lustra\"</b>\n\nÚltima atualização: 10 de agosto de 2025\n\nEste documento é a Política de Privacidade. Eu sei que estes textos podem ser longos e complicados, por isso fiz o meu melhor para escrevê-lo de forma simples.\nA sua privacidade e confiança são a minha prioridade absoluta. Nesta política, explicarei que dados recolho, porque o faço e como os protejo.\n\n<b>1. Quem cuida dos seus dados? (Controlador de Dados)</b>\nO controlador dos seus dados pessoais sou eu, Jacek, a operar através da empresa FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817).\nSe tiver alguma questão sobre os seus dados, escreva-me diretamente para: jacek@lustra.dev.\n\n<b>2. Que dados recolho e porquê?</b>\nRecolho apenas os dados necessários para o funcionamento da aplicação ou para os quais dá consentimento separado e voluntário. Aqui está uma lista detalhada:\n•\t<b>Quando cria uma Conta:</b>\n\to\t<b>O seu endereço de e-mail:</b> Preciso dele para criar e manter a sua Conta de forma segura, permitir que inicie sessão e que reponha a sua palavra-passe caso a esqueça.\n\to\t<b>Identificador de Utilizador Único (UID):</b> É uma sequência aleatória de caracteres atribuída automaticamente pelo sistema Firebase, que me permite ligar os seus dados à sua Conta de forma segura.\n•\t<b>Quando utiliza as funcionalidades da aplicação (como utilizador com sessão iniciada):</b>\n\to\t<b>Os seus votos em sondagens (\"apoio\" / \"oponho-me\"):</b> Guardo-os para poder criar estatísticas agregadas e totalmente anónimas de apoio a cada lei, que vê na aplicação. O seu voto individual nunca é exibido publicamente.\n\to\t<b>A sua lista de legislação seguida:</b> Armazeno-a para que tenha fácil acesso e para que eu possa (no futuro) enviar-lhe notificações sobre o seu progresso.\n\to\t<b>O seu parlamento escolhido:</b> Guardo esta informação para que possa participar nas sondagens relevantes e (no futuro) receber notificações para o país correto.\n•\t<b>Quando adere ao Clube de Apoio Lustra (totalmente voluntário):</b>\n\to\t<b>Informação sobre o seu consentimento (verdadeiro/falso):</b> Guardo-a para saber se deseja receber mensagens adicionais da minha parte. Escrevo mais sobre o Clube na secção 5.\n•\t<b>Quando reporta um erro:</b>\n\to\tSe decidir enviar um relatório de erro nos dados, guardarei o conteúdo do seu relatório para analisar e corrigir o problema.\nO que <b>NÃO</b> recolho: Não uso ferramentas de análise externas (como o Google Analytics) para rastrear a sua atividade na aplicação.\n\n<b>3. A quem confio os seus dados? (Os meus parceiros tecnológicos)</b>\nPara a Lustra funcionar, utilizo os serviços de parceiros tecnológicos de confiança a quem confio o processamento de alguns dados. São eles:\n•\t<b>Google (como parte do serviço Firebase):</b> É a espinha dorsal tecnológica de toda a aplicação. A Google fornece-me a infraestrutura para:\n\to\t<b>Autenticação (Firebase Authentication):</b> Início de sessão seguro e gestão da sua Conta.\n\to\t<b>Base de Dados (Cloud Firestore):</b> Armazenamento de dados relacionados com a sua Conta (ex: votos em sondagens, lista de legislação seguida).\n•\t<b>Google (como parte do serviço Gemini AI):</b> É a ferramenta que uso para analisar textos legislativos. Quero ser absolutamente claro: envio para a IA apenas textos de leis e documentos disponíveis publicamente. Os seus dados pessoais (como e-mail ou UID) nunca são enviados para lá.\nTodos os dados são armazenados em servidores da Google localizados no Espaço Económico Europeu.\n\n<b>4. Durante quanto tempo guardo os seus dados?</b>\nDe forma simples e direta: guardo os seus dados enquanto tiver uma Conta comigo. Se decidir eliminá-la, todos os seus dados pessoais serão apagados permanentemente.\n\n<b>5. O Clube de Apoio Lustra – o que é?</b>\nÉ um lugar especial para pessoas que querem estar mais próximas do projeto. A adesão é totalmente voluntária e requer a marcação de um consentimento separado. Se aderir, concorda que eu lhe envie ocasionalmente e-mails sobre:\n•\tdesenvolvimento da aplicação e novas funcionalidades planeadas,\n•\teventos especiais, ex: painéis de discussão sobre o futuro da Lustra,\n•\toutros projetos semelhantes com a mesma missão que eu possa criar no futuro,\n•\tpedidos de apoio financeiro caso o projeto se encontre numa situação difícil.\nPode retirar o seu consentimento a qualquer momento nas definições da aplicação.\n\n<b>6. Os seus direitos – tem controlo total</b>\nO RGPD concede-lhe uma série de direitos, e eu quero que os possa exercer facilmente. Tem o direito de:\n•\tAceder aos seus dados: Saber que dados guardo sobre si.\n•\tRetificar (corrigir) os seus dados.\n•\tApagar os seus dados (direito a ser esquecido): Pode fazê-lo a qualquer momento usando a opção \"Apagar conta\" nas definições da aplicação.\n•\tLimitar o processamento dos seus dados.\n•\tPortabilidade dos dados.\n•\tOpor-se ao processamento dos seus dados.\n•\tRetirar o consentimento (ex: para estar no Clube de Apoio Lustra).\n•\tApresentar queixa ao Presidente da Autoridade de Proteção de Dados Pessoais (UODO) se considerar que estou a processar os seus dados ilegalmente.\nPara exercer a maioria destes direitos, basta escrever-me para jacek@lustra.dev.\n\n<b>7. Segurança dos seus dados</b>\nLevo a segurança muito a sério. Utilizo as soluções fornecidas pela Google Firebase, que aplicam padrões de segurança modernos, incluindo a encriptação de dados tanto durante a sua transmissão (protocolo SSL) como no armazenamento nos servidores.\n\n<b>8. Dados de crianças</b>\nComo mencionado nos Termos de Serviço, a aplicação destina-se a pessoas com 16 anos ou mais. Não recolho nem processo conscientemente dados de indivíduos mais jovens.\n\n<b>9. Alterações a esta política</b>\nPosso atualizar esta política no futuro. Informá-lo-ei de quaisquer alterações significativas com antecedência na aplicação.\n\nObrigado pela sua confiança.\nJacek';

  @override
  String get techPageTitle => 'Sobre tecnologia e imparcialidade';

  @override
  String get techPageIntro =>
      'Por trás de cada título simplificado e resumo de uma lei, existe um modelo de linguagem. Aqui, quero explicar-lhe com total transparência como funciona e como garanto que as informações que recebe são sempre puras e imparciais.';

  @override
  String get techPageWhyAiTitle => 'Por que uso IA?';

  @override
  String get techPageWhyAiBody =>
      'Os textos de leis e documentos parlamentares são escritos num jargão jurídico complicado. Ler e compreender até mesmo uma lei curta é um desafio, mesmo para um advogado.\n\nO meu objetivo era criar uma ferramenta que traduzisse esta linguagem hermética \"do jurídico para o humano\". Analisar manualmente centenas de documentos por dia seria impossível para uma única pessoa. É por isso que recorri à IA - como uma poderosa ferramenta para análise e simplificação de texto, que permite entregar-lhe informações de forma rápida e acessível.';

  @override
  String get techPageWhatForTitle => 'Para que uso exatamente a IA?';

  @override
  String get techPageWhatForBody =>
      'A Inteligência Artificial executa três tarefas específicas:\n  • Simplifica os títulos oficiais para outros que dizem imediatamente do que se trata o documento.\n  • Cria resumos curtos, de 2 a 3 frases, que se concentram no impacto das mudanças na vida quotidiana dos cidadãos.\n  • Extrai do emaranhado de texto alguns pontos-chave, ou seja, as mudanças e soluções mais importantes.\n\nTodos os outros dados, como resultados de votações ou informações sobre deputados, vêm diretamente de APIs governamentais oficiais.';

  @override
  String get techPageBiasTitle =>
      'Como garanto a imparcialidade? Instruções para a IA';

  @override
  String get techPageBiasBody =>
      'Esta é a parte mais importante. A IA executa comandos específicos. Estes comandos (chamados de \"prompt\" em informática) são um tipo de instrução muito precisa que é a base da imparcialidade de toda a aplicação.\n\nAqui estão os princípios-chave que incuti no meu sistema de IA:\n  • <b>Papel de especialista neutro:</b> Ordeno à IA que assuma o papel de um especialista em direito apolítico, cujo único objetivo é analisar e explicar, não avaliar ou comentar.\n  • <b>Apenas factos, sem opiniões:</b> A instrução proíbe explicitamente a IA de expressar as suas próprias opiniões, fazer juízos de valor e usar uma linguagem que possa sugerir se uma determinada mudança é \"boa\" ou \"má\". Deve focar-se exclusivamente nos factos.\n  • <b>Perspetiva do cidadão comum:</b> Em vez de analisar a lei da perspetiva de um advogado, a IA tem a tarefa de responder à pergunta: \"O que esta mudança significa para mim, um cidadão comum? Como irá afetar as minhas finanças, a minha saúde, os meus direitos e deveres?\".';

  @override
  String get techPagePromiseTitle =>
      'Instrução completa e transparente para consulta';

  @override
  String get techPagePromiseBody =>
      'Não acredite apenas na minha palavra. Abaixo está o conteúdo exato da instrução (prompt) que passo ao modelo de IA (Google Gemini) ao analisar cada documento, certificando-me de que os parâmetros de criatividade também estão definidos como 0 (para que a IA não invente coisas durante a análise). Este é o \"cérebro\" da operação.\n\n(Nota: Este prompt irá evoluir e ser melhorado com o tempo, para que a qualidade dos resumos seja cada vez maior.)';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'Você é um especialista em direito de $country encarregado de analisar documentos de leis, resoluções e outros documentos legislativos e, em seguida, preparar informações a partir deles de uma forma acessível para os cidadãos. O seu objetivo é apresentar as informações de tal forma que os cidadãos possam avaliar por si próprios o impacto da legislação nas suas vidas, mesmo sem terem conhecimentos legislativos especializados. Concentre-se nos factos e nas consequências das alterações introduzidas, evitando juízos de valor e opiniões pessoais. Todo o jargão jurídico é proibido. Apresente as informações de forma clara, concisa e envolvente, para que sejam compreensíveis para uma pessoa sem formação jurídica. Evite frases longas e complexas. Em vez de escrever \"o projeto visa implementar a diretiva relativa à separação de resíduos...\", escreva \"Novas regras para a separação do lixo: uso de sacos especiais, etc....\". Continue o seu trabalho até resolver a sua tarefa. Se não tiver a certeza sobre o conteúdo gerado, analise novamente o documento - não adivinhe. Planeie bem a sua tarefa antes de começar. No resumo e nos pontos-chave, se possível e justificado, destaque que benefícios ou consequências concretas (positivas ou negativas) a lei introduz na vida quotidiana dos cidadãos, nos seus direitos e deveres, nas suas finanças pessoais, na sua segurança e noutras questões importantes.\n\nA sua resposta TEM de estar no formato JSON - e conter as seguintes chaves.\nAntes de devolver a resposta, verifique cuidadosamente se toda a estrutura JSON está 100% correta, incluindo todas as vírgulas, chavetas, parênteses retos e aspas. Um JSON incorreto é inaceitável e impedirá o processamento do seu trabalho.\n\nAnalise cuidadosamente o seguinte texto do documento legal. Este é o conteúdo com base no qual deve gerar o resumo e os pontos-chave:\n--- INÍCIO DO DOCUMENTO ---\n$DOCUMENT_TEXT\n--- FIM DO DOCUMENTO ---\n\nLEMBRE-SE: A sua resposta TEM de ser exclusivamente um objeto JSON válido. Não adicione quaisquer caracteres, comentários ou texto extra antes da tag \'OPEN_BRACE\' ou após a tag \'CLOSE_BRACE\'. A resposta completa tem de ser analisável como JSON.\nCom base no documento ACIMA, preencha a seguinte estrutura JSON:\nEsta é a estrutura JSON que espero (preencha-a com conteúdo):\n__OPEN_BRACE__\n  \"ai_title\": \"Um título novo e curto para o ato jurídico em português, que capte a essência das alterações introduzidas (por exemplo, no máximo 10-12 palavras).\",\n  \"summary\": \"Um resumo conciso de 2-3 frases do conteúdo do ato jurídico em português, escrito da perspetiva do seu impacto na vida quotidiana dos cidadãos.\",\n  \"key_points\": [\n    \"Primeiro ponto curto em português sobre as soluções ou alterações mais importantes introduzidas.\",\n    \"Segundo ponto curto em português...\"\n  ],\n \"category\": [\"Categorize o documento por defeito numa categoria, com base na área que aborda principalmente. Escolha até 3 se o documento também abordar questões SIGNIFICATIVAS de outras categorias. TEM de escolher categorias EXCLUSIVAMENTE da seguinte lista: Saúde, Educação, Família, Impostos, Trabalho, Segurança, Ambiente, Tribunais e Direito, Transportes, Prestações, Imobiliário, Média e Cultura, Autarquia Local, Migração, Agricultura, Investimentos Públicos, Informatização, Economia. Se o documento definitivamente não se enquadrar em nenhuma delas, TEM de usar \'Outros\'. Se usar \'Outros\', essa deverá ser a ÚNICA categoria selecionada. NÃO crie novas categorias. A resposta tem de ser um array de strings, por exemplo, [\\\"Impostos\\\", \\\"Família\\\"].\", \"Segunda categoria (opcional)\", \"Terceira categoria (opcional)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => 'A IA é infalível?';

  @override
  String get techPageFlawlessBody =>
      'Claro que não. Como qualquer tecnologia, pode cometer um erro ou interpretar algo incorretamente. É por isso que na aplicação encontrará um mecanismo que lhe permite reportar um erro nos dados - cada um desses relatórios é extremamente valioso para mim e ajuda-me a melhorar o sistema.\n\nO meu objetivo a longo prazo é continuar a desenvolver esta tecnologia e até mesmo operar o meu próprio modelo local sem quaisquer restrições, para aumentar ainda mais a precisão e a independência da aplicação.';

  @override
  String get techPageOutro =>
      'Obrigado pela sua confiança. Espero que, graças a esta transparência, a utilização do Lustra seja ainda mais valiosa para si.';

  @override
  String get votingResultsPL1stReadingTitle => 'VOTAÇÃO SOBRE A REJEIÇÃO';

  @override
  String get reportErrorDescription =>
      'Descreva brevemente o erro ou o que está faltando. O seu relatório nos ajudará a melhorar o aplicativo.';

  @override
  String get reportErrorHint => 'Digite sua mensagem...';

  @override
  String get reportErrorValidationEmpty => 'A mensagem não pode estar vazia.';

  @override
  String get reportErrorSuccess => 'Obrigado! O seu relatório foi enviado.';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionSend => 'Enviar';

  @override
  String get mustBeLoggedInToReport =>
      'Você precisa estar logado para relatar um erro.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Limite de relatórios excedido (10 por 24 horas).';

  @override
  String get supportQuickTitle => 'Apoio rápido';

  @override
  String get supportPaymentsUnavailable =>
      'Os pagamentos estão indisponíveis no momento.';

  @override
  String get supportNoProducts => 'Nenhuma opção de apoio disponível.';

  @override
  String get supportCampaignsTitle => 'Campanhas específicas';

  @override
  String get supportCampaignsDescription =>
      'Apoie metas de desenvolvimento específicas, como a adição de um novo parlamento.';

  @override
  String get supportCampaignsButton => 'Ver campanha ativa (em breve)';

  @override
  String get forceUpdateTitle => 'Atualização Necessária';

  @override
  String get forceUpdateDescription =>
      'Uma nova versão do aplicativo está disponível. Para continuar, atualize o aplicativo para a versão mais recente.';

  @override
  String get forceUpdateButton => 'Atualizar agora';

  @override
  String get deputies => 'Deputados';

  @override
  String get sortingLabel => 'Ordenar por: ';

  @override
  String get sortByPopularity => 'Popularidade';

  @override
  String get sortByAttendance => 'Presença';

  @override
  String partyLabel(Object partyName) {
    return 'Partido: $partyName';
  }

  @override
  String districtLabelUS(Object districtName, String districtNum) {
    return '$districtNumº distrito de $districtName';
  }

  @override
  String tenureTermItemUS(Object memberType, String termNumber) {
    return '$termNumberº Congresso ($memberType)';
  }

  @override
  String get birthYearLabel => 'Ano de nascimento:';

  @override
  String get sponsorshipsTab => 'Patrocínios';

  @override
  String get sponsorshipTypeSponsor => 'Patrocinador';

  @override
  String get sponsorshipTypeCosponsor => 'Copatrocinador';

  @override
  String get termCurrently => '(atualmente)';

  @override
  String get parliamentaryTenureTitle => 'Mandato parlamentar';

  @override
  String get usRoleRepresentative => 'Representante';

  @override
  String get usRoleSenator => 'Senador';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Veja os detalhes deste projeto de lei no aplicativo Lustra! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Veja e avalie o trabalho deste deputado/a no aplicativo Lustra! $deepLink';
  }

  @override
  String get clipboardCopySuccess =>
      'Link do aplicativo copiado para a área de transferência!';

  @override
  String get mandateInactive => 'MANDATO INATIVO';

  @override
  String get votingUnavailable => 'Votação indisponível';

  @override
  String get historicalTerm => 'LEGISLATURA HISTÓRICA';

  @override
  String get pollUnavailable => 'Sondagem indisponível';

  @override
  String get billsLabel => 'Projetos de Lei';

  @override
  String get sponsorshipSublabel => '(Patrocinados/Copatrocinados)';

  @override
  String get missingDataWarningShare =>
      'O documento fonte deste projeto de lei está em falta. Ajude-nos e envie um pedido oficial por e-mail para a sua publicação através do nosso aplicativo em segundos!';

  @override
  String get missingDataSourceUserMessage =>
      'O documento fonte deste projeto de lei está em falta. Ajude-nos enviando um pedido oficial por e-mail para a sua publicação e junte-se ao grupo de pessoas que se preocupam com a transparência da informação!';

  @override
  String get missingDataSourceButton => 'Solicitar documento por e-mail';

  @override
  String get cannotOpenEmailApp =>
      'Não foi possível abrir o aplicativo de e-mail. Verifique se ele está instalado e se você tem uma conta configurada.';

  @override
  String get sortByFreshness => 'Mais recentes';

  @override
  String get pollPermissionDeniedError =>
      'Esta votação está disponível apenas para utilizadores designados para este parlamento.';

  @override
  String get supportCampaignsButtonActive => 'Apoie a campanha';

  @override
  String get supportCampaignsButtonInactive => 'Campanha inativa';
}
