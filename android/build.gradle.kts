allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    project.pluginManager.withPlugin("com.android.library") {
        val android = project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
        if (android != null) {
            if (android.namespace == null) {
                android.namespace = "dev.flutter.plugins.${project.name.replace("-", "_")}"
            }
            android.compileSdkVersion(35)
        }
    }
}


tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
