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
  String get sectionPopularVotes => 'Votações legislativas';

  @override
  String get sectionUpcoming => 'Debates agendados';

  @override
  String get sectionLegislationInProcess => 'Em curso';

  @override
  String get civicProjectsSectionTitle => 'Iniciativas cidadãs';

  @override
  String get sectionMpProfiles => 'Políticos populares';

  @override
  String get votingSourceTooltip => 'Ver fonte da votação';

  @override
  String get legislationSponsorLabel => 'Patrocinador';

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
  String get citizenPollTitle => 'Vontade Cidadã';

  @override
  String get pollTemporarilyUnavailable =>
      'Enquete temporariamente indisponível. Por favor, tente novamente mais tarde.';

  @override
  String get errorDisplayingPollBar =>
      'Erro ao exibir os resultados da enquete.';

  @override
  String get pollNoForAgainstVotes => 'Sem votos a favor/contra';

  @override
  String get pollNoVotesCast => 'Sê o primeiro a votar.';

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
  String get infoTitle1 => 'Cidadãos Acima da Política';

  @override
  String get infoParagraph1 =>
      'A mídia não informa – ela cura a realidade. Estima-se que 95% da legislação desapareça num \"buraco negro\" de silêncio por ser demasiado complexa para vender publicidade. A Lustra contorna os intermediários. Processamos a linguagem burocrática em factos acessíveis, dando-lhe visão sobre o que o governo realmente aprova, não apenas sobre o que querem falar.';

  @override
  String get infoTitle2 => 'Fatos, Não Marketing';

  @override
  String get infoParagraph2 =>
      'A política hoje é 80% marketing e 20% lei. Nós separamos os dois. Aplicamos um processo de \"esterilização de contexto\": removemos a linguagem emocional e o viés partidário, deixando apenas os fatos legais. Este não é \"outro ponto de vista\". É uma redução de ruído que lhe permite formar a sua própria opinião com base na fonte.';

  @override
  String get infoTitle3 => 'Poder Sem Intermediários';

  @override
  String get infoParagraph3 =>
      'As grandes plataformas otimizam o conteúdo para a sua indignação, porque isso o mantém no ecrã. Nós otimizamos para o seu conhecimento. A hierarquia dos tópicos na aplicação depende inteiramente dos votos da comunidade. Vocês decidem o que é importante, recuperando o poder de editores e lobistas.';

  @override
  String get infoTitle4 => 'Arquitetos da Mudança';

  @override
  String get infoParagraph4 =>
      'A democracia não é um desporto para espectadores. Introduzimos um mecanismo onde iniciativas cidadãs são apresentadas em pé de igualdade com projetos governamentais. Fornecemos a infraestrutura para passar de observador passivo a Arquiteto da Mudança – construindo apoio real para causas que importam. Elevamos a democracia a um novo nível.';

  @override
  String get linkHowTechnologyWorks => 'Como a tecnologia funciona?';

  @override
  String get linkTermsAndPrivacy => 'Termos e Política de Privacidade';

  @override
  String get supportScreenTitle => 'Infraestrutura Pública';

  @override
  String get supportParagraph1 =>
      'A Lustra é um serviço de utilidade pública digital. Mas a liberdade tem um preço. Rejeitámos o capital para garantir 100% de imparcialidade, pois acreditamos que é o único caminho para a mudança. A manutenção da infraestrutura e servidores depende exclusivamente de contribuições voluntárias. O equivalente a 10\$ financia o acesso à plataforma para vários milhares de pessoas por mês. O teu apoio garante a continuidade da missão.';

  @override
  String get buttonSupportFinancially => 'Apoiar';

  @override
  String get supportThankYou => 'Obrigado. Manténs o sistema vivo.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Fundador';

  @override
  String get futureFeaturesScreenTitle => 'Roteiro da Comunidade';

  @override
  String get futureFeaturesHeader => 'Tu Controlas a Direção';

  @override
  String get futureFeatureSenate => 'Integração de Senadores';

  @override
  String get futureFeatureCitizenInitiative => 'Referendos de Cidadãos';

  @override
  String get futureFeaturesDescription =>
      'Esta não é uma lista de desejos fechada. A Lustra é uma infraestrutura que pertence aos cidadãos, por isso todos temos impacto no seu desenvolvimento. Junta-te à comunidade Civic Evolution no Reddit, submete ideias e vota nas próximas funcionalidades. Vamos escrever juntos o próximo capítulo da democracia!';

  @override
  String get futureFeaturesVoteButton => 'Votar no Roteiro';

  @override
  String get comingSoon => 'Proposta';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Legislativo - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Atualizar cache';

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
  String get lustraClubLabel => 'Clube Lustra';

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
  String get mandateStatusActive => 'Mandato: ativo';

  @override
  String get mandateStatusFulfilled => 'Mandato: cumprido';

  @override
  String get mandateStatusCancelled => 'Mandato: cancelado';

  @override
  String get mandateStatusInactive => 'Mandato: inativo';

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
  String get pollResultNoVotes => 'Sê o primeiro a votar.';

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
  String get votingResultsUSMotionToReferTitle => 'RESULTADOS: REMESSA';

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
      '...informações completas estão disponíveis em Lustra';

  @override
  String get civicRulesAction => 'Crie o seu projeto';

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
  String get termsAndPrivacyTitle => 'Constituição e Privacidade';

  @override
  String get termsOfServiceTab => 'Regras';

  @override
  String get privacyPolicyTab => 'Privacidade';

  @override
  String get termsOfServiceContent =>
      'REGRAS DA COMUNIDADE LUSTRA\nData: 6 de dezembro de 2025\n\n1. OPERADOR E MISSÃO\nA Lustra é uma infraestrutura pública digital. O operador legal (Guardião) é FO&WO VENTURES SP. Z O.O. (LLC). A empresa atua como incubadora: sem dividendos, sem investidores externos, reinvestimento na infraestrutura.\n\n2. CÓDIGO E LICENÇA (SOURCE AVAILABLE)\nO código é um bem comum.\n• Modelo: Open Source (AGPLv3).\n• Permitido: Uso educativo, investigação, sem fins lucrativos.\n• Proibido: Corporações não podem lucrar sem consentimento.\n\n3. ROTEIRO DE GOVERNAÇÃO\nObjetivo: descentralização.\n• Atual: Fundador (Jacek) como Arquiteto Chefe.\n• Brevemente: Conselho Cívico eleito pelos utilizadores.\n• Meta: Mecanismos para a comunidade assumir o controlo em caso de traição da missão.\n\n4. PROJETOS DE CIDADÃOS\nIncubadora de leis.\n• Procedimento: Submissão por formulário, verificação formal.\n• Licença CC0: Libertas o projeto no Domínio Público.\n• Liberdade de expressão: Não julgamos opiniões. Rejeitamos apenas violações da lei penal.\n• Verificação: Deves ser cidadão do país correspondente.\n\n5. IA E FONTES\n• Papel da IA: Ajuda a navegar mas pode errar.\n• Fonte: A autoridade final é sempre o PDF original.\n\n6. SEGURANÇA\n• Idade: Utilizadores 16+.\n• Proibido: Ataques à infraestrutura e scraping comercial.\n\n7. DISPOSIÇÕES FINAIS\nRegido pela lei polaca.';

  @override
  String get privacyPolicyContent =>
      'POLÍTICA DE PRIVACIDADE: MINIMIZAÇÃO\nData: 6 de dezembro de 2025\n\nNão comercializamos a tua atenção. Recolha mínima.\n\n1. RESPONSÁVEL PELOS DADOS\nFO&WO VENTURES SP. Z O.O. Contacto: jacek@lustra.dev\n\n2. O QUE RECOLHEMOS\n• Conta (Email/UID): Necessário para login.\n• Votos: Ligados à conta para evitar manipulação (bots). Publicamente APENAS agregados anónimos.\n• Retenção: Dados de votação mantidos durante a legislatura + 5 anos (arquivo). Depois anonimizados.\n• Comunicação (Clube de Apoio): Com consentimento (definições), enviamos novidades. Podes retirar quando quiseres.\n• Projetos de Cidadãos: Conteúdo público.\n\n3. O QUE NÃO FAZEMOS\n• NÃO vendemos dados.\n• NÃO usamos rastreio publicitário.\n• NÃO perfilamos politicamente.\n\n4. INFRAESTRUTURA & SEGURANÇA\n• Localização: Google Cloud, Europa-West9 (Paris).\n• Anti-Bot: Uso de Firebase App Check.\n• IA: Os teus dados privados NUNCA vão para a IA.\n\n5. CRIANÇAS\nServiço para 16+. Não recolhemos dados de crianças.\n\n6. ELIMINAÇÃO\nBotão \"Apagar conta\" nas definições para remoção imediata.\n\n7. OS TEUS DIREITOS\nAcesso, retificação, eliminação, oposição. Contacto: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. METODOLOGIA DE TRABALHO COMPLETA (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'Abaixo apresentamos o pipeline completo de agentes de IA usados para gerar resumos de textos legais e detectar alucinações neles. O objetivo era desarmar o \"buraco negro legislativo\" aproximando-se ao mesmo tempo da maior objetividade possível. No entanto, deve-se enfatizar que não acreditamos em neutralidade total. Toda compressão de dados (resumo) é uma forma de escolha. Em vez de fingir o \"monopólio da verdade\" da mídia, adotamos um viés explícito – a \"perspectiva do cidadão\" no âmbito da context sterilization. Os modelos são instruídos a ignorar o teatro político e focar na carteira, nas liberdades e nos deveres. É uma decisão de projeto de engenharia, não política.';

  @override
  String get techDiagramTitle =>
      '2. DIAGRAMA DE FLUXO GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'O sistema opera em um ciclo de verificação. Não confiamos em modelos generativos – confiamos em processos de verificação e em uma abordagem iterativa na expansão dos sistemas.';

  @override
  String get techDiagramOutro =>
      'No futuro, planejamos expandir o sistema com papéis adicionais, como um jornalista investigativo ou um analista de risco legal.';

  @override
  String get techPromptsTitle => '3. INSTRUÇÕES COMPLETAS DOS AGENTES';

  @override
  String get techPromptsIntro =>
      'Abaixo estão os prompts completos que os modelos recebem, juntamente com comentários explicativos para o leitor. As respostas são retornadas imediatamente em 8 idiomas para a localização completa do Lustra, então omitimos toda a estrutura de resposta JSON para legibilidade.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Modelo: Gemini Flash (padrão) / Pro (para <20k tokens)';

  @override
  String get techGeneralizerCode =>
      '// CONFIGURAÇÃO DO MODELO\n// A definição do papel é crítica. \"[country]\" é uma variável que estabiliza o modelo.\n// A perspectiva de um cidadão da Ucrânia (país em guerra) é diferente para os modelos da perspectiva de um cidadão da Bélgica (que pode, por exemplo, prestar mais atenção à burocracia).\n// Isso define todo o contexto de interpretação da \"importância\" de uma disposição.\nVocê é um especialista em leis de [country], [...]\n\n// METODOLOGIA CORE\n// Isso não é um \"pedido suave\". É uma instrução rígida para filtrar o ruído.\n// O modelo deve ignorar a política e procurar o impacto na carteira e na vida.\n[...] que tem a tarefa de analisar documentos de leis, resoluções e outros documentos legislativos, e depois preparar informações a partir deles de maneira acessível aos cidadãos. Seu objetivo é apresentar as informações de forma que os cidadãos possam avaliar por si mesmos o impacto da legislação em suas vidas, mesmo sem ter conhecimentos legislativos especializados. Concentre-se nos fatos e efeitos objetivos das mudanças introduzidas, evitando julgamentos de valor e opiniões pessoais. Todo jargão jurídico é proibido. Apresente as informações de maneira clara, concisa e envolvente, para que sejam compreensíveis para uma pessoa sem formação jurídica. Evite frases longas e complexas. Em vez de escrever \"o projeto visa a alteração do código tributário...\", escreva \"Mudanças nos impostos: novos alívios e obrigações para...\". Continue seu trabalho até resolver sua tarefa. Se não tiver certeza sobre o conteúdo gerado, analise o documento novamente – não adivinhe. Planeje bem sua tarefa antes de iniciá-la. No resumo e nos pontos-chave, se possível e justificado, destaque quais benefícios ou efeitos concretos (positivos ou negativos) a lei introduz para a vida cotidiana dos cidadãos, seus direitos e deveres, finanças pessoais, segurança e outras questões importantes (por ex. proibições e obrigações categóricas ou as alocações financeiras e territoriais concretas mais importantes).\n// RIGOR TÉCNICO JSON\n// O contêiner de backend é impiedoso. Ele não aceitará \"conversa fiada\".\n// Deve ser JSON limpo. Um erro em uma vírgula = falha e rejeição de tudo.\nAntes de retornar a resposta, verifique cuidadosamente se toda a estrutura JSON está 100% correta, incluindo todas as vírgulas, chaves, colchetes e aspas. JSON incorreto é inaceitável e impedirá o processamento do seu trabalho.\nAnalise cuidadosamente o texto do documento legal abaixo.\nEste é o conteúdo com base no qual você deve gerar o resumo e os pontos-chave:\n--- INÍCIO DO DOCUMENTO ---\n[DOCUMENT_TEXT]\n--- FIM DO DOCUMENTO --\n\n// ESTRUTURA DE OUTPUT (para 8 idiomas)\n// Deve ser preenchida perfeitamente. Cada chave é validada.\n// Se o modelo omitir por ex. \"fr_summary\" -> tudo vai para o lixo.\nLEMBRE-SE: Sua resposta DEVE ser exclusivamente um objeto JSON válido. Não adicione nenhum caractere adicional, comentário ou texto antes da tag \'OPEN_BRACE\' nem após a tag \'CLOSE_BRACE\'. Toda a resposta deve ser analisável como JSON.\nCom base no documento ACIMA, preencha a estrutura JSON abaixo: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Modelo: Flash Lite';

  @override
  String get techJudgeCode =>
      '// CONFIGURAÇÃO DO MODELO\n// É um modelo heurístico simples, então seu papel também deve ser simples. Não precisa \"entender\" a lei. Só precisa comparar dois conjuntos de dados. UMA TAREFA!\nPAPEL: Fact Checker.\nTAREFA: Compare SOURCE (original) e SUMMARY (resumo preparado por outra IA).\nSeu objetivo é detectar \"ENTIDADES FABRICADAS\" (Fabricated Entities) no SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// METODOLOGIA DE AVALIAÇÃO\n// Tivemos que definir regras rígidas, porque o Flash Lite se perdia com a abstração, então recebeu uma lista de verificação.\n// Instruções concretas reduzem o ruído de decisão do modelo.\nREGRAS DE AVALIAÇÃO:\n1. Verifique todos os NÚMEROS, DATAS e VALORES no SUMMARY. Se faltar algum na SOURCE -> is_valid: false.\n2. Verifique todos os SOBRENOMES, ORGANIZAÇÕES e LOCAIS no SUMMARY. Se faltar algum na SOURCE -> is_valid: false.\n3. Verifique todas as AÇÕES LEGAIS concretas. Se esse mecanismo não estiver na SOURCE -> is_valid: false.\n// EXCEÇÃO PARA ABSTRAÇÃO\n// Isso é crucial. Conceitos abstratos (por ex. \"aumento da burocracia\") frequentemente davam falsos positivos.\n// Tivemos que excluí-los da avaliação \"fabricated entity\", porque o Juiz rejeitava conclusões lógicas corretas.\nIMPORTANTE: Conceitos abstratos (por ex. \"transparência\", \"confiança\") são permitidos como conclusões.\n\n// ESTRUTURA DE OUTPUT e requisitos de formatação para estruturar a resposta.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nREQUISITOS DE FORMATAÇÃO:\n1. Responda EXCLUSIVAMENTE com um objeto JSON bruto.\n2. NÃO use blocos de código Markdown.\n3. NÃO adicione introduções ou explicações antes ou depois do JSON.\n4. O JSON deve ser correto e pronto para análise.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Modelo: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// CONFIGURAÇÃO DO MODELO\n// O Cirurgião não está lá para escrever. Ele está lá para cortar o câncer (as alucinações).\n// Deve manter a consistência com o \"Citizen Bias\" imposto pelo Generalizer.\n// Por esse motivo, é preciso passar para um grounding agressivo.\nVocê é um LEGISLATIVE SURGEON.\nSua tarefa é a auditoria e reparo do resumo (JSON) quanto à conformidade com o texto fonte (SOURCE).\n// MEGA IMPORTANTE. Ele não pode adicionar informações. Se fizesse isso – aumentamos o risco de alucinação, e ele não tem mais um juiz acima dele. Melhor resumos incompletos do que falsos.\nREGRA FUNDAMENTAL: \"NO NEW INFORMATION\" (nenhuma informação nova).\nO resumo só pode transformar as informações contidas na SOURCE (encurtar, traduzir, somar). Não pode gerar novas informações que não estejam na SOURCE.\n// PROCEDIMENTO DE VERIFICAÇÃO (WORKFLOW)\n// Forçamos o modelo a um processo de pensamento \"Frase por Frase\".\nPROCEDIMENTO DE VERIFICAÇÃO (execute para cada frase no JSON):\nPergunte a si mesmo: \"Posso apontar na SOURCE um fragmento concreto que confirme esta afirmação?\"\nSE A RESPOSTA FOR \"SIM\":\nA informação é confirmada por uma citação, um sinônimo ou um resultado matemático de dados no texto.\nDECISÃO: Deixe inalterado.\nSE A RESPOSTA FOR \"NÃO\":\nA informação não está no texto (é uma alucinação, conhecimento externo do modelo, superinterpretação ou extrapolação desnecessária).\nDECISÃO: Remova esta informação ou altere-a para que tenha cobertura no texto.\nSE A RESPOSTA FOR \"DEPENDE\":\nO texto não é claro e o resumo \"adivinha\" (por ex. dando um exemplo concreto para um termo geral).\nDECISÃO: Jogue seguro. Remova as suposições. Use a terminologia do texto.\n// CATEGORIAS DE RISCO\n// Estimadas com base em erros anteriores do Generalizer.\n// Damos a ele um \"mapa rodoviário\" de onde geralmente estão as minas.\nCATEGORIAS DE RISCO (atenção especial):\nDatas (início da vigência vs início do financiamento).\nNúmeros (valores concretos devem resultar do texto).\nSujeitos (quem faz o quê).\nEscopo (o que a lei cobre e o que não cobre).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nExclusivamente o objeto JSON reparado conforme a estrutura: (...)';

  @override
  String get techConclusionsTitle => '4. CONCLUSÕES EMPÍRICAS';

  @override
  String get techConclusionsIntro =>
      'À medida que o sistema se desenvolvia, foi necessário tomar decisões baseadas em observações e não em parâmetros dos modelos. Isso resultou em alguns insights bastante interessantes.';

  @override
  String get techConclusionATitle =>
      'A) Por que usar um modelo \"mais burro\"?';

  @override
  String get techConclusionABody =>
      'Os testes iniciais na lei polonesa, auditados por Claude e ChatGPT, mostraram que o Gemini Flash gerava os melhores resumos. Logo atrás estava o modelo Pro, que às vezes recebia uma classificação ligeiramente inferior devido a tirar conclusões de longo alcance ou omitir alguns detalhes. Paradoxalmente, o \"pensamento\" do modelo contribuía para uma qualidade de conteúdo ligeiramente pior. Conclusão? Quando o Pro recebe um texto curto e simples, ele começa a filosofar. Como resultado, pode omitir fatos-chave que considera óbvios demais. Ele também perde a estrutura JSON (esquece de fechar a chave) com muito mais frequência. Para resumos simples, a escolha é óbvia.';

  @override
  String get techConclusionBTitle => 'B) Então para que serve o Pro?';

  @override
  String get techConclusionBBody =>
      'Os problemas começam com documentos mais longos. Aqui, o modelo Pro lidera definitivamente, enquanto modelos mais fracos têm uma tendência muito maior a alucinações. Essas observações também são confirmadas por estudos científicos (Lost in the Middle). Isso força a necessidade de usar imediatamente o modelo Pro para documentos mais longos.';

  @override
  String get techConclusionCTitle => 'C) Eficácia';

  @override
  String get techConclusionCBody =>
      'Com base em experiências empíricas (centenas de tentativas, diferentes parlamentos), a taxa anti-alucinação é >99%. Para estimar o coeficiente com maior precisão, seriam necessários desembolsos financeiros adicionais (milhares ou dezenas de milhares de testes com os modelos mais fortes de empresas de IA concorrentes). Portanto, isso pode ser visto com cautela. A maioria das alucinações são erros menores, por ex., o uso da palavra \"humano\" em vez de \"deputado\" no resumo. O principal problema do sistema não são elas, mas uma generalização excessiva. Às vezes, o Generalizer criará um resumo correto, mas omitirá um ponto crítico que é muito importante para o debate público. No entanto, este é um compromisso que o sistema aceita neste momento, focado na eliminação total de alucinações. O tédio é mais seguro do que a mentira.';

  @override
  String get techFooterDate => 'Data de atualização Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3) License';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => 'Comprimento > 20k tokens?';

  @override
  String get techGraphNo => 'NÃO';

  @override
  String get techGraphYes => 'SIM';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => 'Resultado: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NÃO (Retry)';

  @override
  String get techGraphRepairLoop => 'Loop de reparo';

  @override
  String get techGraphRetryFlash => '< 2 erros: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 erros: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

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
    return 'Votar é uma escolha. Faz a tua aqui: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Perfil e histórico de votações: $deepLink';
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

  @override
  String get authErrorAppleFailed =>
      'O login com Apple falhou. Tente novamente.';

  @override
  String get continueWithApple => 'Continuar com Apple';

  @override
  String get homeSearchHint => 'Digite uma frase...';

  @override
  String get homeSearchButtonDeputies => 'Deputados';

  @override
  String get homeSearchButtonLegislations => 'Leis';

  @override
  String get actionSeeAll => 'Tudo';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Ativo para outro parlamento';

  @override
  String get votingResultsUSMotionToTableTitle =>
      'RESULTADOS: MOÇÃO DE REJEIÇÃO';

  @override
  String get crowdfundingLabel =>
      'Apoie o Lustra para que continue sendo uma fonte independente:';

  @override
  String get hashtagLaw => 'Lei';

  @override
  String get hashtagPolitician => 'Político';

  @override
  String get statusIntroduced => 'Apresentado';

  @override
  String get statusPassedHouse => 'Aprovado na Câmara';

  @override
  String get statusPassedSenate => 'Aprovado no Senado';

  @override
  String get statusBecameLaw => 'Tornou-se lei';

  @override
  String get statusVetoed => 'Vetado';

  @override
  String get statusFailed => 'Reprovado';

  @override
  String get statusPlacedOnCalendar => 'Colocado no calendário';

  @override
  String get actionBack => 'Voltar';

  @override
  String get actionViewSourceJson =>
      'Logs de trabalho da IA para este documento';

  @override
  String get manualEmailDialogTitle => 'Enviar mensagem manualmente';

  @override
  String get manualEmailDialogDescription =>
      'Nenhum cliente de e-mail detectado. Copie os dados abaixo e envie-os você mesmo.';

  @override
  String get labelRecipient => 'Destinatário';

  @override
  String get labelSubject => 'Assunto';

  @override
  String get labelBody => 'Corpo da mensagem';

  @override
  String get actionCopy => 'Copiar';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get webBannerDownloadMessage =>
      'Para aproveitar todas as funcionalidades, baixe o aplicativo!';

  @override
  String get webBannerDownloadButton => 'Baixar';

  @override
  String get supportStripeButton => 'Apoiar (Stripe)';

  @override
  String get supportFounderMessage =>
      'Não há uma grande corporação por trás deste projeto, apenas eu e meu laptop. Construí isso porque acredito que tal tecnologia deve existir e permanecer 100% independente do capital, que sempre dita a narrativa. Este é meu presente para o mundo.';

  @override
  String get civicProjectTitle => 'Projeto Cívico';

  @override
  String get drafterAuthRequired =>
      'Autenticação necessária. Faça login no Lustra primeiro.';

  @override
  String get drafterLaunchError => 'Falha ao iniciar o Gateway Drafter:';

  @override
  String get drafterButtonTitle =>
      'USE O LUSTRA DRAFTER PARA CRIAR UMA LEI A PARTIR DE UMA IDEIA EM 5 MINUTOS';

  @override
  String get submitCivicProjectButton => 'Crie o seu projeto';

  @override
  String get civicThresholdCandidate => 'Precisa de revisão.';

  @override
  String get statusInitiative => 'Iniciativa';

  @override
  String get civicTitle => 'Projetos Cívicos';

  @override
  String get civicIncubatorTitle => 'Incubadora de Projetos Cívicos';

  @override
  String get civicSubtitle => 'Desenhando o futuro da democracia, juntos.';

  @override
  String get civicSection1Title => '1. Regras do Programa e Governança';

  @override
  String get civicSection1Intro =>
      'Lustra fornece aos cidadãos infraestrutura legislativa. Tratamos suas ideias com a mesma seriedade dos projetos de lei governamentais. Para garantir qualidade, aplicam-se regras estritas:';

  @override
  String get civicProcessTitle => 'O Processo';

  @override
  String get civicRuleSubmissionTitle => 'Submissão:';

  @override
  String get civicRuleSubmissionText =>
      'Você envia um rascunho via e-mail/formulário.';

  @override
  String get civicRuleReviewTitle => 'Revisão Formal (Humana):';

  @override
  String get civicRuleReviewText =>
      'Verificamos a conformidade com o Padrão LDS-1. Filtramos rigorosamente discurso de ódio, spam, duplicatas e conteúdo não legislativo.';

  @override
  String get civicRuleAiTitle => 'Esterilização por IA:';

  @override
  String get civicRuleAiText =>
      'Rascunhos aprovados são processados por nossa IA para remover linguagem emocional e extrair fatos centrais.';

  @override
  String get civicRulePublicationTitle => 'Publicação:';

  @override
  String get civicRulePublicationText =>
      'O projeto recebe um \"Cartão de Lei Cívica\" no app, visualmente igual à legislação governamental.';

  @override
  String get civicWarningTitle => 'Integridade do Projeto';

  @override
  String get civicWarningText =>
      'O texto principal é inalterável. Podes apenas adicionar emendas para refinar ou corrigir o texto sem alterar a sua ideia original. Todas as alterações são públicas e adicionadas como anexos para garantir a confiança.';

  @override
  String get civicPoliciesTitle => 'Políticas Críticas';

  @override
  String get civicPolicyPublicDomainTitle => 'Domínio Público (CC0):';

  @override
  String get civicPolicyPublicDomainText =>
      'Ao enviar um projeto, você renuncia a todos os direitos autorais. A lei pertence a todos.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anti-Astroturfing:';

  @override
  String get civicPolicyAstroturfingText =>
      'Você deve declarar se representa uma organização. Lobby oculto resulta em banimento permanente.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam:';

  @override
  String get civicPolicyAdPersonamText =>
      'Projetos visando indivíduos específicos (difamação) são rejeitados imediatamente.';

  @override
  String get civicPolicyTrashTitle => 'Sem Lixeira:';

  @override
  String get civicPolicyTrashText =>
      'Lustra não é um fórum. Rascunhos de baixa qualidade, duplicatas e manifestos são rejeitados na entrada.';

  @override
  String get civicSection2Title => '2. Padrão Legislativo Lustra (LDS-1)';

  @override
  String get civicSection2Intro =>
      'Seu rascunho deve seguir esta estrutura. Se parecer um post de blog, será rejeitado.';

  @override
  String get civicStructureTitle => 'Estrutura Necessária:';

  @override
  String get civicStructureTitleItem => 'Título:';

  @override
  String get civicStructureTitleText => 'Descritivo e neutro.';

  @override
  String get civicStructureArticlesItem => 'Artigos:';

  @override
  String get civicStructureArticlesText =>
      'Texto dividido em unidades numeradas (Art. 1, Art. 2...) contendo mecanismos específicos (proibições, mandatos).';

  @override
  String get civicStructureExposeItem => 'Exposição de Motivos (Exposé):';

  @override
  String get civicStructureExposeText => 'Seção obrigatória explicando:';

  @override
  String get civicExposePoint1 => '• (1) Diagnóstico do problema.';

  @override
  String get civicExposePoint2 => '• (2) Objetivo da regulação.';

  @override
  String get civicExposePoint3 => '• (3) Impacto social esperado.';

  @override
  String get civicSection3Title => '3. Pontuação de Prontidão Lustra';

  @override
  String get civicSection3Intro =>
      'Não julgamos suas opiniões políticas. Julgamos a qualidade da construção. Nossa IA analisa cada rascunho em uma escala de 0-100:';

  @override
  String get civicScoreStructureTitle => 'Estrutura (30 pts):';

  @override
  String get civicScoreStructureText =>
      'Formatação legal correta e linguagem precisa.';

  @override
  String get civicScoreExposeTitle => 'Completude da Exposição (30 pts):';

  @override
  String get civicScoreExposeText =>
      'Clareza da definição do problema/solução.';

  @override
  String get civicScoreLogicTitle => 'Lógica Interna (20 pts):';

  @override
  String get civicScoreLogicText => 'Ausência de contradições.';

  @override
  String get civicScoreImpactTitle => 'Análise de Impacto (20 pts):';

  @override
  String get civicScoreImpactText =>
      'Viabilidade e identificação de grupos afetados.';

  @override
  String get civicThresholdsTitle => 'Limiares:';

  @override
  String get civicThresholdRejected => 'Rejeitado / Devolvido.';

  @override
  String get civicThresholdReady => 'Publicação prioritária.';

  @override
  String get civicSection4Title =>
      '4. Kit de Ferramentas do Criador (Copiar e Colar)';

  @override
  String get civicSection4Intro =>
      'Use este modelo para garantir que seu projeto atenda ao Padrão LDS-1.';

  @override
  String get civicTemplateCode =>
      'TÍTULO: [Insira Título Descritivo Aqui]\n\nPREÂMBULO: [Opcional: Reconhecendo que...]\n\nCAPÍTULO I: DISPOSIÇÕES GERAIS\nArt. 1. O objetivo desta Lei é [Inserir Objetivo].\nArt. 2. Esta Lei aplica-se a [Inserir Escopo].\n\nCAPÍTULO II: [MECANISMO PRINCIPAL / PROIBIÇÕES]\nArt. 3. \n1. É proibido [Ação].\n2. Entidades são obrigadas a [Ação].\n\nCAPÍTULO III: SANÇÕES & DISPOSIÇÕES FINAIS\nArt. X. Violação do Art. 3 é punível com [Sanção].\nArt. Y. Esta Lei entra em vigor em [Data].\n\n---\nEXPOSIÇÃO DE MOTIVOS (EXPOSÉ)\n\n1. O PROBLEMA\n[Descreva a situação atual e por que está falhando.]\n\n2. O OBJETIVO\n[Explique o que esta lei conserta e como.]\n\n3. IMPACTO ESPERADO\n[Descreva as consequências sociais, econômicas ou legais.]';

  @override
  String get civicSubmitButton => 'ENVIAR RASCUNHO (EMAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Iniciativa Lustra.\nInfraestrutura para a Era Cívica.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[Submissão LDS-1] Título do Projeto - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[COLE SEU MODELO AQUI]\n\nAutor / Organização:\nInfo Contato:\n';

  @override
  String get civicEmailDialogTitle => 'Cliente de Email Não Encontrado';

  @override
  String get civicEmailDialogIntro =>
      'Por favor, copie os detalhes abaixo e envie manualmente:';

  @override
  String get civicEmailDialogRecipient => 'Destinatário';

  @override
  String get civicEmailDialogSubject => 'Assunto';

  @override
  String get civicEmailDialogBody => 'Corpo';

  @override
  String get civicCopiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get civicTemplateCopied => 'Modelo copiado!';

  @override
  String get supportMegaTitle => 'Propriedade Cidadã';

  @override
  String get verificationRequiredTitle => 'Verificação necessária';

  @override
  String get verificationRequiredContent =>
      'Para contabilizar seu voto no ranking, precisamos confirmar que você é humano.\n\nVerifique sua caixa de entrada (incluindo a pasta de SPAM).';

  @override
  String get verificationResendLink => 'Reenviar link';

  @override
  String get verificationLinkSentSuccess => 'Link reenviado!';

  @override
  String get verificationAlreadyConfirmed => 'Já confirmei';

  @override
  String get verificationSuccessVotingUnlocked =>
      'Obrigado! Você já pode votar.';

  @override
  String get verificationStillNotVerified =>
      'Confirmação não encontrada ainda. Tente novamente em um instante.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get pollVoteSignificance => 'O teu voto é apenas o início.';

  @override
  String get pollShareImpact =>
      'Os algoritmos muitas vezes silenciam-nos. A tua única partilha chega a uma média de 50-300 pessoas. Ajuda-nos a quebrar a bolha das redes sociais.';

  @override
  String get pollShareAction => 'Partilhar e amplificar a voz dos cidadãos';

  @override
  String get listRefreshed => 'Lista atualizada!';

  @override
  String get errorNoDataReturned => 'Nenhuns dados devolvidos';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'Tens de iniciar sessão para subscrever.';

  @override
  String get subscribedToList => 'Subscrito na lista!';

  @override
  String get unsubscribedFromList => 'Subscrição cancelada.';

  @override
  String get errorListRemovedByOwner => 'Lista removida pelo proprietário...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Falha ao atualizar a subscrição.';

  @override
  String get notificationSentCooldownActive =>
      'Notificação enviada aos subscritores!...';

  @override
  String get errorCooldownActiveNotification =>
      'Bloqueio ativo. Podes enviar...';

  @override
  String get errorFailedToSendNotification => 'Falha ao enviar a notificação.';

  @override
  String get nameYourCuratorList => 'Nomeia a tua Lista de Autor';

  @override
  String get hintCuratorListExample => 'ex. A minha política económica';

  @override
  String listCreatedSuccess(String text) {
    return 'Lista \'$text\' criada!';
  }

  @override
  String get errorFailedToCreateList => 'Falha ao criar a lista.';

  @override
  String get actionCreate => 'Criar';

  @override
  String get unnamedList => 'Lista sem nome';

  @override
  String get tooltipEditList => 'Editar Lista';

  @override
  String get addDescriptionHint => 'Adiciona uma descrição...';

  @override
  String subscribersCount(int subs) {
    return '$subs subscritores';
  }

  @override
  String get actionShareList => 'Partilhar Lista';

  @override
  String get actionSupportCreator => 'Apoiar o Criador';

  @override
  String availableInHours(int hoursLeft) {
    return 'Disponível em ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Notificar Subscritores';

  @override
  String get actionSubscribed => 'Subscrito';

  @override
  String get actionSubscribe => 'Subscrever';

  @override
  String get tooltipReportList => 'Denunciar Lista';

  @override
  String get tooltipDeleteList => 'Apagar Lista';

  @override
  String get draftYourCivicProject => 'Elabore seu próprio projeto cidadão';

  @override
  String get draftCivicProjectDescription =>
      'Transforme suas ideias em projetos de lei reais e reúna apoio. O Lustra está pronto para as suas políticas.';

  @override
  String get createYourOwnList => 'Crie sua própria lista';

  @override
  String get createYourOwnListDescription =>
      'Torne-se um curador. Selecione projetos de lei importantes, convide seguidores e envie notificações para seus dispositivos para mantê-los informados sobre mudanças em sua lista de legislação ou projetos cidadãos.';

  @override
  String get editListDetails => 'Editar Detalhes';

  @override
  String get listNameLabel => 'Nome da Lista';

  @override
  String get descriptionOptionalLabel => 'Descrição (Opcional)';

  @override
  String get supportCreatorOptionalLabel => 'Apoiar o Criador (Opcional)';

  @override
  String providerUsernameLabel(String provider) {
    return 'Nome de utilizador $provider';
  }

  @override
  String get listUpdatedSuccess => 'Lista atualizada!';

  @override
  String get errorFailedToUpdate => 'Falha ao atualizar.';

  @override
  String get actionSave => 'Guardar';

  @override
  String get deleteListDialogTitle => 'Apagar Lista?';

  @override
  String get deleteListDialogBody => 'Esta ação é irreversível...';

  @override
  String get listDeletedSuccess => 'Lista apagada.';

  @override
  String get errorFailedToDelete => 'Falha ao apagar.';

  @override
  String get actionDelete => 'Apagar';

  @override
  String get syncingCuratedFeed => 'A SINCRONIZAR LISTA DE AUTOR...';

  @override
  String get actionTryAgain => 'Tentar Novamente';

  @override
  String get tooltipSetAsListCover => 'Definir como capa';

  @override
  String get coverUpdatedSuccess => 'Capa atualizada!';

  @override
  String get errorUpdatingCover => 'Erro ao atualizar a capa.';

  @override
  String get loaderLoadingProfile => 'A CARREGAR PERFIL...';

  @override
  String get loaderRetrievingVoteLogs => 'A RECUPERAR REGISTOS DE VOTO...';

  @override
  String get loaderLoadingRecentVotes => 'A CARREGAR VOTOS RECENTES...';

  @override
  String get loaderFetchingData => 'A OBTER DADOS...';

  @override
  String get loaderLoadingTrackedBills => 'A CARREGAR LEIS ACOMPANHADAS...';

  @override
  String get emptyTrackedBills => 'Ainda não acompanhas nenhuma lei.';

  @override
  String get notificationsMobileOnly =>
      'Notificações disponíveis apenas na app.';

  @override
  String get titleYourTrackedBills => 'Leis Acompanhadas';

  @override
  String get buttonSeeAllTracked => 'Ver tudo';

  @override
  String get titleNameYourList => 'Nomeia a tua Lista';

  @override
  String get hintEgMySocialPolicies => 'ex. As Minhas Políticas Sociais';

  @override
  String snackbarListCreated(String text) {
    return 'Lista \'$text\' criada!';
  }

  @override
  String get snackbarFailedToCreateList => 'Falha ao criar lista.';

  @override
  String get buttonCreate => 'Criar';

  @override
  String get titleRenameYourList => 'Renomear Lista';

  @override
  String get snackbarListRenamed => 'Lista renomeada!';

  @override
  String get snackbarFailedToRenameList => 'Falha ao renomear.';

  @override
  String get buttonSave => 'Guardar';

  @override
  String get titleYourLists => 'As tuas Listas';

  @override
  String get emptyNoListsYet => 'Ainda não tens listas.';

  @override
  String get tooltipRename => 'Renomear';

  @override
  String get snackbarErrorUpdatingList => 'Erro ao atualizar.';

  @override
  String get tooltipShareList => 'Partilhar Lista';

  @override
  String get buttonCreateNewList => 'Criar Nova Lista';

  @override
  String get errorLimitOf3ListsReached => 'Limite de 3 listas atingido.';

  @override
  String get snackbarFailedToDelete => 'Falha ao apagar.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'A OBTER DADOS DO PARLAMENTO ESPELHO...';

  @override
  String get loaderSecuringSafeChannel => 'A ENCRIPTAR A LIGAÇÃO...';

  @override
  String get snackbarAddedToList => 'Adicionado à sua lista.';

  @override
  String get snackbarRemovedFromList => 'Removido da tua lista.';

  @override
  String get loaderLoadingData => 'A CARREGAR DADOS...';

  @override
  String get buttonAddToList => 'Adicionar à Lista';

  @override
  String get previousStatusLabel => 'Anteriormente:';

  @override
  String get statusLabel => 'Estado:';

  @override
  String get loaderEstablishingConnection => 'A ESTABELECER LIGAÇÃO...';

  @override
  String get loaderFetchingInitiatives => 'A OBTER INICIATIVAS...';

  @override
  String get loaderLoadingMoreInitiatives => 'A CARREGAR MAIS INICIATIVAS...';

  @override
  String get loaderLoadingMore => 'A CARREGAR MAIS...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Tens de iniciar sessão. Cria uma conta.';

  @override
  String get loaderLoadingYourTrackedList =>
      'A CARREGAR A TUA LISTA DE ACOMPANHAMENTO...';

  @override
  String get emptyNotTrackingAnything => 'Ainda não acompanhas nada.';

  @override
  String get loaderLoadingLegislativeData => 'A CARREGAR DADOS LEGISLATIVOS...';

  @override
  String get loaderAuthorizing => 'A AUTORIZAR...';

  @override
  String get loaderLoading => 'A CARREGAR...';

  @override
  String get snackbarLinkCopied => 'Link copiado para a área de transferência!';

  @override
  String get civicWillRecord => 'REGISTO DA VONTADE CÍVICA';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes VOTOS REGISTADOS';
  }

  @override
  String get recordYourPositionForAudit =>
      'Regista a tua posição para auditoria.';

  @override
  String get privateList => 'Lista Privada';

  @override
  String get loaderLoadingCuratedFeed => 'A CARREGAR LISTA DE AUTOR...';

  @override
  String get buttonOpenFullList => 'Abrir Lista Completa';

  @override
  String get filtersLabel => 'Filtros';

  @override
  String get statusFilterLabel => 'Estado';

  @override
  String get onlyWithSourceTextLabel => 'Apenas com texto fonte';

  @override
  String get trackedBillsTitle => 'Leis Acompanhadas';

  @override
  String get curatedListTitle => 'Lista Privada';

  @override
  String get loaderLoadingProfiles => 'A CARREGAR PERFIS...';

  @override
  String get loaderLoadingMoreProfiles => 'A CARREGAR MAIS PERFIS...';

  @override
  String get loaderInitializingMirrorParliament =>
      'A INICIALIZAR PARLAMENTO ESPELHO...';

  @override
  String get loaderSyncingVectors => 'A SINCRONIZAR VETORES...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Incluir diagnóstico do sistema';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Anexa o estado ativo (Parlamento, Legislatura, Alvo) para nos ajudar a corrigir o erro.';

  @override
  String get loaderSendingReport => 'A ENVIAR RELATÓRIO...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Principal: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Criar Outra Lista';

  @override
  String get buttonCreateTrackingList => 'Criar Lista de Acompanhamento';

  @override
  String get errorMissingListId => 'Erro: ID da Lista em falta';

  @override
  String get actionTracked => 'Acompanhado';

  @override
  String get actionTrack => 'Acompanhar';

  @override
  String pollSupportPercent(String percent) {
    return 'A FAVOR $percent%';
  }

  @override
  String get pollSyncing => 'A SINCRONIZAR...';

  @override
  String pollOpposePercent(String percent) {
    return 'CONTRA $percent%';
  }

  @override
  String get pollPositionRecorded => 'POSIÇÃO REGISTADA';

  @override
  String get pollRestrictedToCitizens => 'RESTRITO A CIDADÃOS';

  @override
  String yourListsForCountry(String countryName) {
    return 'As tuas Listas ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Envolva-se';

  @override
  String get errorLaunchUrl => 'Não foi possível abrir o link';

  @override
  String get infoTechTitle => 'Como a Tecnologia Funciona';

  @override
  String get infoTechSubtitle =>
      'Aprenda sobre nossa arquitetura, esterilização de dados e princípios de civic tech.';

  @override
  String get infoGovTitle => 'Transparência e Governança';

  @override
  String get infoGovSubtitle =>
      'Quem constrói isso, quem paga por isso e para onde vamos.';

  @override
  String get infoPrivacyTitle => 'Constituição e Privacidade';

  @override
  String get infoPrivacySubtitle =>
      'Transparência radical. Exatamente quais dados coletamos e por quê.';

  @override
  String get manualTitle => 'Manual Aberto do Cidadão';

  @override
  String get manualSubtitle => 'Aprenda a recuperar a agência na democracia.';

  @override
  String get howToActTitle => 'Como agir com o Lustra';

  @override
  String get actAuditTitle => 'Auditoria Cidadã';

  @override
  String get actAuditSubtitle =>
      'Vote em políticas e leis para moldar a hierarquia de tópicos e deixar evidências sólidas da Vontade Cidadã. Não deixe a mídia desviar a conversa.';

  @override
  String get actWatchlistTitle => 'Listas de Acompanhamento';

  @override
  String get actWatchlistSubtitle =>
      'Crie listas de projetos de lei para reunir assinantes e aumentar a conscientização. Use as mídias sociais como poder de lobby.';

  @override
  String get actDraftTitle => 'Elaborar Projetos Cidadãos';

  @override
  String get actDraftSubtitle =>
      'Envie suas próprias iniciativas ao Lustra. A sociedade moderna precisa de novas ideias que não sejam bloqueadas pelo capital.';

  @override
  String get joinCommunityTitle => 'Junte-se à Comunidade';

  @override
  String get subscribedLists => 'Inscrito';

  @override
  String get snackbarAddedToListWebPromo =>
      'Adicionado! Baixe o aplicativo para receber notificações sobre este projeto.';

  @override
  String get aboutGovAppBar => 'Governança';

  @override
  String get aboutGovTitle => 'Transparência e Governança';

  @override
  String get aboutGovSubtitle => 'Quem constrói, quem paga e para onde vamos.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'ARQUITETO SOLO / FUNDADOR';

  @override
  String get aboutGovFounderP1 =>
      'Não sou político, advogado ou acadêmico. Não tenho credenciais formais. Há 18 meses, eu trabalhava com limpeza. Passei todo o ano de 2025 desempregado, construindo este sistema do zero em um laptop de 2016.';

  @override
  String get aboutGovFounderP2 =>
      'Por quê? Porque eu estava frustrado com o fato de bilionários e corporações terem melhores ferramentas de dados do que os cidadãos. Frustrado com o distanciamento da lei dos cidadãos e com as guerras de narrativas travadas pela mídia, que alienam as pessoas da política ou as forçam a escolher um lado. Aprendi tudo sozinho para construir um Parlamento Espelho (Mirror Parliament). Não acredito em petições online; acredito em transparência dura, baseada em dados e acessibilidade. E que a democracia precisa de uma atualização.';

  @override
  String get aboutGovFounderP3 =>
      'Você pode perguntar: \"Por que devo confiar em você?\". Não confie em ninguém, especialmente na política - comece a auditar.';

  @override
  String get aboutGovSec1Title => '1. Financiamento e Infraestrutura';

  @override
  String get aboutGovSec1Intro =>
      'Não há capital de risco (VC). Não há dinheiro obscuro. Não há criptomoedas. Atualmente, esta operação é totalmente financiada com recursos próprios (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infraestrutura:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Coberta por um subsídio de US\$ 2.000 em créditos do programa Google For Startups. Atualmente, temos cerca de US\$ 1.200 restantes, o que nos dá aproximadamente 12 meses de sobrevida de servidor.';

  @override
  String get aboutGovSec1Bullet2Title => 'Custo de vida:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Sustentado inteiramente pelas minhas economias pessoais, minha noiva e minha família.';

  @override
  String get aboutGovSec1Bullet3Title => 'Stack Tecnológico:';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Construído sozinho (Flutter, Firebase, pipeline Vertex AI, Node.js) para manter os custos operacionais próximos a zero.';

  @override
  String get aboutGovSec2Title => '2. Entidade Legal Atual e a Transição';

  @override
  String get aboutGovSec2P1 =>
      'Lustra está atualmente incubada sob minha antiga empresa polonesa (FO&WO VENTURES SP. Z O.O.). Esta é uma necessidade legal. Para publicar na Apple/Google App Stores e receber os créditos de startup do Google, é necessária uma empresa registrada com um número DUNS. Ainda não posso arcar com as despesas legais para iniciar uma Fundação (mais de US\$ 500 para abertura e contabilidade mensal), então uso o veículo legal mais enxuto possível.';

  @override
  String get aboutGovSec2BoxTitle =>
      'O Caminho para uma Organização Sem Fins Lucrativos:';

  @override
  String get aboutGovSec2BoxText =>
      'Assim que atingirmos liquidez financeira e massa crítica (aprox. 100 mil usuários mensais), planejo abrir uma Organização Sem Fins Lucrativos formal e transferir toda a propriedade intelectual e infraestrutura para lá.';

  @override
  String get aboutGovSec2P2 =>
      'O objetivo final é uma estrutura de governança democrática. As decisões serão tomadas por um conselho eleito pela comunidade. Meu papel será estritamente limitado à manutenção técnica do backend. Não vejo outro futuro para Lustra além de uma operação sem fins lucrativos com total transparência de todos os documentos financeiros.';

  @override
  String get aboutGovSec3Title => '3. Segurança e Código-Fonte';

  @override
  String get aboutGovSec3Bullet1Title => 'Autenticação:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'Não tocamos nas suas senhas. Usamos o Auth do Google/Apple porque a infraestrutura de segurança deles é superior. Armazenamos apenas um User ID anonimizado e o seu Vote ID para evitar fazendas de bots.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Código Disponível (Source Available):';

  @override
  String get aboutGovSec3Bullet2Text =>
      'Os repositórios principais são públicos sob a Licença Open Source (AGPLv3). Estão protegidos contra clonagem corporativa, mas os adaptadores de dados, os prompts de sistema de IA e a lógica são totalmente visíveis para auditoria.';

  @override
  String get aboutGovSec3BoxTitle => 'Precisamos de ajuda.';

  @override
  String get aboutGovSec3BoxText =>
      'Sou um cara com um laptop velho, fazendo tudo. Se você é um desenvolvedor, um jornalista ou um cidadão que quer ajudar a estabelecer células locais no seu país — entre em contato.';

  @override
  String get aboutGovSec3Contact => 'Contato: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'Perfil no GitHub';

  @override
  String get termsAppBar => 'Constituição e Privacidade';

  @override
  String get termsTitle => 'Constituição e Privacidade';

  @override
  String get termsLastUpdated => 'Última atualização: 12 de março de 2026';

  @override
  String get termsAlertTitle =>
      'Transparência Radical: O que realmente coletamos';

  @override
  String get termsAlertP1 =>
      'Você deve estar pensando: \"Não vou dar meus dados para pessoas aleatórias\". Nós concordamos. É por isso que não queremos a sua vida pessoal. Só queremos verificar se você é um ser humano real votando em leis reais.';

  @override
  String get termsAlertP2 =>
      'Aqui está a estrutura exata de dados que armazenamos para o seu perfil de usuário no nosso banco de dados Google Cloud Firestore. Sem campos ocultos. Sem cookies de rastreamento.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Gerado pelo Firebase Auth\n  \'email\': \'cidadao@example.com\', // Seus únicos dados pessoais\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Para atualizações do projeto (opcional)\n  \'primaryParliamentId\': \'Congresso Nacional do Brasil\'\n]';

  @override
  String get termsAlertH4 =>
      'Espere, onde estão os meus votos e as leis que acompanho?';

  @override
  String get termsAlertP3 =>
      'Para proteger sua privacidade e garantir que nosso banco de dados escale de forma eficiente, suas interações são fragmentadas (sharded) e separadas do seu perfil principal:';

  @override
  String get termsAlertB1Title => 'Leis Monitoradas:';

  @override
  String get termsAlertB1Text =>
      'Armazenadas em uma subcoleção privada. Apenas você (e o seu dispositivo) podem solicitar para ver a lista de leis que você está monitorando.';

  @override
  String get termsAlertB2Title => 'Seus Votos (Hashing Criptográfico):';

  @override
  String get termsAlertB2Text =>
      'Quando você vota, NÓS NÃO vinculamos o seu UID diretamente ao registro público de votação. Em vez disso, o servidor gera um Hash criptográfico (ex: a1b2c3d4...) usando um \"salt\" secreto do servidor. Isso pseudonimiza fortemente o seu voto. Se um hacker roubar o banco de dados, ele não poderá ver quem votou em quê. Embora seja matematicamente uma função unilateral, no espírito da transparência absoluta, você deve saber que os operadores do sistema (que detêm o salt secreto) poderiam teoricamente verificar um voto para auditar o sistema contra fraudes ou cumprir uma ordem judicial válida. No entanto, os seus votos são estritamente separados do seu perfil diário e nunca são exibidos publicamente com a sua identidade.';

  @override
  String get termsAlertP4 =>
      'É isso. O resto é análise anônima (Firebase Analytics) para corrigir bugs e App Check para evitar que fazendas de bots manipulem as votações. Não vendemos dados. Não exibimos anúncios.';

  @override
  String get termsTocTitle => 'Índice';

  @override
  String get termsPart1Title =>
      'Parte 1: Política de Privacidade (Minimização de Dados)';

  @override
  String get termsPart1Intro =>
      'Não negociamos a sua atenção. Coletamos apenas o que é tecnicamente necessário para operar uma infraestrutura cívica segura.';

  @override
  String get termsP1S1Title => '1. Controlador de Dados';

  @override
  String get termsP1S1Text =>
      'O operador legal é temporariamente FO&WO VENTURES SP. Z O.O. (LLC), com sede em Wrocław, Polônia. Contato: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. O Que Coletamos';

  @override
  String get termsP1S2B1Title => 'Conta (Email/UID):';

  @override
  String get termsP1S2B1Text =>
      'Necessário para login seguro via Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Votos e Enquetes (Anonimizados):';

  @override
  String get termsP1S2B2Text =>
      'Seus votos constroem as estatísticas. Eles são vinculados à sua conta puramente para evitar fazendas de bots e votação dupla. Publicamente, seus votos são exibidos APENAS como agregados anônimos. O registro real do voto é criptograficamente fragmentado (hashed) para separar sua identidade da sua escolha política.';

  @override
  String get termsP1S2B3Title => 'Leis Monitoradas e Notificações Push:';

  @override
  String get termsP1S2B3Text =>
      'Se você optar por monitorar uma lei ou assinar uma Lista Curada, usamos os Tópicos do Firebase Cloud Messaging (FCM) do Google. Isso nos permite enviar notificações push sobre alterações de status sem rastrear constantemente sua localização ou identidade do dispositivo.';

  @override
  String get termsP1S2B4Title => 'Retenção de Votos:';

  @override
  String get termsP1S2B4Text =>
      'Os dados de votação são armazenados durante a legislatura do parlamento mais 5 anos para fins de arquivo e pesquisa.';

  @override
  String get termsP1S2B5Title => 'Comunicação:';

  @override
  String get termsP1S2B5Text =>
      'Se você consentir explicitamente, enviaremos atualizações do projeto por e-mail. Você pode retirar o consentimento a qualquer momento.';

  @override
  String get termsP1S2B6Title => 'Projetos Cidadãos:';

  @override
  String get termsP1S2B6Text =>
      'O conteúdo dos projetos legislativos enviados por você é totalmente público.';

  @override
  String get termsP1S2Highlight =>
      '3. O QUE NÃO FAZEMOS:\n\n❌ NÃO vendemos dados para corretores de dados.\n❌ NÃO usamos rastreamento de anúncios.\n❌ NÃO criamos o seu perfil político para fins comerciais.';

  @override
  String get termsP1S3Title => '4. Infraestrutura e Segurança';

  @override
  String get termsP1S3B1Title => 'Localização:';

  @override
  String get termsP1S3B1Text =>
      'Os dados são hospedados de forma segura no Google Cloud Platform, Europe-West9 (Paris).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'Usamos o Firebase App Check para verificar a autenticidade do aplicativo e evitar manipulações automatizadas.';

  @override
  String get termsP1S3B3Title => 'Privacidade de IA:';

  @override
  String get termsP1S3B3Text =>
      'Enviamos apenas documentos governamentais públicos aos modelos de IA para resumo. Seus dados privados NUNCA vão para a IA.';

  @override
  String get termsP1S4Title => '5. Crianças e Exclusão de Conta';

  @override
  String get termsP1S4P1 =>
      'O serviço destina-se a usuários com mais de 16 anos. Não coletamos intencionalmente dados de crianças.';

  @override
  String get termsP1S4P2 =>
      'Para excluir seus dados: Use o botão \"Excluir Conta\" diretamente nas configurações do aplicativo para remover imediatamente seus dados de identificação, e-mail e todas as suas subcoleções dos nossos servidores.';

  @override
  String get termsP1S5Title => '6. Seus Direitos';

  @override
  String get termsP1S5Text =>
      'De acordo com o GDPR, você tem o direito de acessar, retificar, excluir e se opor ao processamento dos seus dados. Contate-nos através do e-mail fornecido acima.';

  @override
  String get termsPart2Title =>
      'Parte 2: Regras da Comunidade (Termos de Serviço)';

  @override
  String get termsP2S1Title => '1. Operador e Missão';

  @override
  String get termsP2S1Text =>
      'Lustra é uma infraestrutura pública digital. A empresa atua como incubadora: não paga dividendos, não tem investidores externos e reinveste qualquer receita diretamente na manutenção da infraestrutura.';

  @override
  String get termsP2S2Title => '2. Código e Licença (Source Available)';

  @override
  String get termsP2S2Intro =>
      'O código de Lustra é um bem comum protegido da exploração corporativa.';

  @override
  String get termsP2S2B1Title => 'Modelo:';

  @override
  String get termsP2S2B1Text => 'Licença Open Source (AGPLv3).';

  @override
  String get termsP2S2B2Title => 'Permitido:';

  @override
  String get termsP2S2B2Text =>
      'Uso educacional, de pesquisa e sem fins lucrativos/cívico.';

  @override
  String get termsP2S2B3Title => 'Proibido:';

  @override
  String get termsP2S2B3Text =>
      'Corporações não podem usar ou lucrar com o nosso trabalho sem o consentimento explícito da comunidade.';

  @override
  String get termsP2S3Title => '3. Roadmap de Governança';

  @override
  String get termsP2S3Intro =>
      'Nosso objetivo de longo prazo é a descentralização total.';

  @override
  String get termsP2S3B1Title => 'Estado atual:';

  @override
  String get termsP2S3B1Text => 'O Fundador atua como Arquiteto Principal.';

  @override
  String get termsP2S3B2Title => 'Em breve:';

  @override
  String get termsP2S3B2Text =>
      'Estabelecimento de um Conselho Cívico eleito diretamente pelos usuários.';

  @override
  String get termsP2S3B3Title => 'Objetivo:';

  @override
  String get termsP2S3B3Text =>
      'Implementar mecanismos técnicos e legais para que a comunidade assuma o controle da plataforma em caso de traição da missão.';

  @override
  String get termsP2S4Title =>
      '4. Programa de Projetos Cidadãos (Incubadora de Leis)';

  @override
  String get termsP2S4Intro =>
      'Fornecemos um espaço para os cidadãos escreverem as leis.';

  @override
  String get termsP2S4B1Title => 'Procedimento:';

  @override
  String get termsP2S4B1Text =>
      'Os projetos são enviados via formulário e verificados formalmente pelo Operador.';

  @override
  String get termsP2S4B2Title => 'Domínio Público:';

  @override
  String get termsP2S4B2Text =>
      'Ao enviar um projeto, você o lança sob a Licença CC0 (Domínio Público). A lei pertence a todos.';

  @override
  String get termsP2S4B3Title => 'Liberdade de Expressão:';

  @override
  String get termsP2S4B3Text =>
      'Não julgamos opiniões ou inclinações políticas. Rejeitamos apenas projetos que violem leis criminais ou incitem à violência.';

  @override
  String get termsP2S4B4Title => 'Verificação:';

  @override
  String get termsP2S4B4Text =>
      'Você deve ser cidadão do país onde envia um projeto.';

  @override
  String get termsP2S5Title => '5. IA e Hierarquia de Fontes';

  @override
  String get termsP2S5Text =>
      'A IA é uma ferramenta, não um oráculo. A IA ajuda a navegar pela complexa linguagem jurídica, mas pode cometer erros. A autoridade máxima é SEMPRE o documento PDF/XML original com link na parte inferior de cada resumo no aplicativo.';

  @override
  String get termsP2S6Title => '6. Segurança e Disposições Finais';

  @override
  String get termsP2S6Text =>
      'Ataques à infraestrutura, DDoS e scraping comercial são estritamente proibidos. Os assuntos não regulamentados aqui são decididos pela lei polonesa.';

  @override
  String get bpAppBar => 'Arquitetura do Sistema';

  @override
  String get bpTitle =>
      'Como Recuperamos o Controle na Democracia com o Parlamento Espelho: Manual do Cidadão';

  @override
  String get bpIntroBig =>
      'O Panorama Geral: O sistema democrático atual é um \"telefone sem fio\" quebrado. Nós consertamos o sinal conectando os cidadãos diretamente ao processo legislativo através do Parlamento Espelho (Lustra).';

  @override
  String get bpIntroSmall =>
      'Por que isso importa: Atualmente, só votamos a cada poucos anos. Entre as eleições, temos controle zero. Lustra nos dá um \"lugar à mesa\" todos os dias.';

  @override
  String get bpS1Title => '1. O PROBLEMA: Um Ciclo Quebrado';

  @override
  String get bpS1P1 => 'A informação flui em uma direção e é distorcida.';

  @override
  String get bpS1Code =>
      'Cidadãos elegem políticos\n   ↓\nPolíticos formam o Governo\n   ↓\nMídia interpreta seletivamente as ações do governo\n   ↓\nCidadãos recebem feedback (distorcido)';

  @override
  String get bpS1Highlight =>
      'Resultado: Não sabemos o que realmente está acontecendo devido ao jargão jurídico e ao ruído da mídia.';

  @override
  String get bpS2Title => '2. SOLUÇÃO: Consertando o Fluxo de Informação';

  @override
  String get bpS2P1 =>
      'Lustra remove os intermediários. Simula uma sede real de poder onde o seu voto é registrado em leis específicas, não apenas em pesquisas gerais.';

  @override
  String get bpS2FlowMedia => 'MÍDIA (observador opcional)';

  @override
  String get bpS2Flow1 => 'Cidadãos veem o rascunho de uma lei e a avaliam';

  @override
  String get bpS2Flow2 => 'Políticos veem o resultado da vontade cívica';

  @override
  String get bpS2Flow3 => 'Políticos votam (monitorados contra os dados)';

  @override
  String get bpS2Flow4 => 'Cidadãos checam: O político obedeceu aos dados?';

  @override
  String get bpS2Flow5 =>
      'Cidadãos escolhem políticos com base em seu \"Score de Obediência\"';

  @override
  String get bpS2Flow6 => 'Um novo Governo é formado.';

  @override
  String get bpS2FlowLoop => 'O CICLO SE REPETE';

  @override
  String get bpS3Title => '3. COMO FUNCIONA';

  @override
  String get bpS3ATitle => 'Passo A: Removendo a Barreira da Língua (Tradução)';

  @override
  String get bpS3AP1 =>
      'A maioria das leis é chata e ilegível. Lustra corrige a Lacuna de Acessibilidade.';

  @override
  String get bpS3AP2 =>
      'Benefício: 20 segundos para entender os fatos. Sem jargões.';

  @override
  String get bpS3BTitle =>
      'Passo B: Distribuição de Conhecimento (O Cartão de Notícia)';

  @override
  String get bpS3BP1 =>
      'Lustra não precisa de milhões de usuários para funcionar. Basta que Você esteja lá.';

  @override
  String get bpS3BList1Title => 'Sua ação:';

  @override
  String get bpS3BList1Text =>
      'Você entra, vê um tópico e gera um Cartão de Notícia com um clique.';

  @override
  String get bpS3BList2Title => 'Alcance:';

  @override
  String get bpS3BList2Text =>
      'Compartilhamento automático para suas redes sociais (FB, X, IG, etc.).';

  @override
  String get bpS3BList3Title => 'Efeito:';

  @override
  String get bpS3BList3Text =>
      'Seus amigos recebem uma \"refeição pronta\" verificada sem precisar baixar o aplicativo. Você se torna uma fonte independente de informação.';

  @override
  String get bpS3BExample => 'Exemplo:';

  @override
  String get bpS3CTitle => 'Passo C: Recuperando o Controle (A Pressão)';

  @override
  String get bpS3CP1 =>
      'Políticos e corporações ignoram \"tempestades na internet\" porque são caóticas, fáceis de censurar e desaparecem rapidamente.';

  @override
  String get bpS3CList1Title => 'Solução:';

  @override
  String get bpS3CList1Text =>
      'Votações Sociais Verificadas. O seu voto é anexado a um ID de documento legislativo específico e oficial.';

  @override
  String get bpS3CList2Title => 'Diferença:';

  @override
  String get bpS3CList2Text =>
      'Estas não são petições que expiram. São assinaturas concretas de contas verificadas.';

  @override
  String get bpS3CP2 =>
      'Se 50.000 pessoas votam contra um projeto de lei, cria-se uma prova concreta de falta de apoio social. Isso não pode ser \"encoberto\" por uma narrativa de TV.';

  @override
  String get bpS4Title => '4. OFENSIVA CÍVICA: Nós Escrevemos as Leis';

  @override
  String get bpS4P1 =>
      'O governo está ignorando um problema? Nós não esperamos.';

  @override
  String get bpS4List1Title => 'Projetos Cidadãos:';

  @override
  String get bpS4List1Text =>
      'Nós criamos nossos próprios projetos de lei e coletamos assinaturas digitais.';

  @override
  String get bpS4List2Title => 'A Armadilha:';

  @override
  String get bpS4List2Text =>
      'Se eles rejeitarem um projeto popular por detalhes técnicos, nós aplicamos emendas e reenviamos.';

  @override
  String get bpS4List3Title => 'A Escolha:';

  @override
  String get bpS4List3Text =>
      'Ignorar uma solução pronta e popular prova má-fé. Isso dá à oposição uma arma gratuita para dominar o eleitorado.';

  @override
  String get bpS4CtaTitle => 'Apoie estes Projetos Cidadãos AGORA!';

  @override
  String get bpS4CtaP1 =>
      'Clique abaixo para revisar e votar na legislação proposta:';

  @override
  String get bpS4Card1Title => 'Ato de Corte de Fundos da Classe Epstein';

  @override
  String get bpS4Card1Desc =>
      'Corta fundos públicos para figuras envolvidas em tráfico e violações de direitos humanos.';

  @override
  String get bpS4Card2Title => 'Emenda de Limite de Mandatos';

  @override
  String get bpS4Card2Desc =>
      'Estabelece um teto rigoroso na duração da carreira no Congresso.';

  @override
  String get bpS4Card3Title => 'Ato de Ética Parlamentar';

  @override
  String get bpS4Card3Desc =>
      'Implementa a Proibição de Negociação de Ações para membros ativos do Congresso.';

  @override
  String get bpS5Title => '5. RESULTADO FINAL: Purificação Política';

  @override
  String get bpS5P1 =>
      'Chega de se esconder. O debate retorna para onde as pessoas estão: as redes sociais, mas com novas regras. Este é o cumprimento da promessa original da internet que o sistema temia: o controle descentralizado do poder.';

  @override
  String get bpS5P2 =>
      'O Parlamento Espelho acende a luz em um quarto escuro, nós forçamos a TRANSPARÊNCIA. Um político não pode mentir dizendo que \"as pessoas querem isso\" quando os dados mostram o contrário. Novas leis servem ao público em geral, não ao capital.';

  @override
  String get bpS5P3 =>
      'Não estamos pedindo aos políticos que mudem. Estamos criando um sistema onde mentir sobre o apoio público se torna impossível. Esta é a democracia baseada em dados.';

  @override
  String get bpS5Highlight =>
      'Esta é uma introdução à democracia direta, baseada em uma voz consciente, informada e não em emoções.';

  @override
  String get caAppBar => 'Auditoria Cívica';

  @override
  String get caTitle =>
      'Auditoria Cívica: Novo Sistema para uma Democracia Melhor';

  @override
  String get caIntro =>
      'Ninguém avalia o processo de criação de leis além de algumas pessoas a portas fechadas e, ocasionalmente, um jornalista desonesto expondo corrupção. Como resultado, a legislação frequentemente se desvia das necessidades cívicas, priorizando interesses políticos ou corporativos sobre a adaptação social. Nosso objetivo final é simples: uma sociedade votando em políticas reais, não apenas elegendo políticos isolados e esperando que cumpram suas promessas. O Parlamento Espelho foi construído para tornar esta transição fácil e alcançável.';

  @override
  String get caS1Title => 'Como a Auditoria Cívica é diferente das Petições?';

  @override
  String get caS1PetitionsTitle => 'Petições Tradicionais';

  @override
  String get caS1PetitionsText =>
      'As petições raramente funcionam por causa de sua natureza ilusória. Após coletar assinaturas, a campanha termina. É essencialmente um pedido consultivo educado a uma pessoa no poder. Como são campanhas cronometradas que dependem de um ciclo de mídia curto, os políticos podem facilmente descartá-las. Eles apenas esperam a mídia mudar a narrativa e a petição é esquecida.';

  @override
  String get caS1LustraTitle => 'A Vontade Cívica em Lustra';

  @override
  String get caS1LustraText =>
      'Nós não pedimos. Em Lustra, o seu voto não é apenas uma assinatura - ele está permanentemente ancorado a um ID legislativo oficial e sólido. Ele marca a sua posição exata sobre uma política específica. Todos esses votos se combinam para criar a Vontade Cívica: um medidor em tempo real mostrando exatamente como os cidadãos avaliam um projeto, fechando o ciclo da Auditoria Cívica.';

  @override
  String get caS2Title => 'Por que os políticos deveriam se importar?';

  @override
  String get caS2Text =>
      'Porque eles não podem mais se esconder.\n\nNós registramos cada voto oficial deles no governo e o comparamos diretamente contra a Vontade Cívica. Eles não podem mais mentir dizendo que \"as pessoas querem isso\" só porque fizeram uma campanha de mídia inteligente. Se eles votam em algo que beneficia um grupo de lobby em vez dos cidadãos, nós descobrimos imediatamente. Quanto mais pessoas usam Lustra para expor essas lacunas, mais difícil se torna para os políticos manipularem a narrativa. Nós recuperamos o controle.';

  @override
  String get caS3Title => 'A Melhor Parte: Poder Assimétrico';

  @override
  String get caS3P1 =>
      'Nós não precisamos da mídia tradicional como os lobistas precisam. Nós nem mesmo precisamos de 5 milhões de usuários dentro do aplicativo para atualizar a democracia. Nós só precisamos de você.\n\nVocê já tem alcance fora de Lustra: no Facebook, TikTok, X ou em qualquer outro lugar. Podemos finalmente transformar a mídia social em algo significativo. Um usuário compartilhando um projeto de lei pode facilmente gerar de 100 a 1.000 visualizações com quase zero esforço. Isso é um pequeno estádio de pessoas aprendendo sobre uma parte crucial da lei ou uma iniciativa cívica.';

  @override
  String get caS3MathSubtitle => 'A MATEMÁTICA DA GUERRA ASSIMÉTRICA';

  @override
  String get caS3P2 =>
      'Pense na matemática: um think tank corporativo ativo ou grupo de lobby pode ter de 10 a 15 pessoas cuja única alavancagem é o dinheiro para comprar favores políticos. Seus 10.000 votos verificados de cidadãos reais podem superá-los. Podemos fazer exatamente o que os lobistas fazem, mas mais rápido, de forma transparente e com números esmagadores. Os tempos mudaram.';

  @override
  String get caS4Title => 'Quem controla o Feed? Você.';

  @override
  String get caS4Text =>
      'A mídia tradicional e os algoritmos das Big Tech otimizam para a indignação a fim de vender anúncios. O algoritmo de Lustra é estritamente democrático. Não temos editores decidindo o que é \"importante\". Nosso feed principal avalia automaticamente os últimos 30 dias de legislação, isola os 5 principais projetos de lei com o maior engajamento cívico e os coloca em destaque. Seus votos ditam a hierarquia da informação. Você controla o algoritmo.';

  @override
  String get caS5Title => 'O Arsenal: Como Usar \"Cartões de Fatos\"';

  @override
  String get caS5Intro =>
      'A legislação é intencionalmente chata. Ela nunca teve a intenção de ser mainstream. É por isso que a mídia cria narrativas emocionais em torno dela para vender anúncios. Você também pode criar narrativas - mas as suas serão construídas sobre dados brutos, resumidos e verificados.\n\nLustra produz Cartões de Fatos (Fact Cards). Cada vez que você clica em \"Compartilhar\", ele renderiza uma imagem limpa usando dados oficiais. Por si só, é apenas um fato. Nas redes sociais, os fatos precisam ser explicados. Você é o explicador. Aqui está exatamente como usá-los para criar conteúdo viral de alto impacto:';

  @override
  String get caS5A_Title => 'A/ O Gancho (Crie a Perspectiva)';

  @override
  String get caS5A_Text =>
      'A opção mais fácil geralmente é a mais relacionável. Encontrou um novo Projeto de Lei de Censura na Internet no aplicativo? Não complique. Crie um título forte (um \"gancho\"), diga às pessoas exatamente como isso as afeta e solte o link direto para Lustra para que elas possam votar.';

  @override
  String get caS5B_Title => 'B/ A Evidência (Para Ensaios e Threads)';

  @override
  String get caS5B_Text =>
      'Imagens são ótimas adições a postagens mais longas. Quer destacar falhas críticas em um projeto de lei proposto ou confrontar o resumo oficial do governo? Anexe o Cartão de Fatos como prova inegável. Deixe as pessoas lerem os dados esterilizados por si mesmas em 15 segundos.';

  @override
  String get caS5C_Title => 'C/ A Transmissão (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Use a imagem do Cartão de Fatos com um efeito de \"fundo falso\" (green screen) no TikTok ou Instagram. Coloque os dados de Lustra em segundo plano e grave a si mesmo explicando o problema. É o conteúdo em formato curto perfeito e verificável.';

  @override
  String get caS5D_Title => 'D/ A Rede (Mensagens Diretas)';

  @override
  String get caS5D_Text =>
      'Basta clicar em compartilhar e enviar a imagem diretamente para seus grupos de amigos e familiares. Diga-lhes claramente: \"É isso que está acontecendo no governo agora\" ou \"É sobre isso que a mídia está calada agora\".';

  @override
  String get caS5Outro =>
      'A produção de conteúdo é fácil, e Lustra é o seu motor de descoberta. Você não é apenas um usuário. Você é um adotante inicial da nova era da democracia livre de corrupção. Você tem as mesmas ferramentas que um lobista - use-as.';

  @override
  String get caSkepticTitle =>
      'Cético sobre fazendas de bots ou privacidade de dados?';

  @override
  String get caSkepticText =>
      'Ótimo. Não confie em nossas palavras - audite nosso sistema. Leia exatamente como usamos hash criptográfico, Firebase App Check e a Licença Open Source (AGPLv3) para proteger sua identidade e a integridade da Vontade Cívica.';

  @override
  String get caSkepticBtnGov => 'Transparência e Governança';

  @override
  String get caSkepticBtnPriv => 'Constituição e Privacidade';

  @override
  String get clAppBar => 'Watchlists';

  @override
  String get clTitle => 'Watchlists Curadas: Mídia Cívica Descentralizada';

  @override
  String get clIntro =>
      'Os governos usam o enorme volume de legislação como arma. Eles aprovam centenas de páginas de leis complexas, muitas vezes enterrando atos controversos por trás de títulos chatos ou aprovando-os pela \"porta dos fundos\" enquanto a mídia está distraída com o mais recente escândalo político. Os cidadãos perdem a noção do panorama geral porque é fisicamente impossível monitorar tudo sozinho.';

  @override
  String get clS1Title => 'Reconhecimento de Padrões e Mobilização em Massa';

  @override
  String get clS1P1 =>
      'As Watchlists Curadas permitem que você organize o caos e atue como um nó de informação independente. Você pode misturar projetos de lei oficiais do governo com projetos cívicos populares, agrupá-los por tópicos específicos e convidar outras pessoas para se inscrever.';

  @override
  String get clS1P2 =>
      'Fundamentalmente, uma Watchlist atua como um multiplicador para a Auditoria Cívica. Você não está reunindo apoio apenas para um projeto de lei isolado. Ao agrupar até 80 itens, a sua lista torna-se um feed dedicado e focado para seus seguidores. Eles podem entrar na sua lista e votar em várias leis em uma única sessão, gerando dados concretos em massa e Vontade Cívica para todo um setor político.';

  @override
  String get clS2Title => 'Como Usar Watchlists como uma Arma:';

  @override
  String get clS2A_Title => 'Cães de Guarda do Governo';

  @override
  String get clS2A_Text =>
      'Notou o governo tentando aprovar silenciosamente uma série de leis tecnológicas que invadem a privacidade? Agrupe-as em uma \"Watchlist de Vigilância Digital\". Mostre aos seus assinantes a agenda oculta que a mídia perdeu e deixe-os votar contra todas elas em um só lugar. Peça a eles para amplificar isso compartilhando.';

  @override
  String get clS2B_Title => 'Plataforma de Reforma';

  @override
  String get clS2B_Text =>
      'Não reclame apenas da economia. Construa uma \"Lista de Reformas Econômicas\" completa, com várias leis, misturando seus próprios projetos cívicos com emendas oficiais. Apresente uma plataforma política totalmente estruturada.';

  @override
  String get clS2C_Title => 'Os Holofotes';

  @override
  String get clS2C_Text =>
      'Você pode fixar uma lei específica como \"Favorita\" na sua lista para direcionar a máxima atenção cívica e poder de voto exatamente para onde é mais necessário.';

  @override
  String get clS3Title => 'A Melhor Parte: Você é o Dono da Transmissão';

  @override
  String get clS3Text =>
      'Os algoritmos das redes sociais suprimem constantemente links externos para manter os usuários rolando o feed. Lustra contorna isso. Quando as pessoas se inscrevem na sua Watchlist, você ignora as Big Techs inteiramente. Você recebe um botão manual de \"Push\". Uma vez a cada 24 horas, você pode disparar uma notificação móvel direta para todos os seus assinantes, alertando-os para checar a sua lista porque uma votação crítica está acontecendo ou uma nova lei foi adicionada. Você controla a distribuição.';

  @override
  String get clS4Title => 'A Economia dos Criadores para a Democracia';

  @override
  String get clS4Text =>
      'Uma boa curadoria é extremamente valiosa. Filtrar o ruído político leva tempo e experiência. É por isso que Lustra permite que você anexe a sua \"Caixinha de Gorjetas\" (Tip Jar) pessoal diretamente à sua Watchlist. Se você faz o trabalho duro de monitorar o governo e educar o público, seus assinantes podem financiar seus esforços diretamente. Nós não cobramos comissão.';

  @override
  String get clS5Title => 'Implantação: Como Começar';

  @override
  String get clS5Intro =>
      'Esta não é uma funcionalidade passiva. Você deve construí-la ativamente. Aqui está a instrução exata para implantar a sua primeira Watchlist:';

  @override
  String get clStep1Title => 'Passo 1: Inicializar';

  @override
  String get clStep1Text =>
      'Navegue até a tela principal e clique no ícone da Engrenagem (Configurações) no canto superior. Selecione a opção para criar a sua primeira Watchlist. Dê um título claro a ela.';

  @override
  String get clStep2Title => 'Passo 2: Modo Curador';

  @override
  String get clStep2Text =>
      'Assim que a sua lista é inicializada, o sistema concede a você o status de Curador. Agora, navegue pelo feed principal. Dentro da tela de detalhes de cada lei ou projeto cívico, um novo botão \"Adicionar à lista\" aparecerá. Clique nele para injetar essa lei específica diretamente na sua lista.';

  @override
  String get clStep3Title => 'Passo 3: Injeção de Feed';

  @override
  String get clStep3Text =>
      'A sua Watchlist não inunda o feed principal. Em vez disso, a única lei que você selecionou como \"Favorita\" atua como o seu embaixador. Este único cartão é injetado diretamente no feed diário dos seus assinantes, perfeitamente entrelaçado com a legislação oficial do governo. Ele é exibido exatamente com a mesma prioridade das leis oficiais do governo. Colocamos a supervisão do cidadão em pé de igualdade com o estado.';

  @override
  String get clLimitsTitle => 'LIMITES DO SISTEMA (SINAL SOBRE RUÍDO)';

  @override
  String get clLimit1Label => 'AUTORIA';

  @override
  String get clLimit1Desc =>
      'Máximo de listas ativas por governo (Você pode excluí-las e implantar novas a qualquer momento).';

  @override
  String get clLimit2Label => 'CAPACIDADE';

  @override
  String get clLimit2Desc =>
      'Máximo de leis por lista (Mais do que o suficiente para expor um padrão, rigoroso o suficiente para evitar sobrecarga de informações).';

  @override
  String get clLimit3Label => 'ASSINATURAS';

  @override
  String get clLimit3Desc =>
      'Máximo de listas que você pode observar de outros criadores.';

  @override
  String get clOutro =>
      'Lustra não é uma rede social que gera alcance algorítmico gratuito para a sua lista. As Watchlists são apenas para convidados. Você deve compartilhar o seu link exclusivo externamente. Traga o seu público do X, YouTube, TikTok ou da sua newsletter. Nós não lhe damos seguidores; nós lhe damos a infraestrutura para transformar os seus seguidores existentes em uma força cívica verificada e votante - e uma maneira de ser financiado diretamente pelo seu trabalho árduo. Pare de pedir \"likes\" ao seu público. Dê-lhes uma ferramenta para agir.';

  @override
  String get supportFundTitle =>
      'Fase 1: Lançamento da Entidade Sem Fins Lucrativos';

  @override
  String get supportFundDesc =>
      'Para abrir oficialmente a Fundação Lustra, proteger a propriedade intelectual e cobrir os custos legais de configuração, precisamos reunir o capital inicial. Ajude-nos a tornar este sistema independente para sempre.';

  @override
  String get supportFundDisclaimer =>
      'Transparência de dados: Devido a diferentes gateways de pagamento e custos de infraestrutura, esta barra de progresso é atualizada manualmente pelo fundador (no máximo uma vez por semana).';

  @override
  String get actionSyncViaQr => 'Mostrar QR';

  @override
  String get actionHideQr => 'Ocultar QR';

  @override
  String get promoGuestTrackBills =>
      'Acompanhe a legislação e receba notificações sobre novas votações e leis.';

  @override
  String get promoGetAppForNotifications =>
      'Obtenha a aplicação móvel para melhor desempenho e notificações sobre os seus projetos de lei acompanhados.';

  @override
  String get buttonSeeAllUpcoming => 'Próximos projetos de lei';

  @override
  String get buttonSeeAllProcess => 'Acompanhar leis em tramitação';

  @override
  String get buttonSeeAllVoted => 'Ver resultados das votações';

  @override
  String get buttonSeeAllCivicProjects => 'Ver projetos cidadãos';
}
