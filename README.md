# UrlPocket App
An application that validates an url and send it to "shrink" to the server, and show the history of urls send and received, made in flutter, with an approach or architecture MVVM style, in flutter framework, for a technical assessment in a selection process, there its no priority in UI, it's more focused on architectural and patterns apply.

## Getting Started
This document wants to share the main features, tools, architecture and resources added to the project to accomplish the requirements defined for it.

### External API
The application consume the endpoint defined here
- [Shortener API](https://url-shortener-server.onrender.com/api/alias)
- Method:POST / Path:/api/alias / Body (json): {"url":"url_to_shrink"}
- Response: 201 on success - Body: { "alias":"url_alias", "_links": { "self":"<original_url>", "short":"<short_url>" } }

### External Libraries
The libraries that helps to made this project:
- [provider](https://pub.dev/packages/provider) for access and inject components for data retrieving
- [regexed_validator](https://pub.dev/packages/regexed_validator) for review the valid form of an input url
- [get_it](https://pub.dev/packages/get_it) to inject use cases and api with the help of interfaces definitions and concrete implementations
- [json_annotation](https://pub.dev/packages/json_annotation) for manage the JSON response and use it as native objects of the app
- [http](https://pub.dev/packages/http) for the external request to the server
- [mockito](https://pub.dev/packages/mockito) for test the components of the app


### Main Architecture
The approach its separate the view that its controlled by a provider that set states for the UI to show loading status, list information retrieved from other layers and initial states of the app, (just when starts), this provider have the access to a use case that contains the logic for understand the response from an API that is requested in the use case itself (and convert the response of the API that its a DTO based in the original structure, to a business model looking for a decouple of the response from a server and a local modelling of the app), also the API communicates with help of an http client to the server and manage requests and classic http status for validate the responses.

### Components for MVVM
- DTO: objects that models the information that came from the server based in its original JSON definition
- Data model: Objects that store the info extracted from the DTOs for showing it in the UI
- UseCase: contracts defined for the classes that going to manage the business logic
- Interactor: the class that implement the use case with the business logic
- Providers: observable object that allows to communicate to the UI changes in the logic layer


## Author
  - **Alejandro Rodríguez S.** 
    [Al3jodroid](https://github.com/Al3jodroid)

