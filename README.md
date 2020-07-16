![Image of Feathers](https://feathersjs.com/img/feathers-logo-wide.png)

# flutter_feathers_rest

This library provides a `FeathersRestProvider` for the [flutter_feathers](https://github.com/Leftwitch/flutter_feathers) package which allows you to establish a connection to your Feathers.js backend using Rest

Getting Started

## Example with Rest-Provider

```dart

Feathers feathers = Feathers();

feathers.configure(FeathersRestProvider('http://localhost:3030')); //Tells Feathers to use the FeathersRestProvider which takes an URL as parameter

await user = feathers.service('users').get('eb412caa-34cd-470e-ba15-15225715e18e'); //Calls http://localhost:3030/users/eb412caa-34cd-470e-ba15-15225715e18e

print(user);

  

```
