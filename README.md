# NEMO PROJECT


&nbsp;&nbsp;&nbsp;&nbsp; The Never-Ending Medical Learner (NEMO) is being developed for the Kansas University Medical Center as a tool for machine learning research. The primary purpose of the system is to aid domain experts in developing predictions relating to patients. The system uses machine learning techniques in order to make conclusions and predictions from prior data. The system shall operate by taking questions from the domain experts and creating learning algorithms to generate predictions. The system shall make use of a feedback mechanism, where users must give responses to the learners based on the prediction models they develop.


&nbsp;&nbsp;&nbsp;&nbsp;The system’s structure is generalized in order to allow the addition of other machine learning techniques. However, the basic framework for the system has been constructed. The NEMO system shall be comprised of a data mart and three major components: the AI controller, the data loader, and the web application. The AI controller will be used to create and manage learning algorithms in response to questions and feedback given by domain experts. The data loader will be responsible for loading test data and learner data into the data mart from KUMC’s external database. The data mart will hold all of the test and learner data, as well as all of the users’ questions and feedback. Finally, the web application will be the domain experts’ interface with the NEMO system, where they will be able to create questions and submit feedback.


&nbsp;&nbsp;&nbsp;&nbsp;The purpose of this document is to provide a high level design perspective for the NEMO system, which includes outlines for the system’s architecture as well as how each of the system’s components interact with each other. This document also demonstrates how users are expected to interact with core components of the web application. An overview of features available to users and administrators is also included. Finally, the document concludes with a description of how data is stored within the data mart.

# Issues
1. NodeJS server seems to run out of memory and crash on our production server (with 1 gig ram).
2. MySQL connection needs to be checked in ai-controller.
