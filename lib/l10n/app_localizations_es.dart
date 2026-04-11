// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get errorFailedToLoadData => 'Error al cargar los datos';

  @override
  String get errorNoData => 'No hay datos para mostrar.';

  @override
  String get noData => 'Sin datos';

  @override
  String get noDate => 'Sin fecha';

  @override
  String get shareAction => 'Compartir';

  @override
  String get loginAction => 'Iniciar sesión';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsChangeLanguage => 'Cambiar idioma';

  @override
  String get settingsLogout => 'Cerrar sesión';

  @override
  String get tryAgainButton => 'Intentar de nuevo';

  @override
  String get moreButton => '... Más';

  @override
  String get seeDetailsLink => 'Ver detalles ->';

  @override
  String get bottomNavHome => 'Inicio';

  @override
  String get bottomNavInfo => 'Información';

  @override
  String get bottomNavSupport => 'Apoyar';

  @override
  String get bottomNavFutureFeatures => 'Futuras funciones';

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
      'No hay datos para mostrar para la legislatura seleccionada.';

  @override
  String get sectionPopularVotes => 'Votaciones legislativas';

  @override
  String get sectionUpcoming => 'Debates programados';

  @override
  String get sectionLegislationInProcess => 'En proceso';

  @override
  String get civicProjectsSectionTitle => 'Iniciativas ciudadanas';

  @override
  String get sectionMpProfiles => 'Políticos populares';

  @override
  String get votingSourceTooltip => 'Ver fuente de la votación';

  @override
  String get legislationSponsorLabel => 'Patrocinador';

  @override
  String get buttonBrowseVotes => 'Navegador de votaciones';

  @override
  String get buttonScheduledMeetings => 'Sesiones programadas';

  @override
  String get buttonBillsInProgress => 'Leyes en trámite';

  @override
  String get buttonAllMps => 'Todos los diputados';

  @override
  String get buttonCheckProfile => 'Ver perfil';

  @override
  String get errorNoDeputiesData => 'Sin datos sobre los diputados.';

  @override
  String get errorNoDataLastVote => 'Sin datos sobre la última votación.';

  @override
  String get errorNoDataUpcomingVote => 'Sin datos sobre la próxima votación.';

  @override
  String get errorNoSummaryLastVote => 'Sin resumen de la última votación.';

  @override
  String get errorNoSummaryUpcomingVote =>
      'Sin resumen de la próxima votación.';

  @override
  String get errorNoDataLegislationInProcess =>
      'Sin datos sobre la legislación en proceso.';

  @override
  String get errorNoSummaryLegislationInProcess =>
      'Sin resumen de la legislación en proceso.';

  @override
  String get keyPoints => 'Puntos clave';

  @override
  String get noKeyPoints => 'No hay puntos clave';

  @override
  String get votingResultsTitle => 'RESULTADOS DE LA VOTACIÓN';

  @override
  String get labelFor => 'A favor:';

  @override
  String get labelAgainst => 'En contra:';

  @override
  String get labelAbstained => 'Abstenciones:';

  @override
  String get noStatusInfo => 'Sin información de estado';

  @override
  String scheduledMeetingDate(String date) {
    return 'Sesión programada: $date';
  }

  @override
  String get noScheduledMeetingDate => 'Sin fecha de sesión programada';

  @override
  String processStartDate(String date) {
    return 'Inicio del proceso: $date';
  }

  @override
  String get noProcessStartDate => 'Sin fecha de inicio del proceso';

  @override
  String mpDistrict(String districtNumber) {
    return 'Distrito: $districtNumber';
  }

  @override
  String get actionCollapse => 'Contraer';

  @override
  String get actionExpand => 'Expandir más...';

  @override
  String get votingFor => 'A favor';

  @override
  String get votingAgainst => 'En contra';

  @override
  String get votingAbstainShort => 'Abst.';

  @override
  String get citizenPollTitle => 'Voluntad Ciudadana';

  @override
  String get pollTemporarilyUnavailable =>
      'Encuesta no disponible temporalmente. Por favor, inténtelo de nuevo más tarde.';

  @override
  String get errorDisplayingPollBar =>
      'Error al mostrar los resultados de la encuesta.';

  @override
  String get pollNoForAgainstVotes => 'Sin votos a favor/en contra';

  @override
  String get pollNoVotesCast => 'Sé la primera persona en votar.';

  @override
  String pollTotalVotes(int count) {
    return 'Votos emitidos: $count';
  }

  @override
  String get pollSupport => 'Apoyo';

  @override
  String get pollDontSupport => 'No apoyo';

  @override
  String get loginToVote => 'Inicia sesión para votar';

  @override
  String get dialogChooseLanguage => 'Elegir idioma';

  @override
  String get dialogCancel => 'Cancelar';

  @override
  String get infoScreenTitle => 'Información';

  @override
  String get infoTitle1 => 'Ciudadanos por Encima de la Política';

  @override
  String get infoParagraph1 =>
      'Los medios no informan, curan la realidad. Se estima que el 95% de la legislación desaparece en un \"agujero negro\" de silencio porque es demasiado compleja para vender publicidad. Lustra evita a los intermediarios. Procesamos el lenguaje burocrático en hechos accesibles, dándote visión sobre lo que el gobierno realmente aprueba, no solo de lo que quiere hablar.';

  @override
  String get infoTitle2 => 'Hechos, No Marketing';

  @override
  String get infoParagraph2 =>
      'La política actual es 80% marketing y 20% ley. Nosotros separamos ambos. Aplicamos un proceso de \"esterilización de contexto\": eliminamos el lenguaje emocional y el sesgo partidista, dejando solo los hechos legales. No es \"otro punto de vista\". Es una reducción de ruido que te permite formar tu propia opinión basada en la fuente.';

  @override
  String get infoTitle3 => 'Poder Sin Intermediarios';

  @override
  String get infoParagraph3 =>
      'Las grandes plataformas optimizan el contenido para tu indignación porque eso te mantiene en la pantalla. Nosotros optimizamos para tu conocimiento. La jerarquía de los temas en la app depende exclusivamente de los votos de la comunidad. Vosotros decidís qué es importante, recuperando el poder de editores y lobistas.';

  @override
  String get infoTitle4 => 'Arquitectos del Cambio';

  @override
  String get infoParagraph4 =>
      'La democracia no es un deporte para espectadores. Introducimos un mecanismo donde las iniciativas ciudadanas se muestran en igualdad de condiciones con los proyectos gubernamentales. Te damos la infraestructura para pasar de observador pasivo a Arquitecto del Cambio, construyendo apoyo real para los temas que importan. Elevamos la democracia a un nuevo nivel.';

  @override
  String get linkHowTechnologyWorks => '¿Cómo funciona la tecnología?';

  @override
  String get linkTermsAndPrivacy => 'Términos y Política de privacidad';

  @override
  String get supportScreenTitle => 'Infraestructura Pública';

  @override
  String get supportParagraph1 =>
      'Lustra es un servicio de utilidad pública digital. Pero la libertad tiene un precio. Rechazamos el capital para garantizar un 100% de imparcialidad, creyendo que es el único camino hacia el cambio. El mantenimiento de la infraestructura y los servidores depende únicamente de contribuciones voluntarias. El equivalente a 10\$ financia el acceso a la plataforma para varios miles de personas al mes. Tu apoyo garantiza la continuidad de la misión y el funcionamiento ininterrumpido.';

  @override
  String get buttonSupportFinancially => 'Apoyar';

  @override
  String get supportThankYou => 'Gracias. Mantienes el sistema vivo.';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Fundador';

  @override
  String get futureFeaturesScreenTitle => 'Hoja de Ruta Comunitaria';

  @override
  String get futureFeaturesHeader => 'Tú Controlas la Dirección';

  @override
  String get futureFeatureSenate => 'Integración de Senadores';

  @override
  String get futureFeatureCitizenInitiative => 'Referéndums Ciudadanos';

  @override
  String get futureFeaturesDescription =>
      'Esta no es una lista de deseos cerrada. Lustra es una infraestructura que pertenece a los ciudadanos, por lo que todos tenemos impacto en su desarrollo. Únete a la comunidad Civic Evolution en Reddit, propón ideas y vota sobre las próximas funciones. ¡Trabajemos juntos en el próximo capítulo de la democracia!';

  @override
  String get futureFeaturesVoteButton => 'Votar Hoja de Ruta';

  @override
  String get comingSoon => 'Propuesta';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Legislativo - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Actualizar caché';

  @override
  String get advancedSearchHint => 'Búsqueda avanzada...';

  @override
  String get filterTypeLabel => 'Tipo: ';

  @override
  String get filterStatusLabel => 'Estado: ';

  @override
  String get allOption => 'Todos';

  @override
  String get errorFetchData =>
      'No se pudieron obtener los datos. Por favor, inténtelo de nuevo.';

  @override
  String get emptyListFilterMessage =>
      'No se encontraron leyes que coincidan con los criterios seleccionados.';

  @override
  String get emptyListDefaultMessage =>
      'No hay leyes finalizadas para mostrar para esta fuente.';

  @override
  String get searchDialogTitle => 'Buscar y filtrar';

  @override
  String get searchDialogHint => 'Introduzca el término de búsqueda...';

  @override
  String get searchDialogTimePeriodLabel => 'Período de tiempo';

  @override
  String get searchDialogSearchButton => 'Buscar';

  @override
  String get searchDialogSelectDateRange => 'Seleccionar rango';

  @override
  String get searchDialogDateRangePickerHelp => 'Seleccione un rango de fechas';

  @override
  String get searchDialogDateRangePickerCancel => 'CANCELAR';

  @override
  String get searchDialogDateRangePickerConfirm => 'OK';

  @override
  String get searchDialogDateRangePickerSave => 'GUARDAR';

  @override
  String get timePeriodLastWeek => 'Última semana';

  @override
  String get timePeriodLastMonth => 'Último mes';

  @override
  String get timePeriodLast3Months => 'Últimos 3 meses';

  @override
  String get timePeriodLastYear => 'Último año';

  @override
  String get timePeriodAll => 'Todo el tiempo';

  @override
  String get timePeriodCustom => 'Rango personalizado';

  @override
  String get categoryAll => 'Todos';

  @override
  String get categoryHealth => 'Salud';

  @override
  String get categoryFamily => 'Familia';

  @override
  String get categoryTaxes => 'Impuestos';

  @override
  String get categoryMigration => 'Migración';

  @override
  String get categoryLabor => 'Trabajo';

  @override
  String get categorySecurity => 'Seguridad';

  @override
  String get categoryEducation => 'Educación';

  @override
  String get categoryEnvironment => 'Medio ambiente';

  @override
  String get categoryCourtsAndLaw => 'Tribunales y ley';

  @override
  String get categoryTransport => 'Transporte';

  @override
  String get categoryBenefits => 'Beneficios';

  @override
  String get categoryRealEstate => 'Bienes raíces';

  @override
  String get categoryMediaAndCulture => 'Medios y cultura';

  @override
  String get categoryLocalGovernment => 'Gobierno local';

  @override
  String get categoryAgriculture => 'Agricultura';

  @override
  String get categoryPublicInvestments => 'Inversiones públicas';

  @override
  String get categoryInformatization => 'Informatización';

  @override
  String get categoryEconomy => 'Economía';

  @override
  String get lustraClubLabel => 'Club Lustra';

  @override
  String get categoryOther => 'Otro';

  @override
  String futureLegislationScreenTitle(String parliamentName) {
    return 'Próximas leyes - $parliamentName';
  }

  @override
  String get searchDialogAdvancedTitle => 'Buscar y filtrar (Avanzado)';

  @override
  String get emptyListFilterMessageFuture =>
      'No se encontraron próximas leyes que coincidan con los criterios seleccionados.';

  @override
  String get emptyListDefaultMessageFuture =>
      'No hay leyes programadas para mostrar para esta fuente.';

  @override
  String get noScheduledMeetings => 'No hay sesiones programadas';

  @override
  String get dateFormatError => 'Error de formato de fecha';

  @override
  String get upcomingMeetings => 'Próximas sesiones:';

  @override
  String get keyPointsTitle => 'Puntos clave:';

  @override
  String processLegislationScreenTitle(String parliamentName) {
    return 'Leyes en proceso - $parliamentName';
  }

  @override
  String get searchHint => 'Buscar...';

  @override
  String get emptyListFilterMessageProcess =>
      'No se encontraron leyes en proceso que coincidan con los criterios seleccionados.';

  @override
  String get emptyListDefaultMessageProcess =>
      'No hay leyes activas en el proceso legislativo para esta fuente.';

  @override
  String processStartDateCardLabel(String date) {
    return 'Inicio del proceso: $date';
  }

  @override
  String get upcomingMeetingsCardLabel => 'Próximas sesiones:';

  @override
  String get detailsScreenTitle => 'LUSTRA';

  @override
  String get shareTooltip => 'Compartir';

  @override
  String get keyPointsSectionTitle => 'Puntos clave:';

  @override
  String get officialContentButton => 'Texto oficial';

  @override
  String get processPageButton => 'Página del proceso';

  @override
  String get fullVotingResultsPDF =>
      'Resultados completos de la votación (PDF)';

  @override
  String get scheduledMeetingsSectionTitle => 'Sesiones programadas';

  @override
  String get additionalInfoSectionTitle => 'Información adicional';

  @override
  String printNumberLabel(String id) {
    return 'Número de impresión: $id';
  }

  @override
  String processStartDateLabel(String date) {
    return 'Fecha de inicio del proceso: $date';
  }

  @override
  String votingDateLabel(String date) {
    return 'Fecha de votación: $date';
  }

  @override
  String meetingNumberLabel(String number) {
    return 'Nº de sesión: $number';
  }

  @override
  String votingNumberLabel(String number) {
    return 'Nº de votación: $number';
  }

  @override
  String get sourceLabel => 'Fuente: https://api.sejm.gov.pl/';

  @override
  String summarizedByLabel(String modelName) {
    return 'Resumido por: $modelName';
  }

  @override
  String promptUsedLabel(String prompt) {
    return 'Prompt utilizado: $prompt';
  }

  @override
  String get reportErrorButton => 'Reportar un error';

  @override
  String get noUrlAvailableSnackbar => 'No hay URL disponible.';

  @override
  String cannotOpenLinkSnackbar(String url) {
    return 'No se pudo abrir el enlace: $url';
  }

  @override
  String get alreadyVotedSnackbar => 'Tu voto ya ha sido registrado.';

  @override
  String get sharingFunctionNotImplementedSnackbar =>
      'Función de compartir (por implementar)';

  @override
  String get reportErrorFunctionNotImplementedSnackbar =>
      'Función de reporte de errores (por implementar)';

  @override
  String get loginScreenTitle => 'Iniciar sesión';

  @override
  String get registrationScreenTitle => 'Registro';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get loginButton => 'Iniciar sesión';

  @override
  String get registerButton => 'Registrarse';

  @override
  String get orDivider => 'O';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get continueWithFacebook => 'Continuar con Facebook';

  @override
  String get promptToRegister => '¿No tienes una cuenta? Regístrate';

  @override
  String get promptToLogin => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get validatorInvalidEmail =>
      'Por favor, introduce una dirección de correo electrónico válida.';

  @override
  String get validatorPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get authErrorInvalidCredentials =>
      'Correo electrónico o contraseña no válidos.';

  @override
  String get authErrorEmailInUse =>
      'Esta dirección de correo electrónico ya está en uso.';

  @override
  String get authErrorWeakPassword => 'La contraseña es demasiado débil.';

  @override
  String get authErrorDefault =>
      'Ocurrió un error. Por favor, inténtalo de nuevo.';

  @override
  String get authErrorUnexpected => 'Ocurrió un error inesperado.';

  @override
  String get authErrorGoogleFailed =>
      'El inicio de sesión con Google falló. Por favor, inténtalo de nuevo.';

  @override
  String get authErrorFacebookFailed =>
      'El inicio de sesión con Facebook falló. Por favor, inténtalo de nuevo.';

  @override
  String get authErrorAccountExists =>
      'Ya existe una cuenta con este correo electrónico. Por favor, inicia sesión con tu contraseña.';

  @override
  String mpScreenTitle(String parliamentName) {
    return 'Diputados - $parliamentName';
  }

  @override
  String get searchMPsHint => 'Buscar diputados...';

  @override
  String get allFilter => 'Todos';

  @override
  String get noMPsForSource => 'No hay diputados disponibles para esta fuente.';

  @override
  String get noMPsMatchFilter =>
      'No hay diputados que coincidan con los criterios.';

  @override
  String get attendanceLabelShort => 'Asistencia';

  @override
  String get attendanceTooltipWarning =>
      'Asistencia calculada en base a una legislatura con un pequeño número de votaciones.\nLos datos pueden ser menos representativos.';

  @override
  String get supportLabel => 'Apoyo: ';

  @override
  String get unaffiliatedClub => 'No adscrito';

  @override
  String mpDetailsScreenTitle(String firstName, String lastName) {
    return '$firstName $lastName';
  }

  @override
  String get shareProfileTooltip => 'Compartir perfil';

  @override
  String get socialPollSectionTitle => 'Encuesta social';

  @override
  String get parliamentaryActivitySectionTitle => 'Actividad parlamentaria';

  @override
  String parliamentaryTenureSectionTitle(int years) {
    return 'Antigüedad parlamentaria: $years años';
  }

  @override
  String get parliamentaryTenureNoData => 'Antigüedad parlamentaria: Sin datos';

  @override
  String get tenureTooltip =>
      'El número de años es un valor aproximado, calculado en base a los datos a continuación, sin tener en cuenta la expiración prematura del mandato parlamentario.';

  @override
  String tenureTermItem(String romanNumeral, String duration) {
    return '$romanNumeral legislatura del Sejm de la República de Polonia $duration';
  }

  @override
  String get unknownTermDuration => 'Período desconocido';

  @override
  String get noTermData => 'Sin datos detallados sobre las legislaturas.';

  @override
  String get plHistoricalDataDisclaimer =>
      'Nota: Los datos históricos de la 1ª y 2ª legislatura del Sejm de la República de Polonia no están disponibles y no se incluyen.';

  @override
  String get personalDataSectionTitle => 'Datos personales';

  @override
  String get contactSectionTitle => 'Contacto';

  @override
  String get dataSourceLabel => 'Fuente de datos: Sejm RP API';

  @override
  String get mandateStatusActive => 'Mandato: activo';

  @override
  String get mandateStatusFulfilled => 'Mandato: cumplido';

  @override
  String get mandateStatusCancelled => 'Mandato: cancelado';

  @override
  String get mandateStatusInactive => 'Mandato: inactivo';

  @override
  String get followingAddedSnackbar => 'Añadido a seguidos';

  @override
  String get followingRemovedSnackbar => 'Eliminado de seguidos';

  @override
  String clubLabel(String clubName) {
    return 'Grupo: $clubName';
  }

  @override
  String formerlyLabel(String clubs) {
    return ' (antes: $clubs)';
  }

  @override
  String professionLabel(String profession) {
    return 'Profesión: $profession';
  }

  @override
  String districtLabel(String districtName, int districtNum) {
    return 'Distrito: $districtName (nº $districtNum)';
  }

  @override
  String votesObtainedLabel(String votes) {
    return 'Votos obtenidos: $votes';
  }

  @override
  String get birthDateLabel => 'Fecha de nacimiento';

  @override
  String get ageLabel => 'Edad';

  @override
  String ageUnit(int age) {
    return '$age años';
  }

  @override
  String get birthPlaceLabel => 'Lugar de nacimiento';

  @override
  String get educationLabel => 'Educación';

  @override
  String get voivodeshipLabel => 'Voivodato';

  @override
  String get emailLabelWithColon => 'Correo electrónico:';

  @override
  String get votingsTab => 'Votaciones recientes';

  @override
  String get interpellationsTab => 'Interpelaciones';

  @override
  String get attendanceLabel => 'Asistencia general en votaciones';

  @override
  String get attendanceTooltipBase =>
      'La escala evalúa el nivel de cumplimiento del deber parlamentario básico. Los rangos adoptados se basan en la suposición de que una alta asistencia es una medida de responsabilidad hacia los votantes.';

  @override
  String get attendanceTooltipPartialMandate =>
      '\n\nEl diputado ocupó el mandato durante parte de la legislatura. La asistencia se refiere a este período.';

  @override
  String get attendanceTooltipUnknownMandate =>
      '\n\nAsistencia calculada en base a una legislatura con un pequeño número de votaciones. Los datos pueden ser menos representativos.';

  @override
  String get errorLoadVotings =>
      'No se pudo cargar el historial de votaciones.';

  @override
  String get errorLoadInterpellations =>
      'No se pudieron cargar las interpelaciones.';

  @override
  String get noVotingsData =>
      'No hay datos sobre votaciones importantes para mostrar.';

  @override
  String get noInterpellationsData => 'No hay datos.';

  @override
  String get loadVotingsButton => 'Intentar cargar votaciones';

  @override
  String get loadMoreButton => 'Mostrar más';

  @override
  String interpellationSentDate(String date) {
    return 'Fecha de envío: $date';
  }

  @override
  String get interpellationReplyFrom => 'Respuesta de: ';

  @override
  String cannotOpenReplyLink(String url) {
    return 'No se pudo abrir el enlace de la respuesta: $url';
  }

  @override
  String get pollResultNoVotes => 'Sé la primera persona en votar.';

  @override
  String get pollResultOverwhelmingMajority => 'mayoría abrumadora';

  @override
  String get pollResultMajority => 'mayoría';

  @override
  String get pollResultMinority => 'minoría';

  @override
  String get pollResultOverwhelmingMinority => 'minoría abrumadora';

  @override
  String pollResultFormatted(String percentage, String description) {
    return '$percentage - $description';
  }

  @override
  String pollTotalVotesLabel(int count) {
    return 'Número de votos emitidos: $count';
  }

  @override
  String get pollVoteToAction => 'Vota para ver los resultados';

  @override
  String get voteTypeFor => 'A favor';

  @override
  String get voteTypeAgainst => 'En contra';

  @override
  String get voteTypeAbstain => 'Abstención';

  @override
  String get voteTypeAbsent => 'Ausente';

  @override
  String get defaultPrompt => 'Prompt';

  @override
  String get statusInProgress => 'En proceso';

  @override
  String get statusPassedSejmToSenat => 'Aprobada y enviada al Senado';

  @override
  String get statusRejectedSejm => 'Rechazada';

  @override
  String get statusRejectedBySenate => 'Rechazada por el Senado';

  @override
  String get statusToPresident => 'Transmitida al Presidente';

  @override
  String get votingResultsUSMotionToReferTitle => 'RESULTADOS: REMISIÓN';

  @override
  String get statusVetoPresident => 'VETO del Presidente';

  @override
  String get statusToConstitutionalTribunal =>
      'Remitida al Tribunal Constitucional';

  @override
  String get statusSignedByPresident => 'Firmada por el Presidente';

  @override
  String get statusEnacted => 'Promulgada';

  @override
  String get statusExpired => 'Caducada';

  @override
  String get statusAdoptedResolution => 'Aprobada';

  @override
  String get statusRejectedResolution => 'Rechazada';

  @override
  String get statusImmediateRejection => 'Rechazo inmediato';

  @override
  String get statusWithdrawn => 'Retirada';

  @override
  String get filterStatusAll => 'Todos';

  @override
  String get filterStatusPassed => 'Aprobados';

  @override
  String get filterStatusRejected => 'Rechazados';

  @override
  String get docTypeBill => 'Proyecto de ley';

  @override
  String get docTypeResolution => 'Proyecto de resolución';

  @override
  String get statusUpcoming => 'Programado';

  @override
  String get statusIntroducedInHouse =>
      'Presentado en la Cámara de Representantes';

  @override
  String get statusReportedToSenate => 'Informado al Senado';

  @override
  String get statusReportedInHouse => 'Informado en la Cámara';

  @override
  String get statusReferredInSenate => 'Remitido al Senado';

  @override
  String get statusReferredInHouse => 'Remitido a la Cámara';

  @override
  String get statusReferenceChangeSenate => 'Cambio de remisión en el Senado';

  @override
  String get statusReceivedInSenate => 'Recibido en el Senado';

  @override
  String get statusPlacedOnCalendarSenate =>
      'Incluido en el calendario del Senado';

  @override
  String get statusIntroducedInSenate => 'Presentado en el Senado';

  @override
  String get statusEngrossedInHouse =>
      'Aprobado en su forma final en la Cámara';

  @override
  String get statusAgreedToSenate => 'Acordado en el Senado';

  @override
  String get statusEngrossedAmendmentHouse => 'Enmienda aprobada en la Cámara';

  @override
  String get statusFailedPassageSenate => 'Rechazado en el Senado';

  @override
  String get statusLaidOnTableInHouse =>
      'Archivado en la Cámara de Representantes';

  @override
  String get statusPrivateLaw => 'Ley Privada';

  @override
  String get statusPublicLaw => 'Ley Pública';

  @override
  String get statusAdopted => 'Adoptado';

  @override
  String get statusDeBundesratApproved => 'El Bundesrat ha aprobado';

  @override
  String get statusDeAdopted => 'Aprobado';

  @override
  String get statusDeIntroductionApproved => 'Introducción aprobada';

  @override
  String get statusDeAnnounced => 'Promulgado';

  @override
  String get statusDeRejected => 'Rechazado';

  @override
  String get statusDeBundesratDenied =>
      'El Bundesrat ha denegado su consentimiento';

  @override
  String get statusDeIntroductionRejected => 'Introducción rechazada';

  @override
  String get statusDeDeclaredCompleted => 'Declarado concluido';

  @override
  String get statusDeCompletedByTermEnd => 'Concluido por fin de legislatura';

  @override
  String get statusDeDeclaredUnconstitutional => 'Declarado inconstitucional';

  @override
  String get statusDeWithdrawn => 'Retirado';

  @override
  String get statusDeBundesratProcessCompleted =>
      'Proceso en el Bundesrat completado';

  @override
  String get statusDeCompleted => 'Completado';

  @override
  String get statusDeCompletedSeeProcess => 'Completado - ver procedimiento';

  @override
  String get statusDeRecommendationAvailable =>
      'Recomendación de resolución disponible';

  @override
  String get statusDeToBundesratNotDeliberated =>
      'Transmitido al Bundesrat - aún no deliberado';

  @override
  String get statusDeAssignedToCommittees => 'Asignado a comisiones';

  @override
  String get statusDeNotYetDeliberated => 'Aún no deliberado';

  @override
  String get statusDeMergedWith => 'Fusionado con... (ver procedimiento)';

  @override
  String get statusDeReferred => 'Remitido';

  @override
  String get statusFrLawPublished => 'Ley publicada';

  @override
  String get statusFrOrdinancePublished => 'Ordenanza publicada';

  @override
  String get statusFrResolutionPublished => 'Resolución publicada';

  @override
  String get statusFrDecreePublished => 'Decreto publicado';

  @override
  String get statusFrDecision => 'Decisión';

  @override
  String get statusFrRejected => 'Rechazado';

  @override
  String get statusFrPrescribed => 'Prescrito';

  @override
  String get statusFrPropositionLoi => 'Proposición de ley';

  @override
  String get statusFrProjetLoi => 'Proyecto de ley';

  @override
  String get statusUkActOfParliament => 'Ley del Parlamento';

  @override
  String get statusUkRoyalAssent => 'Asentimiento Real';

  @override
  String get statusUkWithdrawn => 'Retirado';

  @override
  String get statusUkRejected => 'Rechazado';

  @override
  String get statusUk1stReading => '1ª lectura';

  @override
  String get statusUk2ndReading => '2ª lectura';

  @override
  String get statusUk3rdReading => '3ª lectura';

  @override
  String get statusUkCommitteeStage => 'Fase de comité';

  @override
  String get statusUkCommonsExaminers => 'Examinadores de los Comunes';

  @override
  String get statusUkLordsSpecialCommittee =>
      'Comité Especial de Proyectos de Ley Públicos de los Lores';

  @override
  String get statusUkMoneyResolution => 'Resolución financiera';

  @override
  String get statusUkConsiderationLordsAmendments =>
      'Consideración de las enmiendas de los Lores';

  @override
  String get statusUkConsiderationLordsMessage =>
      'Consideración del mensaje de los Lores';

  @override
  String get statusUkOrderOfCommitmentDischarged => 'Orden de remisión anulada';

  @override
  String get statusUkProgrammeMotion => 'Moción de programación';

  @override
  String get statusUkReportStage => 'Fase de informe';

  @override
  String get statusUkSecondReadingCommittee => 'Comité de segunda lectura';

  @override
  String get statusUkWaysAndMeansResolution =>
      'Resolución de Medios y Arbitrios';

  @override
  String get errorCheckConnection =>
      'Por favor, compruebe su conexión a internet.';

  @override
  String get buttonRetry => 'Intentar de nuevo';

  @override
  String get shareAsPost => 'Compartir como publicación (1:1)';

  @override
  String get shareAsStory => 'Compartir como historia (16:9)';

  @override
  String get morePointsInApp =>
      '...la información completa está disponible en la Lustra';

  @override
  String get civicRulesAction => 'Crea tu proyecto';

  @override
  String get pollVotingViaApp => '¡Votación disponible en la aplicación!';

  @override
  String get supportPollTitle => 'Encuesta de apoyo';

  @override
  String get termsCountLabel => 'Número de mandatos';

  @override
  String get settingsNotificationsNewLaws =>
      'Notificaciones sobre nuevas legislaciones';

  @override
  String get settingsNotificationsVoteResults =>
      'Notificaciones sobre resultados de votaciones';

  @override
  String get detailsButton => 'Detalles';

  @override
  String get errorNoVotingsDetails => 'SIN DATOS DETALLADOS DE LA VOTACIÓN';

  @override
  String get clearText => 'Limpiar';

  @override
  String get consideredOnLabel => 'En consideración el:';

  @override
  String get legislationFooterAiDisclaimer =>
      'El resumen anterior fue generado por IA y es una elaboración del documento gubernamental original, respetando todos los principios de imparcialidad e información libre. Los detalles de la consulta utilizada y su esquema se pueden encontrar en la pestaña de información.';

  @override
  String get legislationFooterModelUsed => 'Modelo utilizado:';

  @override
  String get legislationFooterSourceData =>
      'Los datos fuente están disponibles de forma gratuita en el sistema gubernamental en:';

  @override
  String get appMotto =>
      '... es decir, información legislativa imparcial y sin tintes políticos.';

  @override
  String get acceptTermsPrefix => 'Acepto los';

  @override
  String get termsAndConditions => 'Términos y la Política de Privacidad';

  @override
  String get validatorAcceptTerms =>
      'Debes aceptar los términos para continuar.';

  @override
  String get joinSupportClubPrefix => 'Quiero unirme al';

  @override
  String get supportClub => 'Club de Apoyo Lustra';

  @override
  String get supportClubDescription =>
      'Recibirás información especial sobre el desarrollo del proyecto y futuras iniciativas.';

  @override
  String get registrationFinishTitle => 'Completar registro';

  @override
  String get welcomeMessage => '¡Bienvenido!';

  @override
  String get finalStepMessage =>
      'Solo un último paso. Por favor, acepta los términos para continuar.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get selectYourParliament => 'Seleccione su parlamento';

  @override
  String get validatorSelectParliament =>
      'Por favor, seleccione un parlamento para continuar.';

  @override
  String get forgotPasswordButton => '¿Olvidaste tu contraseña?';

  @override
  String get passwordResetEmailSent =>
      'Se ha enviado un enlace para restablecer la contraseña a tu correo electrónico.';

  @override
  String get authErrorUserNotFound =>
      'No se encontró ningún usuario con esta dirección de correo electrónico.';

  @override
  String get settingsDeleteAccount => 'Eliminar cuenta';

  @override
  String get errorDeleteAccount =>
      'No se pudo eliminar la cuenta. Por favor, inténtalo de nuevo.';

  @override
  String get dialogReauthenticateTitle => 'Confirma tu identidad';

  @override
  String get dialogConfirm => 'Confirmar';

  @override
  String get dialogDeleteAccountTitle =>
      '¿Estás seguro de que quieres eliminar tu cuenta?';

  @override
  String get dialogDeleteAccountContent =>
      'Esta acción no se puede deshacer. Todos tus datos, incluido tu historial de votaciones, se eliminarán permanentemente.';

  @override
  String get dialogDelete => 'Eliminar';

  @override
  String get termsAndPrivacyTitle => 'Constitución y Privacidad';

  @override
  String get termsOfServiceTab => 'Reglas';

  @override
  String get privacyPolicyTab => 'Privacidad';

  @override
  String get termsOfServiceContent =>
      'REGLAS DE LA COMUNIDAD LUSTRA\nFecha: 6 de diciembre de 2025\n\n1. OPERADOR Y MISIÓN\nLustra es una infraestructura pública digital. El operador legal (Custodio) es FO&WO VENTURES SP. Z O.O. (LLC). La empresa actúa como incubadora: sin dividendos, sin inversores externos, reinversión en infraestructura.\n\n2. CÓDIGO Y LICENCIA (SOURCE AVAILABLE)\nEl código es un bien común.\n• Modelo: Open Source (AGPLv3).\n• Permitido: Uso educativo, investigación, sin fines de lucro.\n• Prohibido: Las corporaciones no pueden lucrar sin consentimiento.\n\n3. HOJA DE RUTA DE GOBERNANZA\nObjetivo: descentralización.\n• Actual: Fundador (Jacek) como Arquitecto Principal.\n• Pronto: Consejo Cívico elegido por usuarios.\n• Meta: Mecanismos para que la comunidad tome el control si se traiciona la misión.\n\n4. PROYECTOS CIUDADANOS\nIncubadora de leyes.\n• Procedimiento: Envío por formulario, verificación formal.\n• Licencia CC0: Liberas el proyecto al Dominio Público. La ley es de todos.\n• Libertad de expresión: No juzgamos opiniones. Solo rechazamos violaciones del código penal.\n• Verificación: Debes ser ciudadano del país correspondiente.\n\n5. IA Y FUENTES\n• Rol IA: Ayuda a navegar pero puede errar.\n• Fuente: La autoridad final es siempre el PDF original.\n\n6. SEGURIDAD\n• Edad: Usuarios 16+.\n• Prohibido: Ataques a infraestructura y scraping comercial.\n\n7. DISPOSICIONES FINALES\nRegido por la ley polaca.';

  @override
  String get privacyPolicyContent =>
      'POLÍTICA DE PRIVACIDAD: MINIMIZACIÓN\nFecha: 6 de diciembre de 2025\n\nNo vendemos tu atención. Recolección mínima.\n\n1. CONTROLADOR DE DATOS\nFO&WO VENTURES SP. Z O.O. Contacto: jacek@lustra.dev\n\n2. QUÉ RECOPILAMOS\n• Cuenta (Email/UID): Necesario para login.\n• Votos: Vinculados a tu cuenta para evitar manipulación (bots). Públicamente solo agregados anónimos.\n• Retención: Datos de votación conservados durante la legislatura + 5 años (archivo). Luego anonimizados.\n• Comunicación (Club de Apoyo): Si aceptas (ajustes), enviamos novedades. Puedes retirar el consentimiento cuando quieras.\n• Proyectos Ciudadanos: Contenido público.\n\n3. LO QUE NO HACEMOS\n• NO vendemos datos.\n• NO usamos rastreo publicitario.\n• NO perfilamos políticamente.\n\n4. INFRAESTRUCTURA & SEGURIDAD\n• Ubicación: Google Cloud, Europa-West9 (París).\n• Anti-Bot: Usamos Firebase App Check.\n• IA: Tus datos privados NUNCA van a la IA.\n\n5. NIÑOS\nServicio para 16+. No recopilamos datos de niños.\n\n6. ELIMINACIÓN\nBotón \"Eliminar cuenta\" en ajustes para borrado inmediato.\n\n7. TUS DERECHOS\nAcceso, rectificación, eliminación, oposición. Contacto: jacek@lustra.dev';

  @override
  String get techTitle => 'Lustra AI Protocol v1.1';

  @override
  String get techIntroTitle =>
      '1. METODOLOGÍA DE TRABAJO COMPLETA (LUSTRA AI PROTOCOL)';

  @override
  String get techIntroBody =>
      'A continuación presentamos el pipeline completo de agentes de IA utilizados para generar resúmenes de textos legales y detectar alucinaciones en ellos. El objetivo era desactivar el \"agujero negro legislativo\" acercándose al mismo tiempo a la mayor objetividad posible. Sin embargo, hay que subrayar que no creemos en la neutralidad total. Toda compresión de datos (resumen) es una forma de elección. En lugar de fingir el \"monopolio de la verdad\" de los medios, adoptamos un sesgo explícito: la \"perspectiva ciudadana\" en el marco de la context sterilization. Se instruye a los modelos para que ignoren el teatro político y se centren en el bolsillo, las libertades y las obligaciones. Es una decisión de diseño de ingeniería, no política.';

  @override
  String get techDiagramTitle =>
      '2. ESQUEMA DE FLUJO GENERALIZER-JUDGE-SURGEON';

  @override
  String get techDiagramIntro =>
      'El sistema funciona en un bucle de verificación. No confiamos en los modelos generativos; confiamos en los procesos de comprobación y en un enfoque iterativo para la expansión de los sistemas.';

  @override
  String get techDiagramOutro =>
      'En el futuro, planeamos ampliar el sistema con roles adicionales, como un periodista de investigación o un analizador de riesgos legales.';

  @override
  String get techPromptsTitle => '3. INSTRUCCIONES COMPLETAS DE LOS AGENTES';

  @override
  String get techPromptsIntro =>
      'A continuación se encuentran los prompts completos que reciben los modelos, junto con comentarios explicativos para el lector. Las respuestas se devuelven inmediatamente en 8 idiomas para la localización completa de Lustra, por lo que hemos omitido toda la estructura de respuesta JSON para mayor legibilidad.';

  @override
  String get techGeneralizerTitle => 'A) Generalizer';

  @override
  String get techGeneralizerBody =>
      'Modelo: Gemini Flash (predeterminado) / Pro (para <20k tokens)';

  @override
  String get techGeneralizerCode =>
      '// CONFIGURACIÓN DEL MODELO\n// La definición del rol es crítica. \"[country]\" es una variable que estabiliza el modelo.\n// La perspectiva de un ciudadano de Ucrania (país en guerra) es diferente para los modelos que la de un ciudadano de Bélgica (que puede prestar más atención a la burocracia).\n// Esto establece todo el contexto de interpretación de la \"importancia\" de una disposición.\nEres un experto en leyes de [country], [...]\n\n// METODOLOGÍA CORE\n// No es una \"petición suave\". Es una instrucción dura para filtrar el ruido.\n// El modelo debe ignorar la política y buscar el impacto en el bolsillo y la vida.\n[...] que tiene la tarea de analizar documentos de leyes, resoluciones y otros documentos legislativos, y luego preparar información a partir de ellos de manera accesible para los ciudadanos. Tu objetivo es presentar la información de tal manera que los ciudadanos puedan evaluar por sí mismos el impacto de la legislación en sus vidas, incluso sin tener conocimientos legislativos especializados. Céntrate en los hechos y efectos objetivos de los cambios introducidos, evitando valoraciones y opiniones personales. Toda jerga legal está prohibida. Presenta la información de manera clara, concisa y atractiva, para que sea comprensible para una persona sin formación jurídica. Evita oraciones largas y complejas. En lugar de escribir \"el proyecto tiene como objetivo la modificación del código fiscal...\", escribe \"Cambios en impuestos: nuevos alivios y obligaciones para...\". Continúa tu trabajo hasta que resuelvas tu tarea. Si no estás seguro del contenido generado, analiza el documento nuevamente; no adivines. Planifica bien tu tarea antes de comenzarla. En el resumen y los puntos clave, si es posible y justificado, destaca qué beneficios o efectos concretos (positivos o negativos) introduce la ley para la vida cotidiana de los ciudadanos, sus derechos y obligaciones, finanzas personales, seguridad y otras cuestiones importantes (por ejemplo, prohibiciones y mandatos categóricos o las asignaciones financieras y territoriales concretas más importantes).\n// RIGOR TÉCNICO JSON\n// El contenedor backend es despiadado. No aceptará \"cháchara\".\n// Debe ser JSON limpio. Un error en una coma = fallo y rechazo de todo.\nAntes de devolver la respuesta, verifica cuidadosamente que toda la estructura JSON sea 100% correcta, incluidas todas las comas, llaves, corchetes y comillas. Un JSON incorrecto es inaceptable e impedirá el procesamiento de tu trabajo.\nAnaliza cuidadosamente el texto del documento legal a continuación.\nEste es el contenido sobre cuya base debes generar el resumen y los puntos clave:\n--- INICIO DEL DOCUMENTO ---\n[DOCUMENT_TEXT]\n--- FIN DEL DOCUMENTO --\n\n// ESTRUCTURA DE SALIDA (para 8 idiomas)\n// Debe completarse perfectamente. Cada clave se valida.\n// Si el modelo omite p. ej. \"fr_summary\" -> todo va a la basura.\nRECUERDA: Tu respuesta DEBE ser exclusivamente un objeto JSON válido. No agregues ningún carácter adicional, comentario ni texto antes de la etiqueta \'OPEN_BRACE\' ni después de la etiqueta \'CLOSE_BRACE\'. Toda la respuesta debe ser analizable como JSON.\nBasado en el documento ANTERIOR, completa la siguiente estructura JSON: (...)';

  @override
  String get techJudgeTitle => 'B) Judge';

  @override
  String get techJudgeBody => 'Modelo: Flash Lite';

  @override
  String get techJudgeCode =>
      '// CONFIGURACIÓN DEL MODELO\n// Es un modelo heurístico simple, por lo que su rol también debe ser simple. No tiene que \"entender\" la ley. Solo tiene que comparar dos conjuntos de datos. ¡UNA TAREA!\nROL: Fact Checker.\nTAREA: Compara SOURCE (original) y SUMMARY (resumen preparado por otra IA).\nTu objetivo es detectar \"ENTIDADES FABRICADAS\" (Fabricated Entities) en el SUMMARY.\nSOURCE:\n[SOURCE_TEXT]\nSUMMARY TO EVALUATE:\nTitle: [AI_TITLE]\nSummary: [AI_SUMMARY]\nKey Points: [AI_KEY_POINTS]\n// METODOLOGÍA DE EVALUACIÓN\n// Tuvimos que definir reglas rígidas, porque Flash Lite se perdía con la abstracción, así que recibió una lista de verificación.\n// Las instrucciones concretas reducen el ruido de decisión del modelo.\nREGLAS DE EVALUACIÓN:\n1. Verifica todos los NÚMEROS, FECHAS y MONTOS en el SUMMARY. Si falta alguno en SOURCE -> is_valid: false.\n2. Verifica todos los APELLIDOS, ORGANIZACIONES y LUGARES en el SUMMARY. Si falta alguno en SOURCE -> is_valid: false.\n3. Verifica todas las ACCIONES LEGALES concretas. Si este mecanismo no está en SOURCE -> is_valid: false.\n// EXCEPCIÓN PARA LA ABSTRACCIÓN\n// Esto es clave. Los conceptos abstractos (p. ej., \"aumento de la burocracia\") a menudo daban falsos positivos.\n// Tuvimos que excluirlos de la evaluación de \"entidad fabricada\", porque el Juez rechazaba conclusiones lógicas correctas.\nIMPORTANTE: Los conceptos abstractos (p. ej., \"transparencia\", \"confianza\") están permitidos como conclusiones.\n\n// ESTRUCTURA DE SALIDA y requisitos de formato para estructurar la respuesta.\nOUTPUT (JSON):\n(\n\"is_valid\": true/false,\n\"issue\": \"fabricated_entity\" / \"contradiction\" / \"none\"\n)\nREQUISITOS DE FORMATO:\n1. Responde EXCLUSIVAMENTE con un objeto JSON crudo.\n2. NO uses bloques de código Markdown.\n3. NO agregues introducciones ni explicaciones antes ni después del JSON.\n4. El JSON debe ser correcto y estar listo para el análisis.';

  @override
  String get techSurgeonTitle => 'C) Surgeon';

  @override
  String get techSurgeonBody => 'Modelo: Gemini Pro';

  @override
  String get techSurgeonCode =>
      '// CONFIGURACIÓN DEL MODELO\n// El Cirujano no está para escribir. Está para extirpar el cáncer (alucinaciones).\n// Debe mantener la coherencia con el \"Citizen Bias\" impuesto por el Generalizer.\n// Por esta razón, hay que pasar a un grounding agresivo.\nEres un LEGISLATIVE SURGEON.\nTu tarea es auditar y reparar el resumen (JSON) en cuanto a conformidad con el texto fuente (SOURCE).\n// MEGA IMPORTANTE. No puede agregar información. Si lo hiciera, aumentamos el riesgo de alucinación y ya no tiene un juez por encima. Mejor resúmenes incompletos que falsos.\nREGLA FUNDAMENTAL: \"NO NEW INFORMATION\" (nada de información nueva).\nEl resumen solo puede transformar la información contenida en SOURCE (acortar, traducir, sumar). No puede generar nueva información que no esté en SOURCE.\n// PROCEDIMIENTO DE VERIFICACIÓN (WORKFLOW)\n// Forzamos al modelo a un proceso de pensamiento \"Oración por Oración\".\nPROCEDIMIENTO DE VERIFICACIÓN (ejecuta para cada oración en el JSON):\nPregúntate: \"¿Puedo señalar en SOURCE un fragmento concreto que confirme esta afirmación?\"\nSI LA RESPUESTA ES \"SÍ\":\nLa información está confirmada por una cita, un sinónimo o un resultado matemático de los datos en el texto.\nDECISIÓN: Dejar sin cambios.\nSI LA RESPUESTA ES \"NO\":\nLa información no está en el texto (es una alucinación, conocimiento externo del modelo, sobreinterpretación o extrapolación innecesaria).\nDECISIÓN: Elimina esta información o cámbiala para que tenga cobertura en el texto.\nSI LA RESPUESTA ES \"DEPENDE\":\nEl texto es poco claro y el resumen \"adivina\" (p. ej., dando un ejemplo concreto para un término general).\nDECISIÓN: Ve a lo seguro. Elimina las conjeturas. Usa la terminología del texto.\n// CATEGORÍAS DE RIESGO\n// Estimadas en base a errores anteriores del Generalizer.\n// Le damos un \"mapa de ruta\" de dónde suelen estar las minas.\nCATEGORÍAS DE RIESGO (atención especial):\nFechas (inicio de vigencia vs inicio de financiación).\nNúmeros (los montos concretos deben resultar del texto).\nSujetos (quién hace qué).\nAlcance (qué cubre la ley y qué no).\n\nINPUT:\n--- SOURCE_TEXT START ---\n[SOURCE_TEXT]\n--- SOURCE_TEXT END ---\n\n--- FLAGGED_JSON START ---\n[FLAGGED_JSON]\n--- FLAGGED_JSON END ---\n\nOUTPUT:\nExclusivamente el objeto JSON reparado conforme a la estructura: (...)';

  @override
  String get techConclusionsTitle => '4. CONCLUSIONES EMPÍRICAS';

  @override
  String get techConclusionsIntro =>
      'A medida que el sistema se desarrollaba, fue necesario tomar decisiones basadas en observaciones y no en parámetros de los modelos. De esto surgieron algunas ideas bastante interesantes.';

  @override
  String get techConclusionATitle =>
      'A) ¿Por qué usar un modelo \"más tonto\"?';

  @override
  String get techConclusionABody =>
      'Las pruebas iniciales en la ley polaca, auditadas por Claude y ChatGPT, mostraron que Gemini Flash generaba los mejores resúmenes. Justo detrás estaba el modelo Pro, que a veces recibía una calificación ligeramente inferior debido a que sacaba conclusiones de gran alcance u omitía algunos detalles. Paradójicamente, el \"pensamiento\" del modelo contribuía a una calidad de contenido ligeramente peor. ¿Conclusión? Cuando Pro recibe un texto corto y simple, comienza a filosofar. Como resultado, puede omitir hechos clave que considera demasiado obvios. También pierde la estructura JSON (olvida cerrar la llave) con mucha más frecuencia. Para resúmenes simples, la elección es obvia.';

  @override
  String get techConclusionBTitle => 'B) Entonces, ¿para qué Pro?';

  @override
  String get techConclusionBBody =>
      'Los problemas comienzan con documentos más largos. Aquí, el modelo Pro lidera definitivamente, mientras que los modelos más débiles tienen una tendencia mucho mayor a las alucinaciones. Estas observaciones también son confirmadas por estudios científicos (Lost in the Middle). Esto obliga a la necesidad de usar inmediatamente el modelo Pro para documentos más largos.';

  @override
  String get techConclusionCTitle => 'C) Efectividad';

  @override
  String get techConclusionCBody =>
      'Basándose en experiencias empíricas (cientos de pruebas, diferentes parlamentos), la tasa de anti-alucinación es >99%. Para estimar el coeficiente con mayor precisión, se requerirían desembolsos financieros adicionales (miles o decenas de miles de pruebas con los modelos más fuertes de empresas de IA competidoras). Por lo tanto, esto se puede tomar con cautela. La mayoría de las alucinaciones son errores menores, p. ej., el uso de la palabra \"humano\" en lugar de \"diputado\" en el resumen. El principal problema del sistema no son ellas, sino una generalización excesiva. A veces, el Generalizer creará un resumen correcto, pero omitirá un punto crítico que es muy importante debido al debate público. Sin embargo, este es un compromiso que el sistema asume en este momento, centrado en la eliminación total de alucinaciones. El aburrimiento es más seguro que la mentira.';

  @override
  String get techFooterDate => 'Fecha de actualización Q1 2026';

  @override
  String get techFooterLicense => 'Open Source (AGPLv3) License';

  @override
  String get techGraphSource => 'Legislation Source';

  @override
  String get techGraphDecisionLength => '¿Longitud > 20k tokens?';

  @override
  String get techGraphNo => 'NO';

  @override
  String get techGraphYes => 'SÍ';

  @override
  String get techGraphFlash => 'Flash (System 1)';

  @override
  String get techGraphPro => 'Pro (System 2)';

  @override
  String get techGraphJudge => 'The Judge (Flash Lite)';

  @override
  String get techGraphDecisionPass => '¿Resultado: Pass?';

  @override
  String get techGraphPublishFirestore => 'HTML Ready';

  @override
  String get techGraphNoRetry => 'NO (Retry)';

  @override
  String get techGraphRepairLoop => 'Bucle de reparación';

  @override
  String get techGraphRetryFlash => '< 2 errores: Flash';

  @override
  String get techGraphRetrySurgeon => '> 2 errores: Surgeon';

  @override
  String get techGraphSurgeon => 'The Surgeon (Pro)';

  @override
  String get techGraphHtmlReady => 'HTML Ready';

  @override
  String get votingResultsPL1stReadingTitle => 'VOTACIÓN SOBRE EL RECHAZO';

  @override
  String get reportErrorDescription =>
      'Describe brevemente el error o lo que falta. Tu reporte nos ayudará a mejorar la aplicación.';

  @override
  String get reportErrorHint => 'Escribe tu mensaje...';

  @override
  String get reportErrorValidationEmpty => 'El mensaje no puede estar vacío.';

  @override
  String get reportErrorSuccess => '¡Gracias! Tu reporte ha sido enviado.';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionSend => 'Enviar';

  @override
  String get mustBeLoggedInToReport =>
      'Debes iniciar sesión para reportar un error.';

  @override
  String get reportErrorRateLimitExceeded =>
      'Límite de reportes excedido (10 por 24 horas).';

  @override
  String get supportQuickTitle => 'Apoyo rápido';

  @override
  String get supportPaymentsUnavailable =>
      'Los pagos no están disponibles actualmente.';

  @override
  String get supportNoProducts => 'No hay opciones de apoyo disponibles.';

  @override
  String get supportCampaignsTitle => 'Campañas específicas';

  @override
  String get supportCampaignsDescription =>
      'Apoye objetivos de desarrollo específicos, como añadir un nuevo parlamento.';

  @override
  String get supportCampaignsButton => 'Ver campaña activa (próximamente)';

  @override
  String get forceUpdateTitle => 'Actualización Requerida';

  @override
  String get forceUpdateDescription =>
      'Hay una nueva versión de la aplicación disponible. Para continuar, actualiza la aplicación a la última versión.';

  @override
  String get forceUpdateButton => 'Actualizar ahora';

  @override
  String get deputies => 'Diputados';

  @override
  String get sortingLabel => 'Ordenar por: ';

  @override
  String get sortByPopularity => 'Popularidad';

  @override
  String get sortByAttendance => 'Asistencia';

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
    return '$termNumberº Congreso ($memberType)';
  }

  @override
  String get birthYearLabel => 'Año de nacimiento:';

  @override
  String get sponsorshipsTab => 'Patrocinios';

  @override
  String get sponsorshipTypeSponsor => 'Patrocinador';

  @override
  String get sponsorshipTypeCosponsor => 'Copatrocinador';

  @override
  String get termCurrently => '(actualmente)';

  @override
  String get parliamentaryTenureTitle => 'Mandato parlamentario';

  @override
  String get usRoleRepresentative => 'Representante';

  @override
  String get usRoleSenator => 'Senador';

  @override
  String shareLegislationText(Object deepLink) {
    return 'Votar es una elección. Toma la tuya aquí: $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return 'Perfil e historial de votaciones: $deepLink';
  }

  @override
  String get clipboardCopySuccess =>
      '¡Enlace de la app copiado al portapapeles!';

  @override
  String get mandateInactive => 'MANDATO INACTIVO';

  @override
  String get votingUnavailable => 'Votación no disponible';

  @override
  String get historicalTerm => 'LEGISLATURA HISTÓRICA';

  @override
  String get pollUnavailable => 'Sondeo no disponible';

  @override
  String get billsLabel => 'Proyectos de ley';

  @override
  String get sponsorshipSublabel => '(Patrocinados/Copatrocinados)';

  @override
  String get missingDataWarningShare =>
      'Falta el documento fuente de este proyecto de ley. ¡Ayúdanos y presenta una solicitud oficial por correo electrónico para su publicación a través de nuestra app en segundos!';

  @override
  String get missingDataSourceUserMessage =>
      'Falta el documento fuente de este proyecto de ley. ¡Ayúdanos presentando una solicitud oficial por correo electrónico para su publicación y únete al grupo de personas que se preocupan por la transparencia de la información!';

  @override
  String get missingDataSourceButton => 'Solicitar documento por email';

  @override
  String get cannotOpenEmailApp =>
      'No se pudo abrir la aplicación de correo. Comprueba si está instalada y si tienes una cuenta configurada.';

  @override
  String get sortByFreshness => 'Más recientes';

  @override
  String get pollPermissionDeniedError =>
      'Esta votación solo está disponible para usuarios asignados a este parlamento.';

  @override
  String get supportCampaignsButtonActive => 'Apoya la campaña';

  @override
  String get supportCampaignsButtonInactive => 'Campaña inactiva';

  @override
  String get authErrorAppleFailed =>
      'El inicio de sesión con Apple falló. Inténtalo de nuevo.';

  @override
  String get continueWithApple => 'Continuar con Apple';

  @override
  String get homeSearchHint => 'Introduzca una frase...';

  @override
  String get homeSearchButtonDeputies => 'Diputados';

  @override
  String get homeSearchButtonLegislations => 'Leyes';

  @override
  String get actionSeeAll => 'Todo';

  @override
  String get notificationsEnabledForOtherParliament =>
      'Activo para otro parlamento';

  @override
  String get votingResultsUSMotionToTableTitle =>
      'RESULTADOS: MOCIÓN DE RECHAZO';

  @override
  String get crowdfundingLabel =>
      'Apoya a Lustra para que siga siendo una fuente independiente:';

  @override
  String get hashtagLaw => 'Ley';

  @override
  String get hashtagPolitician => 'Político';

  @override
  String get statusIntroduced => 'Presentado';

  @override
  String get statusPassedHouse => 'Aprobado en la Cámara';

  @override
  String get statusPassedSenate => 'Aprobado en el Senado';

  @override
  String get statusBecameLaw => 'Se convirtió en ley';

  @override
  String get statusVetoed => 'Vetado';

  @override
  String get statusFailed => 'Rechazado';

  @override
  String get statusPlacedOnCalendar => 'Colocado en el calendario';

  @override
  String get actionBack => 'Atrás';

  @override
  String get actionViewSourceJson =>
      'Registros de trabajo de IA para este documento';

  @override
  String get manualEmailDialogTitle => 'Enviar mensaje manualmente';

  @override
  String get manualEmailDialogDescription =>
      'No se detectó cliente de correo. Copia los datos a continuación y envíalos tú mismo.';

  @override
  String get labelRecipient => 'Destinatario';

  @override
  String get labelSubject => 'Asunto';

  @override
  String get labelBody => 'Cuerpo del mensaje';

  @override
  String get actionCopy => 'Copiar';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get webBannerDownloadMessage =>
      'Para aprovechar todas las funciones, ¡descarga la aplicación!';

  @override
  String get webBannerDownloadButton => 'Descargar';

  @override
  String get supportStripeButton => 'Apoyar (Stripe)';

  @override
  String get supportFounderMessage =>
      'No hay una gran corporación detrás de este proyecto, solo yo y mi portátil. Construí esto porque creo que tal tecnología debe existir y permanecer 100% independiente del capital, que siempre dicta la narrativa. Este es mi regalo al mundo.';

  @override
  String get civicProjectTitle => 'Proyecto Cívico';

  @override
  String get drafterAuthRequired =>
      'Autenticación requerida. Inicie sesión en Lustra primero.';

  @override
  String get drafterLaunchError => 'Error al iniciar Drafter Gateway:';

  @override
  String get drafterButtonTitle =>
      'USA LUSTRA DRAFTER PARA CREAR UNA LEY DESDE UNA IDEA EN 5 MINUTOS';

  @override
  String get submitCivicProjectButton => 'Crea tu proyecto';

  @override
  String get civicThresholdCandidate => 'Para revisión.';

  @override
  String get statusInitiative => 'Iniciativa';

  @override
  String get civicTitle => 'Proyectos Cívicos';

  @override
  String get civicIncubatorTitle => 'Incubadora de Proyectos Cívicos';

  @override
  String get civicSubtitle => 'Diseñando el futuro de la democracia, juntos.';

  @override
  String get civicSection1Title => '1. Reglas del Programa y Gobernanza';

  @override
  String get civicSection1Intro =>
      'Lustra proporciona infraestructura legislativa a los ciudadanos. Tratamos sus ideas con la misma seriedad que los proyectos de ley gubernamentales. Para garantizar la calidad, se aplican reglas estrictas:';

  @override
  String get civicProcessTitle => 'El Proceso';

  @override
  String get civicRuleSubmissionTitle => 'Presentación:';

  @override
  String get civicRuleSubmissionText =>
      'Envía un borrador por correo electrónico/formulario.';

  @override
  String get civicRuleReviewTitle => 'Revisión Formal (Humana):';

  @override
  String get civicRuleReviewText =>
      'Verificamos el cumplimiento del estándar LDS-1. Filtramos estrictamente el discurso de odio, spam, duplicados y contenido no legislativo.';

  @override
  String get civicRuleAiTitle => 'Esterilización por IA:';

  @override
  String get civicRuleAiText =>
      'Los borradores aprobados son procesados por nuestra IA para eliminar lenguaje emocional y extraer hechos clave.';

  @override
  String get civicRulePublicationTitle => 'Publicación:';

  @override
  String get civicRulePublicationText =>
      'El proyecto recibe una \"Tarjeta de Ley Cívica\" en la app, visualmente igual a la legislación gubernamental.';

  @override
  String get civicWarningTitle => 'Integridad del Proyecto';

  @override
  String get civicWarningText =>
      'El texto principal es inalterable. Solo puedes añadir enmiendas para corregir o mejorar el texto sin cambiar su idea original. Todos los cambios son públicos y se añaden como anexos para mantener la confianza.';

  @override
  String get civicPoliciesTitle => 'Políticas Críticas';

  @override
  String get civicPolicyPublicDomainTitle => 'Dominio Público (CC0):';

  @override
  String get civicPolicyPublicDomainText =>
      'Al enviar un proyecto, renuncia a todos los derechos de autor. La ley pertenece a todos.';

  @override
  String get civicPolicyAstroturfingTitle => 'Anti-Astroturfing:';

  @override
  String get civicPolicyAstroturfingText =>
      'Debe declarar si representa a una organización. El cabildeo oculto resulta en una prohibición permanente.';

  @override
  String get civicPolicyAdPersonamTitle => 'Ad Personam:';

  @override
  String get civicPolicyAdPersonamText =>
      'Los proyectos dirigidos a individuos específicos (difamación) se rechazan inmediatamente.';

  @override
  String get civicPolicyTrashTitle => 'Sin Papelera:';

  @override
  String get civicPolicyTrashText =>
      'Lustra no es un foro. Los borradores de baja calidad, duplicados y manifiestos son rechazados en la entrada.';

  @override
  String get civicSection2Title => '2. Estándar Legislativo Lustra (LDS-1)';

  @override
  String get civicSection2Intro =>
      'Su borrador debe seguir esta estructura. Si parece una publicación de blog, será rechazado.';

  @override
  String get civicStructureTitle => 'Estructura Requerida:';

  @override
  String get civicStructureTitleItem => 'Título:';

  @override
  String get civicStructureTitleText => 'Descriptivo y neutral.';

  @override
  String get civicStructureArticlesItem => 'Artículos:';

  @override
  String get civicStructureArticlesText =>
      'Texto dividido en unidades numeradas (Art. 1, Art. 2...) que contienen mecanismos específicos (prohibiciones, mandatos).';

  @override
  String get civicStructureExposeItem => 'Exposición de Motivos:';

  @override
  String get civicStructureExposeText => 'Sección obligatoria que explica:';

  @override
  String get civicExposePoint1 => '• (1) Diagnóstico del problema.';

  @override
  String get civicExposePoint2 => '• (2) Objetivo de la regulación.';

  @override
  String get civicExposePoint3 => '• (3) Impacto social esperado.';

  @override
  String get civicSection3Title => '3. Puntuación de Preparación Lustra';

  @override
  String get civicSection3Intro =>
      'No juzgamos sus opiniones políticas. Juzgamos la calidad de la construcción. Nuestra IA analiza cada borrador en una escala de 0-100:';

  @override
  String get civicScoreStructureTitle => 'Estructura (30 pts):';

  @override
  String get civicScoreStructureText =>
      'Formato legal correcto y lenguaje preciso.';

  @override
  String get civicScoreExposeTitle => 'Integridad de la Exposición (30 pts):';

  @override
  String get civicScoreExposeText =>
      'Claridad de la definición del problema/solución.';

  @override
  String get civicScoreLogicTitle => 'Lógica Interna (20 pts):';

  @override
  String get civicScoreLogicText => 'Ausencia de contradicciones.';

  @override
  String get civicScoreImpactTitle => 'Análisis de Impacto (20 pts):';

  @override
  String get civicScoreImpactText =>
      'Viabilidad e identificación de grupos afectados.';

  @override
  String get civicThresholdsTitle => 'Umbrales:';

  @override
  String get civicThresholdRejected => 'Rechazado / Devuelto.';

  @override
  String get civicThresholdReady => 'Publicación prioritaria.';

  @override
  String get civicSection4Title =>
      '4. Kit de Herramientas del Creador (Copiar y Pegar)';

  @override
  String get civicSection4Intro =>
      'Use esta plantilla para asegurar que su proyecto cumpla con el estándar LDS-1.';

  @override
  String get civicTemplateCode =>
      'TÍTULO: [Inserte Título Descriptivo Aquí]\n\nPREÁMBULO: [Opcional: Reconociendo que...]\n\nCAPÍTULO I: DISPOSICIONES GENERALES\nArt. 1. El objetivo de esta Ley es [Insertar Objetivo].\nArt. 2. Esta Ley se aplica a [Insertar Alcance].\n\nCAPÍTULO II: [MECANISMO PRINCIPAL / PROHIBICIONES]\nArt. 3. \n1. Está prohibido [Acción].\n2. Las entidades están obligadas a [Acción].\n\nCAPÍTULO III: SANCIONES Y DISPOSICIONES FINALES\nArt. X. La violación del Art. 3 se castiga con [Sanción].\nArt. Y. Esta Ley entra en vigor el [Fecha].\n\n---\nEXPOSICIÓN DE MOTIVOS\n\n1. EL PROBLEMA\n[Describa la situación actual y por qué está fallando.]\n\n2. EL OBJETIVO\n[Explique qué soluciona esta ley y cómo.]\n\n3. IMPACTO ESPERADO\n[Describa las consecuencias sociales, económicas o legales.]';

  @override
  String get civicSubmitButton => 'ENVIAR BORRADOR (EMAIL)';

  @override
  String get civicFooterCopyright =>
      '© 2025 Iniciativa Lustra.\nInfraestructura para la Era Cívica.';

  @override
  String civicEmailSubject(Object parliamentName) {
    return '[Envío LDS-1] Título del Proyecto - $parliamentName';
  }

  @override
  String get civicEmailBodyPlaceholder =>
      '[PEGUE SU PLANTILLA AQUÍ]\n\nAutor / Organización:\nInformación de contacto:\n';

  @override
  String get civicEmailDialogTitle => 'Cliente de Correo No Encontrado';

  @override
  String get civicEmailDialogIntro =>
      'Por favor copie los detalles a continuación y envíe manualmente:';

  @override
  String get civicEmailDialogRecipient => 'Destinatario';

  @override
  String get civicEmailDialogSubject => 'Asunto';

  @override
  String get civicEmailDialogBody => 'Cuerpo';

  @override
  String get civicCopiedToClipboard => 'Copiado al portapapeles';

  @override
  String get civicTemplateCopied => '¡Plantilla copiada!';

  @override
  String get supportMegaTitle => 'Propiedad Ciudadana';

  @override
  String get verificationRequiredTitle => 'Verificación requerida';

  @override
  String get verificationRequiredContent =>
      'Para contar su voto en el ranking, debemos confirmar que es humano.\n\nRevise su bandeja de entrada (incluida la carpeta de SPAM).';

  @override
  String get verificationResendLink => 'Reenviar enlace';

  @override
  String get verificationLinkSentSuccess => '¡Enlace reenviado!';

  @override
  String get verificationAlreadyConfirmed => 'Ya he confirmado';

  @override
  String get verificationSuccessVotingUnlocked => '¡Gracias! Ya puede votar.';

  @override
  String get verificationStillNotVerified =>
      'Confirmación no encontrada aún. Inténtelo de nuevo en un momento.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get pollVoteSignificance => 'Tu voto es solo el comienzo.';

  @override
  String get pollShareImpact =>
      'Los algoritmos a menudo nos silencian. Tu única compartición llega a un promedio de 50-300 personas. Ayúdanos a romper la burbuja de las redes sociales.';

  @override
  String get pollShareAction => 'Comparte y amplifica la voz ciudadana';

  @override
  String get listRefreshed => '¡Lista actualizada!';

  @override
  String get errorNoDataReturned => 'Sin datos devueltos';

  @override
  String get errorMustBeLoggedInToSubscribe =>
      'Debes iniciar sesión para suscribirte.';

  @override
  String get subscribedToList => '¡Suscrito a la lista!';

  @override
  String get unsubscribedFromList => 'Suscripción cancelada.';

  @override
  String get errorListRemovedByOwner => 'Lista eliminada por el propietario...';

  @override
  String get errorFailedToUpdateSubscription =>
      'Error al actualizar la suscripción.';

  @override
  String get notificationSentCooldownActive =>
      '¡Notificación enviada a los suscriptores!...';

  @override
  String get errorCooldownActiveNotification =>
      'Bloqueo activo. Puedes enviar...';

  @override
  String get errorFailedToSendNotification =>
      'Error al enviar la notificación.';

  @override
  String get nameYourCuratorList => 'Nombra tu Lista de Autor';

  @override
  String get hintCuratorListExample => 'ej. Mi Política Económica';

  @override
  String listCreatedSuccess(String text) {
    return '¡Lista \'$text\' creada!';
  }

  @override
  String get errorFailedToCreateList => 'Error al crear la lista.';

  @override
  String get actionCreate => 'Crear';

  @override
  String get unnamedList => 'Lista sin nombre';

  @override
  String get tooltipEditList => 'Editar Lista';

  @override
  String get addDescriptionHint =>
      'Añade una descripción para informar a otros...';

  @override
  String subscribersCount(int subs) {
    return '$subs suscriptores';
  }

  @override
  String get actionShareList => 'Compartir Lista';

  @override
  String get actionSupportCreator => 'Apoyar al Creador';

  @override
  String availableInHours(int hoursLeft) {
    return 'Disponible en ${hoursLeft}h';
  }

  @override
  String get actionNotifySubscribers => 'Notificar Suscriptores';

  @override
  String get actionSubscribed => 'Suscrito';

  @override
  String get actionSubscribe => 'Suscribirse';

  @override
  String get tooltipReportList => 'Reportar Lista';

  @override
  String get tooltipDeleteList => 'Eliminar Lista';

  @override
  String get draftYourCivicProject => 'Redacta tu propio proyecto ciudadano';

  @override
  String get draftCivicProjectDescription =>
      'Transforma tus ideas en verdaderos proyectos de ley y reúne apoyo. Lustra está lista para tus políticas.';

  @override
  String get createYourOwnList => 'Crea tu propia lista';

  @override
  String get createYourOwnListDescription =>
      'Conviértete en curador. Selecciona proyectos de ley importantes, invita a seguidores y envía notificaciones a sus dispositivos para mantenerlos informados sobre los cambios en tu lista de legislación o proyectos ciudadanos.';

  @override
  String get editListDetails => 'Editar Detalles';

  @override
  String get listNameLabel => 'Nombre de la Lista';

  @override
  String get descriptionOptionalLabel => 'Descripción (Opcional)';

  @override
  String get supportCreatorOptionalLabel => 'Apoyar al Creador (Opcional)';

  @override
  String providerUsernameLabel(String provider) {
    return 'Nombre de usuario de $provider';
  }

  @override
  String get listUpdatedSuccess => '¡Lista actualizada!';

  @override
  String get errorFailedToUpdate => 'Error al actualizar.';

  @override
  String get actionSave => 'Guardar';

  @override
  String get deleteListDialogTitle => '¿Eliminar Lista?';

  @override
  String get deleteListDialogBody => 'Esta acción no se puede deshacer...';

  @override
  String get listDeletedSuccess => 'Lista eliminada.';

  @override
  String get errorFailedToDelete => 'Error al eliminar.';

  @override
  String get actionDelete => 'Eliminar';

  @override
  String get syncingCuratedFeed => 'SINCRONIZANDO LISTA DE AUTOR...';

  @override
  String get actionTryAgain => 'Reintentar';

  @override
  String get tooltipSetAsListCover => 'Establecer como portada';

  @override
  String get coverUpdatedSuccess => '¡Portada actualizada!';

  @override
  String get errorUpdatingCover => 'Error al actualizar la portada.';

  @override
  String get loaderLoadingProfile => 'CARGANDO PERFIL...';

  @override
  String get loaderRetrievingVoteLogs => 'RECUPERANDO REGISTROS DE VOTOS...';

  @override
  String get loaderLoadingRecentVotes => 'CARGANDO VOTOS RECIENTES...';

  @override
  String get loaderFetchingData => 'OBTENIENDO DATOS...';

  @override
  String get loaderLoadingTrackedBills => 'CARGANDO LEYES SEGUIDAS...';

  @override
  String get emptyTrackedBills => 'Aún no sigues ninguna ley.';

  @override
  String get notificationsMobileOnly =>
      'Notificaciones solo disponibles en la app móvil.';

  @override
  String get titleYourTrackedBills => 'Leyes en Seguimiento';

  @override
  String get buttonSeeAllTracked => 'Ver todo en seguimiento';

  @override
  String get titleNameYourList => 'Nombra tu Lista';

  @override
  String get hintEgMySocialPolicies => 'ej. Mis Políticas Sociales';

  @override
  String snackbarListCreated(String text) {
    return '¡Lista \'$text\' creada!';
  }

  @override
  String get snackbarFailedToCreateList => 'Error al crear la lista.';

  @override
  String get buttonCreate => 'Crear';

  @override
  String get titleRenameYourList => 'Renombrar Lista';

  @override
  String get snackbarListRenamed => '¡Lista renombrada!';

  @override
  String get snackbarFailedToRenameList => 'Error al renombrar.';

  @override
  String get buttonSave => 'Guardar';

  @override
  String get titleYourLists => 'Tus Listas';

  @override
  String get emptyNoListsYet => 'Aún no tienes listas.';

  @override
  String get tooltipRename => 'Renombrar';

  @override
  String get snackbarErrorUpdatingList => 'Error al actualizar.';

  @override
  String get tooltipShareList => 'Compartir Lista';

  @override
  String get buttonCreateNewList => 'Crear Nueva Lista';

  @override
  String get errorLimitOf3ListsReached => 'Límite de 3 listas alcanzado.';

  @override
  String get snackbarFailedToDelete => 'Error al eliminar.';

  @override
  String get loaderFetchingMirrorParliamentData =>
      'OBTENIENDO DATOS DEL PARLAMENTO ESPEJO...';

  @override
  String get loaderSecuringSafeChannel => 'CIFRANDO CONEXIÓN...';

  @override
  String get snackbarAddedToList => 'Añadido a la lista.';

  @override
  String get snackbarRemovedFromList => 'Eliminado de tu lista.';

  @override
  String get loaderLoadingData => 'CARGANDO DATOS...';

  @override
  String get buttonAddToList => 'Añadir a la Lista';

  @override
  String get previousStatusLabel => 'Anteriormente:';

  @override
  String get statusLabel => 'Estado:';

  @override
  String get loaderEstablishingConnection => 'ESTABLECIENDO CONEXIÓN...';

  @override
  String get loaderFetchingInitiatives => 'OBTENIENDO INICIATIVAS...';

  @override
  String get loaderLoadingMoreInitiatives => 'CARGANDO MÁS INICIATIVAS...';

  @override
  String get loaderLoadingMore => 'CARGANDO MÁS...';

  @override
  String get errorMustBeLoggedInToTrack =>
      'Debes iniciar sesión para hacer seguimiento. Crea una cuenta.';

  @override
  String get loaderLoadingYourTrackedList =>
      'CARGANDO TU LISTA DE SEGUIMIENTO...';

  @override
  String get emptyNotTrackingAnything => 'Aún no sigues nada.';

  @override
  String get loaderLoadingLegislativeData => 'CARGANDO DATOS LEGISLATIVOS...';

  @override
  String get loaderAuthorizing => 'AUTORIZANDO...';

  @override
  String get loaderLoading => 'CARGANDO...';

  @override
  String get snackbarLinkCopied => '¡Enlace copiado al portapapeles!';

  @override
  String get civicWillRecord => 'REGISTRO DE VOLUNTAD CÍVICA';

  @override
  String totalVotesRecorded(String totalVotes) {
    return '$totalVotes VOTOS REGISTRADOS';
  }

  @override
  String get recordYourPositionForAudit =>
      'Registra tu postura para auditoría.';

  @override
  String get privateList => 'Lista Privada';

  @override
  String get loaderLoadingCuratedFeed => 'CARGANDO LISTA DE AUTOR...';

  @override
  String get buttonOpenFullList => 'Abrir Lista Completa';

  @override
  String get filtersLabel => 'Filtros';

  @override
  String get statusFilterLabel => 'Estado';

  @override
  String get onlyWithSourceTextLabel => 'Solo con texto de origen';

  @override
  String get trackedBillsTitle => 'Leyes en Seguimiento';

  @override
  String get curatedListTitle => 'Lista Privada';

  @override
  String get loaderLoadingProfiles => 'CARGANDO PERFILES...';

  @override
  String get loaderLoadingMoreProfiles => 'CARGANDO MÁS PERFILES...';

  @override
  String get loaderInitializingMirrorParliament =>
      'INICIALIZANDO PARLAMENTO ESPEJO...';

  @override
  String get loaderSyncingVectors => 'SINCRONIZANDO VECTORES...';

  @override
  String get reportIncludeDiagnosticsTitle => 'Incluir diagnóstico del sistema';

  @override
  String get reportIncludeDiagnosticsSubtitle =>
      'Adjunta el estado activo (Parlamento, Legislatura, Objetivo) para ayudar a solucionar el problema.';

  @override
  String get loaderSendingReport => 'ENVIANDO REPORTE...';

  @override
  String primaryParliamentLabel(String parliament) {
    return 'Principal: $parliament';
  }

  @override
  String get buttonCreateAnotherList => 'Crear Otra Lista';

  @override
  String get buttonCreateTrackingList => 'Crear Lista de Seguimiento';

  @override
  String get errorMissingListId => 'Error: Falta ID de la Lista';

  @override
  String get actionTracked => 'En seguimiento';

  @override
  String get actionTrack => 'Seguir';

  @override
  String pollSupportPercent(String percent) {
    return 'A FAVOR $percent%';
  }

  @override
  String get pollSyncing => 'SINCRONIZANDO...';

  @override
  String pollOpposePercent(String percent) {
    return 'EN CONTRA $percent%';
  }

  @override
  String get pollPositionRecorded => 'POSICIÓN REGISTRADA';

  @override
  String get pollRestrictedToCitizens => 'RESTRINGIDO A CIUDADANOS';

  @override
  String yourListsForCountry(String countryName) {
    return 'Tus Listas ($countryName)';
  }

  @override
  String get bottomNavGetInvolved => 'Participa';

  @override
  String get errorLaunchUrl => 'No se pudo abrir el enlace';

  @override
  String get infoTechTitle => 'Cómo funciona la tecnología';

  @override
  String get infoTechSubtitle =>
      'Conoce nuestra arquitectura, la esterilización de datos y los principios de civic tech.';

  @override
  String get infoGovTitle => 'Transparencia y Gobernanza';

  @override
  String get infoGovSubtitle =>
      'Quién construye esto, quién lo paga y hacia dónde vamos.';

  @override
  String get infoPrivacyTitle => 'Constitución y Privacidad';

  @override
  String get infoPrivacySubtitle =>
      'Transparencia radical. Qué datos recopilamos y por qué.';

  @override
  String get manualTitle => 'Manual Abierto del Ciudadano';

  @override
  String get manualSubtitle =>
      'Aprende a recuperar la capacidad de acción en la democracia.';

  @override
  String get howToActTitle => 'Cómo actuar con Lustra';

  @override
  String get actAuditTitle => 'Auditoría Ciudadana';

  @override
  String get actAuditSubtitle =>
      'Vota sobre las leyes para dar forma a la jerarquía de temas y dejar una prueba sólida de la Voluntad Ciudadana. No dejes que los medios desvíen la conversación.';

  @override
  String get actWatchlistTitle => 'Listas de Seguimiento';

  @override
  String get actWatchlistSubtitle =>
      'Crea listas personalizadas de proyectos de ley oficiales para reunir suscriptores y crear conciencia. Usa las redes sociales como poder de presión.';

  @override
  String get actDraftTitle => 'Redactar Leyes Ciudadanas';

  @override
  String get actDraftSubtitle =>
      'Envía tus propias iniciativas profesionales a Lustra. La sociedad necesita nuevas ideas que no estén bloqueadas por el capital. Crea, comparte y reúne apoyo.';

  @override
  String get joinCommunityTitle => 'Únete a la Comunidad';

  @override
  String get subscribedLists => 'Suscrito';

  @override
  String get snackbarAddedToListWebPromo =>
      '¡Añadido! Descarga la app para recibir notificaciones sobre este proyecto.';

  @override
  String get aboutGovAppBar => 'Gobernanza';

  @override
  String get aboutGovTitle => 'Transparencia y Gobernanza';

  @override
  String get aboutGovSubtitle =>
      'Quién construye esto, quién lo paga y hacia dónde nos dirigimos.';

  @override
  String get aboutGovFounderName => 'Jacek (Fons)';

  @override
  String get aboutGovFounderBadge => 'ARQUITECTO SOLITARIO / FUNDADOR';

  @override
  String get aboutGovFounderP1 =>
      'No soy político, abogado ni académico. No tengo credenciales formales. Hace 18 meses trabajaba limpiando. Pasé todo el año 2025 desempleado, construyendo este sistema desde cero en una laptop del 2016.';

  @override
  String get aboutGovFounderP2 =>
      '¿Por qué? Porque me frustraba que los multimillonarios y las corporaciones tuvieran mejores herramientas de datos que los ciudadanos. Me frustraba que se excluyera a los ciudadanos de la ley y las guerras narrativas desplegadas por los medios, que alienan a las personas de la política o las obligan a elegir un bando. Aprendí todo por mi cuenta para construir un Parlamento Espejo (Mirror Parliament). No creo en las peticiones en línea; creo en la transparencia dura, basada en datos, y en la accesibilidad. Y en que la democracia necesita una actualización.';

  @override
  String get aboutGovFounderP3 =>
      'Podrías preguntarte: \"¿Por qué debería confiar en ti?\". No confíes en nadie, especialmente en política: empieza a auditar.';

  @override
  String get aboutGovSec1Title => '1. Financiación e Infraestructura';

  @override
  String get aboutGovSec1Intro =>
      'No hay capital de riesgo (VC). No hay dinero negro. No hay criptomonedas. Actualmente, esta operación está financiada íntegramente con recursos propios mínimos (bootstrapped).';

  @override
  String get aboutGovSec1Bullet1Title => 'Infraestructura:';

  @override
  String get aboutGovSec1Bullet1Text =>
      'Cubierta por una subvención de 2.000 \$ en créditos del programa Google For Startups. Actualmente nos quedan unos 1.200 \$, lo que nos da aproximadamente 12 meses de margen para mantener los servidores.';

  @override
  String get aboutGovSec1Bullet2Title => 'Costo de vida:';

  @override
  String get aboutGovSec1Bullet2Text =>
      'Sostenido enteramente por mis ahorros personales, mi prometida y mi familia.';

  @override
  String get aboutGovSec1Bullet3Title => 'Stack Tecnológico:';

  @override
  String get aboutGovSec1Bullet3Text =>
      'Construido en solitario (Flutter, Firebase, pipeline de Vertex AI, Node.js) para mantener los costos operativos cercanos a cero.';

  @override
  String get aboutGovSec2Title => '2. Entidad Legal Actual y la Transición';

  @override
  String get aboutGovSec2P1 =>
      'Lustra se está incubando actualmente bajo mi antigua LLC polaca (FO&WO VENTURES SP. Z O.O.). Esta es una necesidad legal. Para publicar en las App Stores de Apple/Google y recibir los créditos de Google Startup, se requiere una empresa registrada con un número DUNS. Todavía no puedo permitirme los gastos legales para crear una Fundación (más de 500 \$ de configuración y contabilidad mensual), así que utilizo el vehículo más ágil posible.';

  @override
  String get aboutGovSec2BoxTitle => 'La Hoja de Ruta hacia una ONG:';

  @override
  String get aboutGovSec2BoxText =>
      'Tan pronto como alcancemos liquidez financiera y masa crítica (aprox. 100k usuarios mensuales), planeo abrir una Organización Sin Fines de Lucro formal y transferir toda la propiedad intelectual y la infraestructura allí.';

  @override
  String get aboutGovSec2P2 =>
      'El objetivo final es una estructura de gobernanza democrática. Las decisiones serán tomadas por una junta elegida por la comunidad. Mi rol se limitará estrictamente al mantenimiento técnico del backend. No veo otro futuro para Lustra que no sea una operación sin fines de lucro con total transparencia de todos los documentos financieros.';

  @override
  String get aboutGovSec3Title => '3. Seguridad y Código Fuente';

  @override
  String get aboutGovSec3Bullet1Title => 'Autenticación:';

  @override
  String get aboutGovSec3Bullet1Text =>
      'No tocamos tus contraseñas. Usamos la autenticación de Google/Apple porque su infraestructura de seguridad es superior. Solo almacenamos un ID de Usuario anonimizado y tu ID de Voto para evitar granjas de bots.';

  @override
  String get aboutGovSec3Bullet2Title =>
      'Código Fuente Disponible (Source Available):';

  @override
  String get aboutGovSec3Bullet2Text =>
      'Los repositorios principales son públicos bajo la Licencia Open Source (AGPLv3). Está protegido contra la clonación corporativa, pero los adaptadores de datos, los prompts del sistema de IA y la lógica son completamente visibles para su auditoría.';

  @override
  String get aboutGovSec3BoxTitle => 'Necesitamos ayuda.';

  @override
  String get aboutGovSec3BoxText =>
      'Soy un solo tipo con una laptop vieja, haciendo de todo. Si eres desarrollador, periodista o un ciudadano que quiere ayudar a establecer células locales en tu país, contáctanos.';

  @override
  String get aboutGovSec3Contact => 'Contacto: jacek@lustra.dev';

  @override
  String get aboutGovSec3Github => 'Perfil de GitHub';

  @override
  String get termsAppBar => 'Constitución y Privacidad';

  @override
  String get termsTitle => 'Constitución y Privacidad';

  @override
  String get termsLastUpdated => 'Última actualización: 12 de marzo de 2026';

  @override
  String get termsAlertTitle =>
      'Transparencia Radical: Lo que realmente recopilamos';

  @override
  String get termsAlertP1 =>
      'Podrías estar pensando: \"No le voy a dar mis datos a unos desconocidos\". Estamos de acuerdo. Por eso no queremos tu vida personal. Solo queremos verificar que eres un humano real votando sobre leyes reales.';

  @override
  String get termsAlertP2 =>
      'Aquí está la estructura exacta de datos que almacenamos para tu perfil de usuario en nuestra base de datos Google Cloud Firestore. Sin campos ocultos. Sin cookies de seguimiento.';

  @override
  String get termsAlertCode =>
      '[\n  \'uid\': \'0A21rfdsTs1F3kYsx3252352\', // Generado por Firebase Auth\n  \'email\': \'ciudadano@example.com\', // Tus únicos Datos Personales\n  \'createdAt\': \'February 15, 2026 at 8:23:31 PM UTC\',\n  \'marketingConsent\': true, // Para actualizaciones del proyecto (opcional)\n  \'primaryParliamentId\': \'Congreso de los Diputados\'\n]';

  @override
  String get termsAlertH4 =>
      'Espera, ¿dónde están mis votos y leyes en seguimiento?';

  @override
  String get termsAlertP3 =>
      'Para proteger tu privacidad y garantizar que nuestra base de datos escale de manera eficiente, tus interacciones están separadas (sharded) de tu perfil principal:';

  @override
  String get termsAlertB1Title => 'Leyes en Seguimiento:';

  @override
  String get termsAlertB1Text =>
      'Almacenadas en una subcolección privada. Solo tú (y tu dispositivo) pueden solicitar ver la lista de leyes a las que haces seguimiento.';

  @override
  String get termsAlertB2Title => 'Tus Votos (Hashing Criptográfico):';

  @override
  String get termsAlertB2Text =>
      'Cuando votas, NO adjuntamos tu UID directamente al registro público de votos. En su lugar, el servidor genera un Hash criptográfico (ej., a1b2c3d4...) utilizando una clave secreta (salt) del servidor. Esto seudonimiza fuertemente tu voto. Si un hacker roba la base de datos, no puede ver quién votó por qué. Aunque matemáticamente es una función unidireccional, en el espíritu de transparencia absoluta, debes saber que los operadores del sistema (que poseen la clave secreta) teóricamente podrían verificar un voto para auditar el sistema por fraude o cumplir con una orden judicial válida. Sin embargo, tus votos están estrictamente separados de tu perfil diario y nunca se muestran públicamente junto a tu identidad.';

  @override
  String get termsAlertP4 =>
      'Eso es todo. El resto es analítica anónima (Firebase Analytics) para corregir errores, y App Check para evitar que las granjas de bots manipulen las votaciones. No vendemos datos. No publicamos anuncios.';

  @override
  String get termsTocTitle => 'Tabla de Contenidos';

  @override
  String get termsPart1Title =>
      'Parte 1: Política de Privacidad (Minimización de Datos)';

  @override
  String get termsPart1Intro =>
      'No comerciamos con tu atención. Recopilamos solo lo técnicamente necesario para operar una infraestructura cívica segura.';

  @override
  String get termsP1S1Title => '1. Responsable de los Datos';

  @override
  String get termsP1S1Text =>
      'El operador legal es temporalmente FO&WO VENTURES SP. Z O.O. (LLC), con sede en Wrocław, Polonia. Contacto: jacek@lustra.dev';

  @override
  String get termsP1S2Title => '2. Qué Recopilamos';

  @override
  String get termsP1S2B1Title => 'Cuenta (Email/UID):';

  @override
  String get termsP1S2B1Text =>
      'Necesario para el inicio de sesión seguro a través de Firebase Authentication.';

  @override
  String get termsP1S2B2Title => 'Votos y Encuestas (Anonimizados):';

  @override
  String get termsP1S2B2Text =>
      'Tus votos construyen las estadísticas. Están vinculados a tu cuenta puramente para prevenir granjas de bots y votos duplicados. Públicamente, tus votos se muestran ÚNICAMENTE como agregados anónimos. El registro real del voto es encriptado criptográficamente para separar tu identidad de tu elección política.';

  @override
  String get termsP1S2B3Title => 'Leyes en Seguimiento y Notificaciones Push:';

  @override
  String get termsP1S2B3Text =>
      'Si eliges seguir una ley o suscribirte a una Lista Curada, usamos los Topics de Firebase Cloud Messaging (FCM) de Google. Esto nos permite enviarte notificaciones push sobre cambios de estado sin rastrear constantemente tu ubicación o identidad de dispositivo.';

  @override
  String get termsP1S2B4Title => 'Retención de Votos:';

  @override
  String get termsP1S2B4Text =>
      'Los datos de votación se almacenan durante la legislatura del parlamento más 5 años para fines de archivo e investigación.';

  @override
  String get termsP1S2B5Title => 'Comunicación:';

  @override
  String get termsP1S2B5Text =>
      'Si das tu consentimiento explícito, te enviaremos actualizaciones del proyecto por correo electrónico. Puedes retirar tu consentimiento en cualquier momento.';

  @override
  String get termsP1S2B6Title => 'Proyectos Ciudadanos:';

  @override
  String get termsP1S2B6Text =>
      'El contenido de los borradores legislativos enviados por ti es completamente público.';

  @override
  String get termsP1S2Highlight =>
      '3. LO QUE NO HACEMOS:\n\n❌ NO vendemos datos a intermediarios de datos (data brokers).\n❌ NO usamos seguimiento publicitario.\n❌ NO te perfilamos políticamente con fines comerciales.';

  @override
  String get termsP1S3Title => '4. Infraestructura y Seguridad';

  @override
  String get termsP1S3B1Title => 'Ubicación:';

  @override
  String get termsP1S3B1Text =>
      'Los datos se alojan de forma segura en Google Cloud Platform, Europe-West9 (París).';

  @override
  String get termsP1S3B2Title => 'Anti-Bot:';

  @override
  String get termsP1S3B2Text =>
      'Usamos Firebase App Check para verificar la autenticidad de la aplicación y prevenir la manipulación automatizada.';

  @override
  String get termsP1S3B3Title => 'Privacidad de IA:';

  @override
  String get termsP1S3B3Text =>
      'Solo enviamos documentos gubernamentales públicos a los modelos de IA para su resumen. Tus datos privados NUNCA van a la IA.';

  @override
  String get termsP1S4Title => '5. Menores y Eliminación de Cuenta';

  @override
  String get termsP1S4P1 =>
      'El servicio está destinado a usuarios mayores de 16 años. No recopilamos conscientemente datos de niños.';

  @override
  String get termsP1S4P2 =>
      'Para eliminar tus datos: Usa el botón \"Eliminar Cuenta\" directamente en la configuración de la aplicación para borrar inmediatamente tus datos de identificación, correo electrónico y todas tus subcolecciones de nuestros servidores.';

  @override
  String get termsP1S5Title => '6. Tus Derechos';

  @override
  String get termsP1S5Text =>
      'Bajo el RGPD, tienes derecho a acceder, rectificar, eliminar y oponerte al procesamiento de tus datos. Contáctanos en el correo electrónico proporcionado arriba.';

  @override
  String get termsPart2Title =>
      'Parte 2: Reglas de la Comunidad (Términos de Servicio)';

  @override
  String get termsP2S1Title => '1. Operador y Misión';

  @override
  String get termsP2S1Text =>
      'Lustra es una infraestructura pública digital. La empresa actúa como una incubadora: no paga dividendos, no tiene inversores externos y reinvierte cualquier ingreso directamente en el mantenimiento de la infraestructura.';

  @override
  String get termsP2S2Title => '2. Código y Licencia (Source Available)';

  @override
  String get termsP2S2Intro =>
      'El código de Lustra es un bien común protegido contra la explotación corporativa.';

  @override
  String get termsP2S2B1Title => 'Modelo:';

  @override
  String get termsP2S2B1Text => 'Licencia Open Source (AGPLv3).';

  @override
  String get termsP2S2B2Title => 'Permitido:';

  @override
  String get termsP2S2B2Text =>
      'Uso educativo, de investigación y sin fines de lucro/cívico.';

  @override
  String get termsP2S2B3Title => 'Prohibido:';

  @override
  String get termsP2S2B3Text =>
      'Las corporaciones no pueden usar ni beneficiarse de nuestro trabajo sin el consentimiento explícito de la comunidad.';

  @override
  String get termsP2S3Title => '3. Hoja de Ruta de Gobernanza';

  @override
  String get termsP2S3Intro =>
      'Nuestro objetivo a largo plazo es la descentralización total.';

  @override
  String get termsP2S3B1Title => 'Estado actual:';

  @override
  String get termsP2S3B1Text => 'El Fundador actúa como Arquitecto Principal.';

  @override
  String get termsP2S3B2Title => 'Pronto:';

  @override
  String get termsP2S3B2Text =>
      'Establecimiento de una Junta Cívica (Civic Board) elegida directamente por los usuarios.';

  @override
  String get termsP2S3B3Title => 'Objetivo:';

  @override
  String get termsP2S3B3Text =>
      'Implementar mecanismos técnicos y legales para que la comunidad tome el control de la plataforma en caso de traición a la misión.';

  @override
  String get termsP2S4Title =>
      '4. Programa de Borradores Ciudadanos (Incubadora de Leyes)';

  @override
  String get termsP2S4Intro =>
      'Proporcionamos un espacio para que los ciudadanos escriban las leyes.';

  @override
  String get termsP2S4B1Title => 'Procedimiento:';

  @override
  String get termsP2S4B1Text =>
      'Los borradores se envían mediante un formulario y son verificados formalmente por el Operador.';

  @override
  String get termsP2S4B2Title => 'Dominio Público:';

  @override
  String get termsP2S4B2Text =>
      'Al enviar un borrador, lo publicas bajo la Licencia CC0 (Dominio Público). La ley pertenece a todos.';

  @override
  String get termsP2S4B3Title => 'Libertad de Expresión:';

  @override
  String get termsP2S4B3Text =>
      'No juzgamos opiniones ni tendencias políticas. Solo rechazamos proyectos que violen el derecho penal o inciten a la violencia.';

  @override
  String get termsP2S4B4Title => 'Verificación:';

  @override
  String get termsP2S4B4Text =>
      'Debes ser ciudadano del país donde envías un borrador.';

  @override
  String get termsP2S5Title => '5. IA y Jerarquía de Fuentes';

  @override
  String get termsP2S5Text =>
      'La IA es una herramienta, no un oráculo. La IA ayuda a navegar por un lenguaje legal complejo pero puede cometer errores. La máxima autoridad es SIEMPRE el documento original PDF/XML enlazado en la parte inferior de cada resumen en la aplicación.';

  @override
  String get termsP2S6Title => '6. Seguridad y Disposiciones Finales';

  @override
  String get termsP2S6Text =>
      'Los ataques a la infraestructura, DDoS y la extracción comercial de datos (scraping) están estrictamente prohibidos. Los asuntos no regulados en este documento se rigen por la ley polaca.';

  @override
  String get bpAppBar => 'Arquitectura del Sistema';

  @override
  String get bpTitle =>
      'Cómo Recuperamos la Agencia en la Democracia con el Parlamento Espejo: Manual del Ciudadano';

  @override
  String get bpIntroBig =>
      'El Panorama General: El sistema democrático actual es un \"teléfono descompuesto\". Arreglamos la señal conectando a los ciudadanos directamente al proceso legislativo a través del Parlamento Espejo (Lustra).';

  @override
  String get bpIntroSmall =>
      'Por qué es importante: Actualmente, solo votamos cada pocos años. Entre elecciones, tenemos control cero. Lustra nos da un \"asiento en la mesa\" todos los días.';

  @override
  String get bpS1Title => '1. EL PROBLEMA: Un Bucle Roto';

  @override
  String get bpS1P1 =>
      'La información fluye en una sola dirección y se distorsiona.';

  @override
  String get bpS1Code =>
      'Ciudadanos eligen políticos\n   ↓\nPolíticos forman un Gobierno\n   ↓\nMedios interpretan selectivamente las acciones del gobierno\n   ↓\nCiudadanos reciben feedback (distorsionado)';

  @override
  String get bpS1Highlight =>
      'Resultado: No sabemos qué está pasando realmente debido a la jerga legal y al ruido mediático.';

  @override
  String get bpS2Title => '2. LA SOLUCIÓN: Arreglando el Flujo de Información';

  @override
  String get bpS2P1 =>
      'Lustra elimina a los intermediarios. Simula una sede de poder real donde tu voz queda registrada en proyectos de ley específicos, no solo en encuestas generales.';

  @override
  String get bpS2FlowMedia => 'MEDIOS (observador opcional)';

  @override
  String get bpS2Flow1 => 'Los ciudadanos ven un borrador de ley y lo evalúan';

  @override
  String get bpS2Flow2 =>
      'Los políticos ven el resultado de la voluntad cívica';

  @override
  String get bpS2Flow3 =>
      'Los políticos votan (monitoreados frente a los datos)';

  @override
  String get bpS2Flow4 =>
      'Los ciudadanos comprueban: ¿Obedeció el político a los datos?';

  @override
  String get bpS2Flow5 =>
      'Los ciudadanos eligen políticos basados en su \"Puntuación de Obediencia\"';

  @override
  String get bpS2Flow6 => 'Se forma un nuevo Gobierno.';

  @override
  String get bpS2FlowLoop => 'EL CICLO SE REPITE';

  @override
  String get bpS3Title => '3. CÓMO FUNCIONA';

  @override
  String get bpS3ATitle =>
      'Paso A: Eliminando la Barrera del Idioma (Traducción)';

  @override
  String get bpS3AP1 =>
      'La mayoría de las leyes son aburridas e ilegibles. Lustra arregla la Brecha de Accesibilidad.';

  @override
  String get bpS3AP2 =>
      'Beneficio: 20 segundos para entender los hechos. Sin jerga.';

  @override
  String get bpS3BTitle =>
      'Paso B: Distribución del Conocimiento (La Tarjeta de Noticias)';

  @override
  String get bpS3BP1 =>
      'Lustra no necesita millones de usuarios para funcionar. Basta con que Tú estés ahí.';

  @override
  String get bpS3BList1Title => 'Tu acción:';

  @override
  String get bpS3BList1Text =>
      'Entras, ves un tema y generas una Tarjeta de Noticias (Fact Card) con un clic.';

  @override
  String get bpS3BList2Title => 'Alcance:';

  @override
  String get bpS3BList2Text =>
      'Se comparte automáticamente en tus redes sociales (FB, X, IG, etc.).';

  @override
  String get bpS3BList3Title => 'Efecto:';

  @override
  String get bpS3BList3Text =>
      'Tus amigos obtienen una \"comida lista\" verificada con hechos sin necesitar la app. Te conviertes en una fuente de información independiente.';

  @override
  String get bpS3BExample => 'Ejemplo:';

  @override
  String get bpS3CTitle => 'Paso C: Recuperando la Agencia (La Presión)';

  @override
  String get bpS3CP1 =>
      'Los políticos y las corporaciones ignoran las \"tormentas de internet\" porque son caóticas, fáciles de censurar y desaparecen rápido.';

  @override
  String get bpS3CList1Title => 'Solución:';

  @override
  String get bpS3CList1Text =>
      'Votaciones Sociales Verificadas. Tu voto está adjunto a un ID de documento legislativo específico.';

  @override
  String get bpS3CList2Title => 'Diferencia:';

  @override
  String get bpS3CList2Text =>
      'No son peticiones que caducan. Son firmas duras con cuentas verificadas.';

  @override
  String get bpS3CP2 =>
      'Si 50.000 personas votan contra una ley, se crea una prueba dura de la falta de apoyo social. Esto no puede ser \"encubierto\" por una narrativa de televisión.';

  @override
  String get bpS4Title => '4. OFENSIVA CÍVICA: Nosotros Escribimos las Leyes';

  @override
  String get bpS4P1 => '¿El gobierno ignora un problema? No esperamos.';

  @override
  String get bpS4List1Title => 'Borradores Cívicos:';

  @override
  String get bpS4List1Text =>
      'Creamos nuestros propios proyectos de ley y recopilamos firmas digitales.';

  @override
  String get bpS4List2Title => 'La Trampa:';

  @override
  String get bpS4List2Text =>
      'Si rechazan una ley popular por tecnicismos, aplicamos enmiendas y la volvemos a enviar.';

  @override
  String get bpS4List3Title => 'La Elección:';

  @override
  String get bpS4List3Text =>
      'Ignorar una solución lista y popular demuestra mala fe. Le da a la oposición un arma gratuita para hacerse con el electorado.';

  @override
  String get bpS4CtaTitle => '¡Apoya estos Borradores Cívicos AHORA!';

  @override
  String get bpS4CtaP1 =>
      'Haz clic abajo para revisar y votar la legislación propuesta:';

  @override
  String get bpS4Card1Title => 'Ley de Desfinanciamiento de la Clase Epstein';

  @override
  String get bpS4Card1Desc =>
      'Corta los fondos públicos para figuras involucradas en tráfico y violaciones de derechos humanos.';

  @override
  String get bpS4Card2Title => 'Enmienda de Límite de Mandatos';

  @override
  String get bpS4Card2Desc =>
      'Establece un límite estricto en la duración de la carrera en el Parlamento.';

  @override
  String get bpS4Card3Title => 'Ley de Ética Parlamentaria';

  @override
  String get bpS4Card3Desc =>
      'Implementa una Prohibición de Comercio de Acciones para miembros activos del parlamento.';

  @override
  String get bpS5Title => '5. RESULTADO FINAL: Purga Política';

  @override
  String get bpS5P1 =>
      'Se acabó el esconderse. El debate vuelve a donde está la gente: a las redes sociales, pero con nuevas reglas. Este es el cumplimiento de la promesa original de internet a la que el sistema temía: el control descentralizado del poder.';

  @override
  String get bpS5P2 =>
      'El Parlamento Espejo enciende la luz en una habitación oscura, forzamos la TRANSPARENCIA. Un político no puede mentir diciendo que \"la gente quiere esto\" cuando los datos muestran lo contrario. Las nuevas leyes sirven al público en general, no al capital.';

  @override
  String get bpS5P3 =>
      'No estamos pidiendo a los políticos que cambien. Estamos creando un sistema donde mentir sobre el apoyo público se vuelve imposible. Esto es democracia impulsada por datos.';

  @override
  String get bpS5Highlight =>
      'Esta es una introducción a la democracia directa, basada en una voz consciente e informada, y no en emociones.';

  @override
  String get caAppBar => 'Auditoría Cívica';

  @override
  String get caTitle =>
      'Auditoría Cívica: Nuevo Sistema para una Mejor Democracia';

  @override
  String get caIntro =>
      'Nadie evalúa el proceso de creación de leyes, excepto unas pocas personas a puerta cerrada y el periodista independiente ocasional que expone la corrupción. Como resultado, la legislación se desvía frecuentemente de las necesidades cívicas, priorizando los intereses políticos o corporativos sobre la adaptación social. Nuestro objetivo final es simple: una sociedad que vote sobre políticas reales, no solo que elija a políticos singulares esperando que cumplan sus promesas. El Parlamento Espejo fue construido para hacer esta transición fácil y alcanzable.';

  @override
  String get caS1Title =>
      '¿En qué se diferencia la Auditoría Cívica de las Peticiones?';

  @override
  String get caS1PetitionsTitle => 'Peticiones Tradicionales';

  @override
  String get caS1PetitionsText =>
      'Las peticiones rara vez funcionan debido a su naturaleza esquiva. Después de recoger firmas, la campaña termina. Básicamente es una solicitud consultiva educada hacia una persona en el poder. Como son campañas limitadas en el tiempo que dependen de un ciclo mediático corto, los políticos pueden desestimarlas fácilmente. Solo tienen que esperar a que los medios cambien la narrativa y la petición se olvida.';

  @override
  String get caS1LustraTitle => 'Voluntad Cívica de Lustra';

  @override
  String get caS1LustraText =>
      'Nosotros no pedimos. En Lustra, tu voto no es solo una firma: está anclado permanentemente a un ID legislativo sólido y oficial. Marca tu postura exacta sobre una política específica. Todos estos votos se combinan para crear la Voluntad Cívica: un medidor en tiempo real que muestra exactamente cómo los ciudadanos evalúan un proyecto, cerrando el bucle de la Auditoría Cívica.';

  @override
  String get caS2Title => '¿Por qué debería importarles a los Políticos?';

  @override
  String get caS2Text =>
      'Porque ya no pueden esconderse.\n\nRegistramos cada uno de sus votos oficiales en el gobierno y los comparamos directamente con la Voluntad Cívica. Ya no pueden mentir diciendo que \"la gente quiere esto\" solo porque hicieron una campaña mediática inteligente. Si votan en algo que beneficia a un grupo de presión (lobby) en lugar de a los ciudadanos, nos enteramos de inmediato. Cuantas más personas usen Lustra para exponer estas brechas, más difícil será para los políticos manipular la narrativa. Recuperamos el control.';

  @override
  String get caS3Title => 'La Mejor Parte: Poder Asimétrico';

  @override
  String get caS3P1 =>
      'No necesitamos a los medios tradicionales como lo hacen los lobbistas. Ni siquiera necesitamos 5 millones de usuarios dentro de la aplicación para actualizar la democracia. Solo te necesitamos a ti.\n\nYa tienes alcance fuera de Lustra: en Facebook, TikTok, X, o en cualquier otro lugar. Por fin podemos convertir las redes sociales en algo significativo. Un usuario que comparte una ley puede generar fácilmente entre 100 y 1.000 vistas con casi cero esfuerzo. Eso es un pequeño estadio de personas aprendiendo sobre una pieza de ley crucial o una iniciativa cívica.';

  @override
  String get caS3MathSubtitle => 'MATEMÁTICAS DE GUERRA ASIMÉTRICA';

  @override
  String get caS3P2 =>
      'Piensa en las matemáticas: un think tank corporativo o grupo de lobby activo puede estar compuesto por 10-15 personas cuya única ventaja es el dinero para comprar favores políticos. Sus 10.000 votos verificados de ciudadanos reales pueden aplastarlos. Podemos hacer exactamente lo que hacen los lobbistas, pero más rápido, de forma transparente y con números abrumadores. Los tiempos han cambiado.';

  @override
  String get caS4Title => '¿Quién controla el Feed? Tú lo haces.';

  @override
  String get caS4Text =>
      'Los medios tradicionales y los algoritmos de las Big Tech optimizan para la indignación con el fin de vender anuncios. El algoritmo de Lustra es estrictamente democrático. No tenemos editores decidiendo qué es \"importante\". Nuestro feed principal evalúa automáticamente los últimos 30 días de legislación, aísla las 5 leyes principales con mayor participación cívica y las rota hacia el centro de atención. Tus votos dictan la jerarquía de la información. Tú controlas el algoritmo.';

  @override
  String get caS5Title => 'El Arsenal: Cómo usar las \"Tarjetas de Hechos\"';

  @override
  String get caS5Intro =>
      'La legislación es intencionalmente aburrida. Nunca se pensó para que fuera masiva (mainstream). Por eso los medios crean narrativas emocionales alrededor de ella para vender anuncios. Tú también puedes crear narrativas, pero las tuyas se construirán a partir de datos crudos, resumidos y verificados.\n\nLustra produce Tarjetas de Hechos (Fact Cards). Cada vez que haces clic en \"Compartir\", renderiza una imagen limpia utilizando datos oficiales. Por sí solo, es solo un hecho. En las redes sociales, los hechos necesitan ser explicados. Tú eres el que explica. Aquí tienes exactamente cómo usarlas para crear contenido viral y de alto impacto:';

  @override
  String get caS5A_Title => 'A/ El Gancho (Crea el Ángulo)';

  @override
  String get caS5A_Text =>
      'La opción más fácil suele ser la más cercana. ¿Encontraste un nuevo Proyecto de Ley de Censura de Internet en la aplicación? No lo compliques demasiado. Crea un titular fuerte (un \"gancho\"), dile a la gente exactamente cómo les afecta y suelta el enlace directo a Lustra para que puedan votar.';

  @override
  String get caS5B_Title => 'B/ La Evidencia (Para Ensayos e Hilos)';

  @override
  String get caS5B_Text =>
      'Las imágenes son grandes adiciones a publicaciones más largas o como punto de partida. ¿Quieres destacar fallos críticos en una ley propuesta o confrontar el resumen oficial del gobierno? Adjunta la Tarjeta de Hechos como prueba innegable. Deja que la gente lea los datos esterilizados por sí misma en 15 segundos.';

  @override
  String get caS5C_Title => 'C/ La Transmisión (TikTok/Reels)';

  @override
  String get caS5C_Text =>
      'Usa la imagen de la Tarjeta de Hechos con un efecto de \"pantalla verde\" en TikTok o Instagram. Pon los datos de Lustra de fondo y grábate explicando el problema. Es el contenido de formato corto perfecto y verificable.';

  @override
  String get caS5D_Title => 'D/ La Red (Mensajería Directa)';

  @override
  String get caS5D_Text =>
      'Simplemente haz clic en compartir y envía la imagen directamente a tus grupos de amigos y familiares. Diles claramente: \"Esto es lo que está pasando actualmente en el gobierno\", o \"esto es de lo que los medios callan ahora mismo\".';

  @override
  String get caS5Outro =>
      'La producción de contenido es fácil y Lustra es tu motor de descubrimiento. No eres solo un usuario. Eres un pionero (early adopter) en la nueva era de la democracia libre de corrupción. Tienes las mismas herramientas que un lobbista: úsalas.';

  @override
  String get caSkepticTitle =>
      '¿Escéptico sobre granjas de bots o privacidad de datos?';

  @override
  String get caSkepticText =>
      'Bien. No confíes en nuestras palabras: audita nuestro sistema. Lee exactamente cómo usamos el hashing criptográfico, Firebase App Check y la Licencia Open Source (AGPLv3) para proteger tu identidad y la integridad de la Voluntad Cívica.';

  @override
  String get caSkepticBtnGov => 'Transparencia y Gobernanza';

  @override
  String get caSkepticBtnPriv => 'Constitución y Privacidad';

  @override
  String get clAppBar => 'Watchlists';

  @override
  String get clTitle => 'Watchlists Curadas: Medios Cívicos Descentralizados';

  @override
  String get clIntro =>
      'Los gobiernos utilizan el gran volumen de legislación como un arma. Aprueban cientos de páginas de leyes complejas, a menudo enterrando actos controvertidos bajo títulos aburridos o colándolos por la \"puerta trasera\" mientras los medios están distraídos con el último escándalo político. Los ciudadanos pierden de vista el panorama general porque es físicamente imposible monitorear todo solo.';

  @override
  String get clS1Title => 'Reconocimiento de Patrones y Movilización Masiva';

  @override
  String get clS1P1 =>
      'Las Watchlists te permiten organizar el caos y actuar como un nodo de información independiente. Puedes mezclar leyes oficiales del gobierno con borradores cívicos de base, agruparlos por temas específicos e invitar a otros a suscribirse.';

  @override
  String get clS1P2 =>
      'Crucialmente, una Watchlist actúa como un multiplicador para la Auditoría Cívica. No estás reuniendo apoyo para una sola ley aislada. Al agrupar hasta 80 elementos, tu lista se convierte en un feed dedicado y enfocado para tus seguidores. Ellos pueden entrar a tu lista y emitir sus votos en múltiples leyes en una sola sesión, generando masivamente datos duros y Voluntad Cívica para todo un sector de políticas.';

  @override
  String get clS2Title => 'Cómo usar las Watchlists como un Arma:';

  @override
  String get clS2A_Title => 'Perros Guardianes del Gobierno';

  @override
  String get clS2A_Text =>
      '¿Notas que el gobierno intenta aprobar silenciosamente una serie de leyes tecnológicas que invaden la privacidad? Agrúpalas en una \"Watchlist de Vigilancia Digital\". Muestra a tus suscriptores la agenda oculta que los medios pasaron por alto y permíteles votar contra todas ellas en un solo lugar. Pídeles que lo amplifiquen compartiendo.';

  @override
  String get clS2B_Title => 'Plataforma de Reforma';

  @override
  String get clS2B_Text =>
      'No te quejes solo de la economía. Construye una \"Lista de Reforma Económica\" completa y de múltiples leyes, mezclando tus propios proyectos cívicos con enmiendas oficiales. Presenta una plataforma política completamente estructurada.';

  @override
  String get clS2C_Title => 'El Centro de Atención';

  @override
  String get clS2C_Text =>
      'Puedes anclar una ley específica como \"Favorita\" en tu lista para dirigir la máxima atención cívica y poder de voto exactamente donde más se necesita.';

  @override
  String get clS3Title => 'La Mejor Parte: Tú Eres Dueño de la Transmisión';

  @override
  String get clS3Text =>
      'Los algoritmos de las redes sociales suprimen constantemente los enlaces externos para mantener a los usuarios haciendo scroll. Lustra evade esto. Cuando la gente se suscribe a tu Watchlist, evades a las Big Tech por completo. Se te da un botón manual de \"Push\". Una vez cada 24 horas, puedes activar una notificación móvil directa a todos tus suscriptores, alertándolos para que revisen tu lista porque está ocurriendo una votación crítica o se ha añadido una nueva ley. Tú controlas la distribución.';

  @override
  String get clS4Title => 'La Economía de Creadores para la Democracia';

  @override
  String get clS4Text =>
      'La buena curaduría es extremadamente valiosa. Filtrar el ruido político requiere tiempo y experiencia. Es por eso que Lustra te permite adjuntar tu Bote de Propinas (Tip Jar) personal directamente a tu Watchlist. Si haces el trabajo duro de monitorear al gobierno y educar al público, tus suscriptores pueden financiar tus esfuerzos directamente. Nosotros no nos llevamos ninguna comisión.';

  @override
  String get clS5Title => 'Despliegue: Cómo Empezar';

  @override
  String get clS5Intro =>
      'Esta no es una función pasiva. Debes construirla activamente. Aquí tienes la instrucción exacta para desplegar tu primera Watchlist:';

  @override
  String get clStep1Title => 'Paso 1: Inicializar';

  @override
  String get clStep1Text =>
      'Navega a la pantalla principal y haz clic en el Icono de Engranaje (Configuración) en la esquina superior. Selecciona la opción para crear tu primera Watchlist. Dale un título claro.';

  @override
  String get clStep2Title => 'Paso 2: Modo Curador';

  @override
  String get clStep2Text =>
      'Una vez que tu lista esté inicializada, el sistema te otorga el estatus de Curador. Ahora, navega por el feed principal. Dentro de la pantalla de detalles de cada ley o proyecto cívico, aparecerá un nuevo botón \"Añadir a la lista\". Haz clic en él para inyectar esa ley específica directamente en tu lista.';

  @override
  String get clStep3Title => 'Paso 3: Inyección de Feed';

  @override
  String get clStep3Text =>
      'Tu Watchlist no inunda el feed principal. En su lugar, la única ley que seleccionaste como \"Favorita\" actúa como tu embajadora. Esta única tarjeta se inyecta directamente en los feeds diarios de tus suscriptores, entrelazada sin problemas con la legislación gubernamental oficial. Se muestra exactamente con la misma prioridad que las leyes oficiales del gobierno. Ponemos la supervisión ciudadana en pie de igualdad con el Estado.';

  @override
  String get clLimitsTitle => 'LÍMITES DEL SISTEMA (SEÑAL SOBRE RUIDO)';

  @override
  String get clLimit1Label => 'AUTORÍA';

  @override
  String get clLimit1Desc =>
      'Listas activas máximas por gobierno (Puedes eliminarlas y desplegar nuevas en cualquier momento).';

  @override
  String get clLimit2Label => 'CAPACIDAD';

  @override
  String get clLimit2Desc =>
      'Leyes máximas por lista (Más que suficiente para exponer un patrón, lo bastante estricto para evitar la sobrecarga de información).';

  @override
  String get clLimit3Label => 'SUSCRIPCIONES';

  @override
  String get clLimit3Desc =>
      'Listas máximas que puedes observar de otros creadores.';

  @override
  String get clOutro =>
      'Lustra no es una red social que genera alcance algorítmico gratuito para tu lista. Las Watchlists son solo por invitación. Debes compartir tu enlace único externamente. Trae a tu audiencia de X, YouTube, TikTok o tu newsletter. No te damos seguidores; te damos la infraestructura para convertir a tus seguidores actuales en una fuerza cívica verificada y votante, y una forma de ser financiado directamente por tu trabajo duro. Deja de pedir \"likes\" a tu audiencia. Dales una herramienta para actuar.';

  @override
  String get supportFundTitle => 'Fase 1: Lanzar Entidad Sin Fines de Lucro';

  @override
  String get supportFundDesc =>
      'Para abrir oficialmente la Fundación Lustra, proteger la propiedad intelectual y cubrir los gastos de constitución legal, necesitamos reunir capital inicial. Ayúdanos a hacer este sistema independiente para siempre.';

  @override
  String get supportFundDisclaimer =>
      'Transparencia de datos: Debido a las diferentes pasarelas de pago y costos de infraestructura, esta barra de progreso es actualizada manualmente por el fundador (máx. una vez a la semana).';

  @override
  String get actionSyncViaQr => 'Mostrar QR';

  @override
  String get actionHideQr => 'Ocultar QR';

  @override
  String get promoGuestTrackBills =>
      'Siga la legislación y reciba notificaciones sobre nuevas votaciones y leyes.';

  @override
  String get promoGetAppForNotifications =>
      'Obtenga la aplicación móvil para un mejor rendimiento y notificaciones sobre sus leyes seguidas.';

  @override
  String get buttonSeeAllUpcoming => 'Próximos proyectos de ley';

  @override
  String get buttonSeeAllProcess => 'Seguir leyes en trámite';

  @override
  String get buttonSeeAllVoted => 'Ver resultados de votación';

  @override
  String get buttonSeeAllCivicProjects => 'Ver proyectos ciudadanos';
}
