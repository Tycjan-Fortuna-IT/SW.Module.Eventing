# SW Eventing Module

The SW Eventing module provides a flexible and type-safe event system, allowing developers to easily manage events and listeners within an application. This module is designed to support any number and type of event arguments, offering high configurability for handling diverse event-driven scenarios, such as UI interactions, system events, or custom application signals.

### Key Component

#### Event Class

The **Event** class is a template-based event management system, designed to be highly generic and reusable across different event types. By using template parameters, it allows the definition of events with varying argument types, enabling custom callbacks to be registered and invoked with specific parameters. This flexibility makes it possible to create and manage events tailored to the application’s needs.

## Tested Platforms

Used C++ dialect version: `20`

- [x] Windows (`MSVC 2022`)
- [x] Linux (`clang 18.x`)

## Dependencies (SW modules)

| Module | Link                                        | Version |
| ------ | ------------------------------------------- | ------- |
| Logger | https://github.com/Tycjan-Fortuna-IT/Logger | latest  |

Placed in the same directory as the Eventing module.
It is recommended to keep all modules in the same directory e.g. `Engine/modules/`.

## Installation (Premake5 - FancyBuildSystem)

Add inside your main dependencies.lua following line:

```lua
FBS.ImportModule("Engine/modules/Eventing");
```

Replacing with correct path to the module.

## Installation (CMake)

Add the following to your CMakeLists.txt file:

```cmake
add_subdirectory(PATH_TO_THIS_MODULE)
target_link_libraries(${PROJECT_NAME} Eventing)
target_include_directories(${PROJECT_NAME} PUBLIC PATH_TO_THIS_MODULE/src)
```

Example:

```cmake
add_subdirectory(Modules/Eventing)
target_link_libraries(${PROJECT_NAME} Eventing)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_SOURCE_DIR}/Engine/Modules/Eventing/src)
```

### Methods and Usage

- **AddListener**: Registers a new listener callback for the event, returning a unique `ListenerID` to manage the listener in the future. The `+=` operator can also be used as shorthand for this operation.
- **RemoveListener**: Removes a specific listener by its `ListenerID`. The `-=` operator is also supported as a shorthand.
- **RemoveAllListeners**: Removes all listeners from the event, useful for resetting the event state or when cleaning up.
- **GetListenerCount**: Returns the current number of listeners attached to the event, helpful for tracking active listeners.
- **Invoke**: Triggers the event, invoking all registered callbacks with the specified arguments, allowing the event to propagate data to listeners.

### Example Usage

The SW Eventing module can be employed to handle a variety of events within an application. For instance, UI or input events can be managed through this module:

```cpp
// Define events for different use cases.
Eventing::Event<MouseCode> MouseButtonPressedEvent;
Eventing::Event<float, float> MouseScrollWheelEvent;

// Adding a listener using a member function
MouseButtonPressedEvent += std::bind_front(&SceneViewportPanel::OnMouseButtonPressed, this);

// Adding a listener using a lambda function
MouseScrollWheelEvent += [](float deltaX, float deltaY) {
    std::cout << "Mouse scrolled: X=" << deltaX << ", Y=" << deltaY << std::endl;
};

// Invoking the events (typically done in response to actual events in the application)
MouseButtonPressedEvent.Invoke(MouseCode::ButtonLeft);
MouseScrollWheelEvent.Invoke(0.0f, -1.0f);
```

### Features

The SW Eventing module is designed with flexibility and ease of use in mind, allowing for straightforward management of callbacks and ensuring event handlers are easy to register, deregister, and invoke. Key features include:

- **Type-Safe Callbacks**: Using templates, events are strongly typed, ensuring that only callbacks with matching argument types can be registered, minimizing runtime errors.
- **Custom Event Arguments**: Events can be created with any number and type of arguments, making the module adaptable to a wide range of event scenarios.
- **Dynamic Listener Management**: Listeners can be added, removed, or cleared, providing fine-grained control over event subscriptions.
- **Operator Overloads**: Supports `+=` and `-=` for adding and removing listeners, making the API intuitive and easy to use.

The SW Eventing module's type-safe, flexible architecture makes it an ideal choice for building event-driven systems where easy listener management and custom event propagation are essential.
