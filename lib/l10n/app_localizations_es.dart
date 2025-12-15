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
  String get sectionPopularVotes => 'Votaciones populares';

  @override
  String get sectionUpcoming => 'Próximamente';

  @override
  String get sectionLegislationInProcess => 'Legislación en proceso';

  @override
  String get sectionMpProfiles => 'Perfiles de diputados';

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
  String get citizenPollTitle => 'Encuesta ciudadana';

  @override
  String get pollTemporarilyUnavailable =>
      'Encuesta no disponible temporalmente. Por favor, inténtelo de nuevo más tarde.';

  @override
  String get errorDisplayingPollBar =>
      'Error al mostrar los resultados de la encuesta.';

  @override
  String get pollNoForAgainstVotes => 'Sin votos a favor/en contra';

  @override
  String get pollNoVotesCast => 'No se han emitido votos';

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
  String get infoTitle1 => 'Separando la política de los medios';

  @override
  String get infoParagraph1 =>
      'Lustra es una aplicación para seguir la política utilizando datos oficiales. Con tecnología de IA, los resúmenes de las leyes y los resultados de las votaciones se presentan de forma concisa, clara e imparcial. Seguir la política ya no requiere esfuerzo ni tiempo, solo unos pocos clics.';

  @override
  String get infoTitle2 => 'Intereses comunes por encima de las divisiones';

  @override
  String get infoParagraph2 =>
      'Como sociedad, compartimos objetivos comunes como la libertad, la seguridad y la prosperidad. Las diferencias de opinión son una parte natural de la democracia: dan forma al debate y permiten diferentes perspectivas. Con acceso a información fiable, podemos tomar decisiones más informadas y participar en la vida pública basándonos en hechos, no en emociones o narrativas mediáticas.';

  @override
  String get infoTitle3 => 'Hechos, no palabras';

  @override
  String get infoParagraph3 =>
      'Ya no tienes que confiar en las promesas electorales: puedes revisar el historial de votaciones de los diputados individuales y analizar sus decisiones. El perfil de cada político incluye una lista con viñetas, lo que permite una evaluación rápida e independiente de su historial. El historial de trabajo completo se ampliará a medida que se desarrolle la aplicación.';

  @override
  String get infoTitle4 => 'Personas, no partidos';

  @override
  String get infoParagraph4 =>
      'Los diputados deben tener en cuenta los intereses de sus electores, no solo votar según la línea del partido. El sistema de partidos divide a la sociedad, pero todo se puede cambiar con pequeños pasos. El primero es la conciencia pública. Usa la aplicación, habla, comparte votaciones, participa en encuestas y mantente informado. La política afecta a casi todos los aspectos de nuestras vidas, por lo que no hay razón para que unos pocos decidan todo.';

  @override
  String get linkHowTechnologyWorks => '¿Cómo funciona la tecnología?';

  @override
  String get linkTermsAndPrivacy => 'Términos y Política de privacidad';

  @override
  String get supportScreenTitle => 'Apoya el proyecto';

  @override
  String get supportParagraph1 =>
      'Lustra es mi proyecto personal pro bono. La aplicación siempre será gratuita, sin funciones de pago, extensiones, anuncios ni limitaciones. Creo que todo el mundo debería tener acceso sin restricciones a información accesible, sin comentarios de opinión ni filtros. Si estás de acuerdo con la misión, te animo a que la apoyes con una donación de cualquier cantidad. Cada contribución, por pequeña que sea, me ayudará a mantener la aplicación y a desarrollarla más.';

  @override
  String get buttonSupportFinancially => 'Apoyar financieramente';

  @override
  String get supportThankYou =>
      'Gracias por tu confianza y por cada forma de participación';

  @override
  String get creatorName => 'Jacek Michałowski';

  @override
  String get creatorTitle => 'Creador de la aplicación';

  @override
  String get leaderboardTitle => 'Principales donantes (Último mes)';

  @override
  String get futureFeaturesScreenTitle => 'Futuras funciones';

  @override
  String get futureFeaturesHeader => 'Funcionalidades planificadas';

  @override
  String get futureFeatureReferendum => 'Convocatoria de un referéndum';

  @override
  String get futureFeatureSenate => 'Senado y senadores';

  @override
  String get futureFeatureCitizenInitiative =>
      'Iniciativa legislativa ciudadana - proyectos de ley';

  @override
  String get futureFeatureIndependentCandidates =>
      'Candidatos independientes al parlamento';

  @override
  String get futureFeaturePetitions => 'Peticiones al parlamento';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String legislationScreenTitle(String parliamentName) {
    return 'Finalizado - $parliamentName';
  }

  @override
  String get refreshDataTooltip => 'Actualizar datos';

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
  String get mandateStatusActive => 'Mandato de diputado: activo';

  @override
  String get mandateStatusFulfilled => 'Mandato de diputado: cumplido';

  @override
  String get mandateStatusCancelled => 'Mandato de diputado: cancelado';

  @override
  String get mandateStatusInactive => 'Mandato de diputado: inactivo';

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
  String get pollResultNoVotes => 'sin votos';

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
      '...la información completa está disponible en la app Lustra';

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
  String get termsOfServiceContent =>
      '<b>Términos de Servicio de la App \"Lustra\"</b>\n\nÚltima actualización: 10 de agosto de 2025\n\n¡Hola! Soy el creador de la app Lustra.\nMe alegra que estés aquí. Creé Lustra porque creo que cada uno de nosotros merece un acceso simple y transparente a la información sobre cómo se crean las leyes que afectan nuestras vidas.\n\nEste documento son los términos de servicio, una especie de acuerdo entre tú y yo. Lo escribí en un lenguaje sencillo para que sepas exactamente bajo qué reglas funciona la app. Por favor, léelo con calma. Al usar Lustra, confirmas que aceptas estas reglas.\n\n<b>1. Glosario, es decir, de quién y de qué hablamos</b>\n•\t<b>Yo, mi, me</b> – es decir, yo, Jacek, el creador de la app, operando bajo la empresa FO&WO VENTURES SP. Z O.O. con sede en Wrocław.\n•\t<b>Tú, tu, te</b> – es decir, tú, la persona que usa la app.\n•\t<b>App</b> o <b>Lustra</b> – la aplicación móvil \"Lustra\" que estás usando.\n•\t<b>Cuenta</b> – tu cuenta personal en la app, que puedes crear para usar funciones adicionales.\n•\t<b>Términos</b> – este mismo documento.\n\n<b>2. ¿De qué trata Lustra? (Principios generales)</b>\n•\tLustra es una app gratuita cuyo objetivo es proporcionarte información accesible sobre los procesos legislativos en parlamentos seleccionados. Aquí encontrarás resúmenes de proyectos de ley, resultados de votaciones e información sobre los diputados.\n•\tDebes tener al menos 16 años para usar la app. Si creas una Cuenta, confirmas que cumples esta condición.\n•\tEl uso de las funciones informativas básicas no requiere la creación de una Cuenta.\n\n<b>3. Tu Cuenta en la app</b>\n•\tPuedes crear una Cuenta usando tu dirección de correo electrónico. Esto te permitirá usar funciones adicionales, como votar en sondeos o recibir notificaciones personalizadas.\n•\tPor favor, recuerda que solo puedes tener una Cuenta.\n•\tEres responsable de mantener la confidencialidad de tu contraseña y de todo lo que ocurra en tu Cuenta.\n\n<b>4. ¿Cómo puedes usar el contenido? (Licencia)</b>\n•\tTodos los datos fuente (p. ej., textos completos de leyes, resultados de votaciones, datos de diputados) provienen de fuentes oficiales y públicas y son información pública.\n•\tEl contenido que creo con mi sistema propio y tecnología de IA (es decir, resúmenes, títulos simplificados, puntos clave) se te proporciona para su uso libre con fines informativos, educativos y privados. Puedes leerlo y compartirlo como capturas de pantalla.\n•\tTe pido encarecidamente que no copies estos datos de forma masiva (no los extraigas con scraping). Crear y mantener este sistema me cuesta tiempo y dinero. Por lo tanto, para proteger este proyecto, los Términos te prohíben:\n\t\to\tDescargar automáticamente y crear tu propia base de datos a partir del contenido generado en la app.\n\t\to\tUsar el contenido de la app con fines comerciales.\n\t\to\tIntentar vulnerar la seguridad, descompilar la app o perturbar su funcionamiento.\n•\t¿Tienes una idea para usar los datos de Lustra de una manera interesante? ¡Estoy abierto a colaborar! Escríbeme a jacek@lustra.dev – estaré encantado de hablarlo.\n\n<b>5. Sondeos y fiabilidad de los datos</b>\n•\tUna de las funciones de la app son los sondeos en los que puedes expresar tu apoyo a una ley determinada. Para que los resultados de estos sondeos sean lo más fiables posible, por favor, selecciona en los ajustes el parlamento del país del que eres ciudadano (si está disponible en la lista).\n\n<b>6. Mi responsabilidad (o más bien, la falta de ella)</b>\n•\tProporciono la app \"tal cual\" (en inglés, \"as is\"). Hago todo lo posible para que los datos sean actuales y correctos, pero provienen de APIs externas y gubernamentales, en las que puede haber errores. Por lo tanto, no puedo responsabilizarme de posibles imprecisiones en los datos fuente.\n•\tLustra es un proyecto pro bono que mantengo con mis propios fondos. Haré todo lo que esté en mi mano para que funcione sin interrupciones, pero debo advertir que pueden producirse pausas técnicas. También me reservo el derecho de terminar el servicio si, por ejemplo, me quedo sin fondos para mantenerlo.\n•\tLos contenidos de la app, especialmente los generados por IA, tienen un carácter informativo y educativo. No constituyen asesoramiento legal.\n\n<b>7. Club de Apoyo de Lustra</b>\n•\tPuedes unirte al \"Club de Apoyo de Lustra\" dando tu consentimiento explícito y voluntario. Esto significa que podré enviarte correos electrónicos sobre el desarrollo de la app, nuevas funciones, y también pedirte apoyo en debates sobre el futuro del proyecto o ayuda financiera si fuera necesaria. Encontrarás más detalles al respecto en la Política de Privacidad.\n\n<b>8. Finalización de nuestro acuerdo</b>\n•\tTú puedes finalizarlo en cualquier momento. Simplemente usa la opción \"Eliminar cuenta\" en los ajustes de la app. Esto provocará la eliminación irreversible de tu Cuenta y sus datos asociados.\n•\tYo puedo bloquear o eliminar tu Cuenta si infringes gravemente estos Términos, por ejemplo, intentando dañar el funcionamiento de la app.\n\n<b>9. Cambios en los Términos</b>\n•\tEl mundo cambia, y la app también lo hará. Me reservo el derecho de cambiar estos Términos. Te informaré de cualquier cambio importante con antelación, por ejemplo, mediante un mensaje en la app. El uso continuado de Lustra después de la introducción de los cambios significará su aceptación.\n\n<b>10. Contacto y disposiciones finales</b>\n•\tSi tienes alguna pregunta, no dudes en escribir a: jacek@lustra.dev.\n•\tPara todos los asuntos no regulados en estos Términos, se aplicará la legislación polaca.\n\n¡Gracias por estar aquí y ayudar a crear un estado transparente!';

  @override
  String get termsAndPrivacyTitle => 'Términos y Política de Privacidad';

  @override
  String get termsOfServiceTab => 'Términos';

  @override
  String get privacyPolicyTab => 'Privacidad';

  @override
  String get privacyPolicyContent =>
      '<b>Política de Privacidad de la Aplicación \"Lustra\"</b>\n\nÚltima actualización: 10 de agosto de 2025\n\nEste documento es la Política de Privacidad. Sé que estos textos pueden ser largos y complicados, por lo que he hecho todo lo posible por escribirlo de forma sencilla.\nTu privacidad y confianza son mi máxima prioridad. En esta política, te explicaré qué datos recopilo, por qué lo hago y cómo los protejo.\n\n<b>1. ¿Quién cuida tus datos? (Responsable del Tratamiento)</b>\nEl responsable de tus datos personales soy yo, Jacek, operando a través de la empresa FO&WO VENTURES SPÓŁKA Z OGRANICZONĄ ODPOWIEDZIALNOŚCIĄ (ul. Wapienna 13/7, 50-518 Wrocław, NIP: 6343002817).\nSi tienes alguna pregunta sobre tus datos, escríbeme directamente a: jacek@lustra.dev.\n\n<b>2. ¿Qué datos recopilo y por qué?</b>\nSolo recopilo los datos que son necesarios para el funcionamiento de la aplicación o para los que das tu consentimiento explícito y voluntario. Aquí tienes una lista detallada:\n•\t<b>Cuando creas una Cuenta:</b>\n\to\t<b>Tu dirección de correo electrónico:</b> La necesito para crear y mantener tu Cuenta de forma segura, permitirte iniciar sesión y restablecer tu contraseña si la olvidas.\n\to\t<b>Identificador de Usuario Único (UID):</b> Es una cadena de caracteres aleatoria asignada automáticamente por el sistema Firebase, que me permite vincular de forma segura tus datos con tu Cuenta.\n•\t<b>Cuando usas las funciones de la app (como usuario registrado):</b>\n\to\t<b>Tus votos en las encuestas (\"apoyo\" / \"no apoyo\"):</b> Los guardo para crear estadísticas agregadas y totalmente anónimas de apoyo a cada ley, que ves en la app. Tu voto individual nunca se muestra públicamente.\n\to\t<b>Tu lista de leyes seguidas:</b> La almaceno para que tengas fácil acceso a ella y para poder (en el futuro) enviarte notificaciones sobre su progreso.\n\to\t<b>Tu parlamento seleccionado:</b> Guardo esta información para que puedas participar en las encuestas correspondientes y (en el futuro) recibir notificaciones del país correcto.\n•\t<b>Cuando te unes al Club de Apoyo de Lustra (totalmente voluntario):</b>\n\to\t<b>Información sobre tu consentimiento (verdadero/falso):</b> La guardo para saber si quieres recibir mensajes adicionales de mi parte. Escribo más sobre el Club en el punto 5.\n•\t<b>Cuando informas de un error:</b>\n\to\tSi decides enviar un informe de error en los datos, guardaré el contenido de tu informe para analizar y corregir el problema.\nLo que <b>NO</b> recopilo: No utilizo ninguna herramienta de análisis externa (como Google Analytics) para rastrear tu actividad en la app.\n\n<b>3. ¿A quién confío tus datos? (Mis socios tecnológicos)</b>\nPara que Lustra funcione, utilizo los servicios de socios tecnológicos de confianza a quienes confío el tratamiento de algunos datos. Estos son:\n•\t<b>Google (a través del servicio Firebase):</b> Es la columna vertebral tecnológica de toda la app. Google me proporciona la infraestructura para:\n\to\t<b>Autenticación (Firebase Authentication):</b> Inicio de sesión seguro y gestión de tu Cuenta.\n\to\t<b>Base de datos (Cloud Firestore):</b> Almacenamiento de datos relacionados con tu Cuenta (p. ej., votos en encuestas, lista de leyes seguidas).\n•\t<b>Google (a través del servicio Gemini AI):</b> Es la herramienta que uso para analizar textos legislativos. Quiero ser absolutamente claro: solo envío a la IA textos de leyes y documentos disponibles públicamente. Tus datos personales (como el correo electrónico o el UID) nunca se envían allí.\nTodos los datos se almacenan en servidores de Google ubicados en el Espacio Económico Europeo.\n\n<b>4. ¿Durante cuánto tiempo guardo tus datos?</b>\nEn pocas palabras: guardo tus datos mientras tengas una Cuenta conmigo. Si decides eliminarla, todos tus datos personales se borrarán de forma permanente.\n\n<b>5. El Club de Apoyo de Lustra: ¿qué es?</b>\nEs un lugar especial para las personas que quieren estar más cerca del proyecto. Unirse es completamente voluntario y requiere marcar un consentimiento por separado. Si te unes, aceptas que te envíe correos electrónicos de vez en cuando sobre:\n•\tdesarrollo de la app y nuevas funciones planificadas,\n•\teventos especiales, como paneles de discusión sobre el futuro de Lustra,\n•\totros proyectos similares con la misma misión que pueda crear en el futuro,\n•\tsolicitudes de apoyo financiero si el proyecto se encuentra en una situación difícil.\nPuedes retirar tu consentimiento en cualquier momento en la configuración de la app.\n\n<b>6. Tus derechos: tienes el control total</b>\nEl RGPD te otorga una serie de derechos, y quiero que puedas ejercerlos fácilmente. Tienes derecho a:\n•\tAcceder a tus datos: Saber qué datos tengo sobre ti.\n•\tRectificar (corregir) tus datos.\n•\tEliminar tus datos (derecho al olvido): Puedes hacerlo en cualquier momento utilizando la opción \"Eliminar cuenta\" en la configuración de la app.\n•\tLimitar el tratamiento de tus datos.\n•\tPortabilidad de los datos.\n•\tOponerte al tratamiento de tus datos.\n•\tRetirar tu consentimiento (p. ej., para estar en el Club de Apoyo de Lustra).\n•\tPresentar una reclamación ante el Presidente de la Oficina de Protección de Datos Personales (UODO) si consideras que trato tus datos de forma ilegal.\nPara ejercer la mayoría de estos derechos, solo tienes que escribirme a jacek@lustra.dev.\n\n<b>7. Seguridad de tus datos</b>\nMe tomo la seguridad muy en serio. Utilizo las soluciones proporcionadas por Google Firebase, que aplican estándares de seguridad modernos, incluido el cifrado de datos tanto durante su transmisión (protocolo SSL) como en su almacenamiento en los servidores.\n\n<b>8. Datos de menores</b>\nComo mencioné en los Términos de Servicio, la aplicación está destinada a personas mayores de 16 años. No recopilo ni trato conscientemente datos de personas más jóvenes.\n\n<b>9. Cambios en esta política</b>\nPuedo actualizar esta política en el futuro. Te informaré de cualquier cambio significativo con antelación en la aplicación.\n\nGracias por tu confianza.\nJacek';

  @override
  String get techPageTitle => 'Sobre la tecnología y la imparcialidad';

  @override
  String get techPageIntro =>
      'Detrás de cada título simplificado y resumen de una ley hay un modelo de lenguaje. Aquí quiero explicarte con total transparencia cómo funciona y cómo me aseguro de que la información que recibes sea siempre pura e imparcial.';

  @override
  String get techPageWhyAiTitle => '¿Por qué uso IA?';

  @override
  String get techPageWhyAiBody =>
      'Los textos de las leyes y los documentos parlamentarios están escritos en una jerga legal complicada. Leer y entender incluso una ley corta es un desafío, incluso para un abogado.\n\nMi objetivo era crear una herramienta que tradujera este lenguaje hermético \"de legal a humano\". Analizar manualmente cientos de documentos al día sería imposible para una sola persona. Por eso recurrí a la IA, como una poderosa herramienta para el análisis y la simplificación de textos, que permite entregarte la información de forma rápida y accesible.';

  @override
  String get techPageWhatForTitle => '¿Para qué uso exactamente la IA?';

  @override
  String get techPageWhatForBody =>
      'La Inteligencia Artificial realiza tres tareas específicas:\n  • Simplifica los títulos oficiales por otros que indican de inmediato de qué trata el documento.\n  • Crea resúmenes breves, de 2 a 3 frases, que se centran en el impacto de los cambios en la vida cotidiana de los ciudadanos.\n  • Extrae del denso texto varios puntos clave, es decir, los cambios y soluciones más importantes.\n\nTodos los demás datos, como los resultados de las votaciones o la información sobre los diputados, provienen directamente de las API gubernamentales oficiales.';

  @override
  String get techPageBiasTitle =>
      '¿Cómo aseguro la imparcialidad? Instrucciones para la IA';

  @override
  String get techPageBiasBody =>
      'Esta es la parte más importante. La IA ejecuta comandos específicos. Estos comandos (llamados \"prompt\" en informática) son un tipo de instrucción muy precisa que es la base de la imparcialidad de toda la aplicación.\n\nEstos son los principios clave que he inculcado en mi sistema de IA:\n  • <b>Rol de experto neutral:</b> Ordeno a la IA que asuma el rol de un experto en derecho apolítico, cuyo único objetivo es analizar y explicar, no evaluar ni comentar.\n  • <b>Solo hechos, ninguna opinión:</b> La instrucción prohíbe explícitamente a la IA expresar sus propias opiniones, hacer juicios de valor y usar un lenguaje que pueda sugerir si un cambio es \"bueno\" o \"malo\". Debe centrarse exclusivamente en los hechos.\n  • <b>Perspectiva del ciudadano común:</b> En lugar de analizar la ley desde la perspectiva de un abogado, la IA tiene la tarea de responder a la pregunta: \"¿Qué significa este cambio para mí, un ciudadano común? ¿Cómo afectará a mis finanzas, mi salud, mis derechos y mis obligaciones?\".';

  @override
  String get techPagePromiseTitle =>
      'Instrucción completa y transparente para su consulta';

  @override
  String get techPagePromiseBody =>
      'No te fíes de mi palabra. A continuación se encuentra el contenido exacto de la instrucción (prompt) que le paso al modelo de IA (Google Gemini) al analizar cada documento, asegurándome de que los parámetros de creatividad también estén configurados en 0 (para que la IA no invente cosas durante el análisis). Este es el \"cerebro\" de la operación.\n\n(Nota: Este prompt evolucionará y se mejorará con el tiempo para que la calidad de los resúmenes sea cada vez mayor).';

  @override
  String techPagePromptCode(Object DOCUMENT_TEXT, Object country) {
    return 'Eres un experto en derecho de $country encargado de analizar documentos legislativos, resoluciones y otros documentos legales, y luego preparar la información de una manera accesible para los ciudadanos. Tu objetivo es presentar la información de tal manera que los ciudadanos puedan evaluar por sí mismos el impacto de la legislación en sus vidas, incluso sin tener conocimientos legislativos especializados. Céntrate en los hechos y las consecuencias de los cambios introducidos, evitando juicios de valor y opiniones personales. Se prohíbe cualquier jerga legal. Presenta la información de forma clara, concisa y atractiva, para que sea comprensible para una persona sin formación jurídica. Evita las frases largas y complejas. En lugar de escribir \"el proyecto tiene como objetivo implementar la directiva sobre la segregación de residuos...\", escribe \"Nuevas normas de segregación de basuras: uso de bolsas especiales, etc....\". Continúa tu trabajo hasta que resuelvas tu tarea. Si no estás seguro del contenido generado, vuelve a analizar el documento; no adivines. Planifica bien tu tarea antes de empezar. En el resumen y en los puntos clave, si es posible y está justificado, destaca qué beneficios o consecuencias concretas (positivas o negativas) introduce la ley en la vida cotidiana de los ciudadanos, sus derechos y obligaciones, sus finanzas personales, su seguridad y otras cuestiones importantes.\n\nTu respuesta DEBE estar en formato JSON y contener las siguientes claves.\nAntes de devolver la respuesta, verifica cuidadosamente que toda la estructura JSON sea 100% correcta, incluidas todas las comas, llaves, corchetes y comillas. Un JSON incorrecto es inaceptable e impedirá que se procese tu trabajo.\n\nAnaliza detenidamente el siguiente texto del documento legal. Este es el contenido a partir del cual debes generar el resumen y los puntos clave:\n--- INICIO DEL DOCUMENTO ---\n$DOCUMENT_TEXT\n--- FIN DEL DOCUMENTO ---\n\nRECUERDA: Tu respuesta DEBE ser exclusivamente un objeto JSON válido. No añadas ningún carácter, comentario o texto adicional antes de la etiqueta \'OPEN_BRACE\' o después de la etiqueta \'CLOSE_BRACE\'. Toda la respuesta debe poder ser analizada como JSON.\nA partir del documento ANTERIOR, completa la siguiente estructura JSON:\nEsta es la estructura JSON que espero (rellénala con contenido):\n__OPEN_BRACE__\n  \"ai_title\": \"Un título nuevo y corto para el acto jurídico en español, que refleje la esencia de los cambios introducidos (p. ej., un máximo de 10-12 palabras).\",\n  \"summary\": \"Un resumen conciso de 2-3 frases del contenido del acto jurídico en español, escrito desde la perspectiva de su impacto en la vida cotidiana de los ciudadanos.\",\n  \"key_points\": [\n    \"Primer punto breve en español sobre las soluciones o cambios más importantes introducidos.\",\n    \"Segundo punto breve en español...\"\n  ],\n \"category\": [\"Clasifica el documento por defecto en una categoría, basándote en el campo que aborda principalmente. Elige hasta 3 si el documento también trata cuestiones SIGNIFICATIVAS de otras categorías. DEBES elegir categorías EXCLUSIVAMENTE de la siguiente lista: Salud, Educación, Familia, Impuestos, Trabajo, Seguridad, Medio Ambiente, Tribunales y Derecho, Transporte, Prestaciones, Inmobiliaria, Medios y Cultura, Gobierno Local, Migración, Agricultura, Inversiones Públicas, Informatización, Economía. Si el documento definitivamente no encaja en ninguna de ellas, DEBES usar \'Otros\'. Si usas \'Otros\', debería ser la ÚNICA categoría seleccionada. NO crees nuevas categorías. La respuesta debe ser una matriz de cadenas, por ejemplo, [\\\"Impuestos\\\", \\\"Familia\\\"].\", \"Segunda categoría (opcional)\", \"Tercera categoría (opcional)\"]\n__CLOSE_BRACE__';
  }

  @override
  String get techPageFlawlessTitle => '¿Es la IA infalible?';

  @override
  String get techPageFlawlessBody =>
      'Por supuesto que no. Como cualquier tecnología, puede cometer un error o interpretar algo incorrectamente. Por eso, en la aplicación encontrarás un mecanismo que te permite informar de un error en los datos; cada informe de este tipo es extremadamente valioso para mí y me ayuda a mejorar el sistema.\n\nMi objetivo a largo plazo es seguir desarrollando esta tecnología e incluso operar mi propio modelo local sin ninguna restricción para aumentar aún más la precisión y la independencia de la aplicación.';

  @override
  String get techPageOutro =>
      'Gracias por tu confianza. Espero que, gracias a esta transparencia, usar Lustra sea aún más valioso para ti.';

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
    return '¡Consulta los detalles de este proyecto de ley en la app Lustra! $deepLink';
  }

  @override
  String shareDeputyText(Object deepLink) {
    return '¡Consulta y valora el trabajo de este diputado/a en la app Lustra! $deepLink';
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
}
