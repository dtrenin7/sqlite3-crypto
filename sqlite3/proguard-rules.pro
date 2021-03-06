# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/dan/Android/Sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

-keepclasseswithmembers class io.requery.android.database.** {
  native <methods>;
  public <init>(...);
}
-keepnames class io.requery.android.database.** { *; }
-keep public class io.requery.android.database.sqlite.SQLiteCustomFunction { *; }
-keep public class io.requery.android.database.sqlite.SQLiteCursor { *; }
-keep public class io.requery.android.database.sqlite.SQLiteDebug** { *; }
-keep public class io.requery.android.database.sqlite.SQLiteDatabase { *; }
-keep public class io.requery.android.database.sqlite.SQLiteOpenHelper { *; }
-keep public class io.requery.android.database.sqlite.SQLiteStatement { *; }
-keep public class io.requery.android.database.CursorWindow { *; }
-keepattributes Exceptions,InnerClasses
