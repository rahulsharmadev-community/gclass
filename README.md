## gclass: Dart Code Generator for Fun and Experimentation

**gclass** is a **Dart code generator** created for personal exploration and enjoyment, not intended for production use. It aims to simplify the process of:

1. **Generating a `copyWith` method:** This method allows you to easily create a copy of an object with specific modifications.
2. **Handling de/serialization:** gclass can help you automate the conversion of objects to and from their serialized forms (e.g., JSON, Map).

**Please note:** This project is still under development and might not be suitable for critical applications.

### Getting Started

**Prerequisites:**

* **Dart development environment:** You'll need a Dart development environment like Dart SDK or a code editor with Dart support.
* **Build system:** This project uses `build_runner` for code generation.

**Installation:**

Clone the gclass repository:

   ```bash
   git clone https://github.com/rahulsharmadev-community/gclass.git
   ```
**Usage:**

Run the build command:

   ```bash
   pub run build_runner build
   ```

This will generate a new file containing the `copyWith` method and de/serialization logic based on your class definition.

**Disclaimer:**

gclass is still under development and might have limitations or unexpected behavior. Use it for experimentation and learning purposes only, not for production-critical code.
