# kc-challenge

## Instalation
This project require XCode 13.0, Swift 5.0 and should be run on device with iOS 14+ and then, you should `run` the app.

## Architecture
This project uses VIPER architecture, VIPER is an application of Clean Architecture to iOS apps. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing. Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers. [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/).

![alt text](https://miro.medium.com/max/1021/1*6W73TuYu1DWi9JY4_Uh8aA.png)

This architecture is conformed by 5 layers which have single responsibilities, which represent an opportunity to have a project decoupled, testable, and scalable.

### View
> This layer is responsible to manage the view and the view controller, which allows to have centralized all the components and their behavior. This layer have their UIView components and UIViewControllers.

### Presenter
> The presenter layer is responsible to manage the communication between the View layer, Router layer and Interactor layer. Its main function is handle each visual request, retrieve information from interactor layer or, route the actual view to another one with the Router.

### Router
> This layer is responsible to manage the communication between modules, its allows us changing between views and, create modules for each feature on the app.

### Interactor
> The interactor is the main integral layer, because on it we could manage all the business logic and have communication with the data modules which retrieve us data from local or remote repositories.

### Entity 
> Entity layer provides a model which interactor use to create objects from the fetched data. The Entity is probably the simplest element inside a VIPER structure.

## Good Practices
With the following practices, we've achieved create a product with highly quality.
- **Clean code**
- **SOLID Principles**
- **DRY Principle**
- **Dependency Injection**
- **Modularized architecture**

## Project Structure

### App Folder
> Is a folder which have the appDelegate, sceneDelegate, and, LaunchScreenStoryboard).

![alt text]()

### Modules
> In this folder we have each app module. In this case we have a Contact, and DetailContact Module, where we can find a viper architecture for each module. This architecture allow us to define single responsabilities for each layer.

![alt text]()

### Extensions
> In this folder we can find a multiples extensions. The main idea of this folder is have a transversal module which help us with reusables functions.

![alt text]()

### Services
> This layer allows us to separate in a single context everything related to networking and web services.

![alt text]()

### Unit Test
> In this section we have the unit test structure, this folder meets the Viper architecture requirements. To continue, we can find a Test Double approach where we use Mocks, and Stubs doubles to test the differents architecture layers.

![alt text]()
