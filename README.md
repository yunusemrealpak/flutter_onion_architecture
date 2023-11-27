# Flutter Onion Architecture

This is a sample project to demonstrate the Onion Architecture in Flutter.

## Onion Architecture

Onion Architecture is a software architecture that is built on the dependency inversion principle. It is a layered architecture that adheres to SOLID principles. The main purpose of this architecture is to separate the domain layer from the infrastructure layer. The domain layer is the core of the application and it contains the business logic of the application. The infrastructure layer contains the implementation of the interfaces.

#### CQRS Pattern

CQRS stands for Command Query Responsibility Segregation. It is a pattern that is used to separate the read and write operations of the application. It is used to separate the read and write operations of the application to improve the performance of the application. The CQRS pattern is used in this project to separate the read and write operations of the application.

#### Mediator Pattern

The mediator pattern is used to reduce the coupling between the components of the application. It is used to reduce the direct communication between the components and make them communicate through a mediator. The mediator pattern is used in this project to reduce the coupling between the domain layer and the infrastructure layer.

The mediator pattern has been implemented using the Mediatr package located in the "modules" folder.

#### Dependency Injection

Dependency injection is a technique that is used to reduce the coupling between the components of the application. It is used to inject the dependencies of a component from the outside. The dependency injection is used in this project to inject the dependencies of the domain layer from the infrastructure layer.

#### Mapping

Mapping is a technique that is used to map the objects of one type to the objects of another type. It is used to map the objects of the domain layer to the objects of the infrastructure layer and vice versa. The mapping is used in this project to map the objects of the domain layer to the objects of the infrastructure layer and vice versa.

The [auto_mapper](https://pub.dev/packages/auto_mappr) package has been used for the mapping process. It has been integrated under the di/mapping folder.

##### Features to be Added

- **Localization**: Localization will be added to the application. easy_localization package will be used for localization.
- **Flavor**: Flavor is a technique that is used to create different versions of the application. It is used to create different versions of the application for different environments.
- **Routing**: Routing will be added to the application. auto_route package will be used for routing.


##### Note *

This project is still under development and will be updated soon.

The project is inspired by Salih Cantekin's [.Net Core Onion Architecture + CQRS + MediatR Full Video](https://www.youtube.com/watch?v=KIhMeJ-jYME&t=322s) YouTube video.

