# sqlite3-crypto

Based on old version 3.12.1
Use in on your own risk))

There are two steps involved in adding an AAR file to an Android Studio project:

1. Import the module. In Android Studio 2.1 this is accomplished by selecting the "File" -> "New" -> "New Module..." menu and then choosing "Import JAR/AAR Package".
2. Add a dependency on the new module to the main application module (or to all modules that will use the SQLite Android bindings). In Android Studio 2.1 the dependency may be created using the project structure dialog (select "File" -> "Project Structure...") or by adding code similar to the following to the application modules build.gradle file:
```
    dependencies {
        // Change "sqlite3-release" to the name of the new module!
        implementation project(':sqlite3-release')
    }
```

OR copy prebuilt .AAR file from PREBUILT/ folder to libs folder of your app and add:

```
dependencies {
    implementation fileTree(include: ['*.aar'], dir: 'libs')
}
```

Code sample:
```
import org.sqlite.database.sqlite.SQLiteDatabase;
import org.sqlite.database.sqlite.SQLiteOpenHelper;

public class BaseDb extends SQLiteOpenHelper {

    static {
     System.loadLibrary("sqliteX"); // IMPORTANT!
    }

    private static final String TAG = "BaseDb";

    /**
     * Schema version. Increment on schema changes.
     */
    private static final int DATABASE_VERSION = 15;

    /**
     * Filename for SQLite file.
     */
    private static final String DATABASE_NAME = "base.db";
    private static BaseDb sInstance = null;

    /**
     * Private constructor
     */
    private BaseDb(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    /**
     * Get instance of BaseDb
     *
     * @return BaseDb instance
     */
    public static BaseDb getInstance() {
        if (sInstance == null) {
            sInstance = new BaseDb(...);
            ...
        }
        return sInstance;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
      db.execSQL("PRAGMA key = 'secretkey'"); // SET PASSWORD HERE
      ...
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
      ...
    }

    @Override
    public void onDowngrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        onUpgrade(db, oldVersion, newVersion);
    }

    @Override
    public void onConfigure(SQLiteDatabase db) {
      ...
    }

  }

```
