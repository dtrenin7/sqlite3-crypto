# sqlite3-crypto

Based on old version 3.12.1
Use in on your own risk))

There are two steps involved in adding an AAR file to an Android Studio project:

1. Import the module. In Android Studio 2.1 this is accomplished by selecting the "File" -> "New" -> "New Module..." menu and then choosing "Import JAR/AAR Package".
2. Add a dependency on the new module to the main application module (or to all modules that will use the SQLite Android bindings). In Android Studio 2.1 the dependency may be created using the project structure dialog (select "File" -> "Project Structure...") or by adding code similar to the following to the application modules build.gradle file:
```
    dependencies {
        // Change "sqlite3-release" to the name of the new module!
        compile project(':sqlite3-release')
    }
```
