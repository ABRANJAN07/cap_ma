sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'capmanaged/test/integration/FirstJourney',
		'capmanaged/test/integration/pages/StudentsList',
		'capmanaged/test/integration/pages/StudentsObjectPage',
		'capmanaged/test/integration/pages/EnrollmentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentsList, StudentsObjectPage, EnrollmentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('capmanaged') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentsList: StudentsList,
					onTheStudentsObjectPage: StudentsObjectPage,
					onTheEnrollmentsObjectPage: EnrollmentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);