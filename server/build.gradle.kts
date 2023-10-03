import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	id("org.springframework.boot") version "3.0.3"
	id("io.spring.dependency-management") version "1.1.0"
	kotlin("jvm") version "1.7.22"
	kotlin("plugin.spring") version "1.7.22"
	java
}

group = "syncshop"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_17

val isArm = System.getProperty("os.arch") == "aarch64"
val isMac = System.getProperty("os.name").toLowerCase().contains("mac")

repositories {
	mavenCentral()
}

val ktlint by configurations.creating

dependencies {
	implementation("org.springframework.boot:spring-boot-starter-validation")
	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
    implementation("com.fasterxml.jackson.datatype:jackson-datatype-jsr310")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

	implementation("org.springframework.security:spring-security-core:6.0.2")

    implementation("com.squareup.okhttp3:okhttp:4.9.3")

	// for JDBI
	implementation("org.jdbi:jdbi3-core:3.37.1")
	implementation("org.jdbi:jdbi3-kotlin:3.37.1")
	implementation("org.jdbi:jdbi3-postgres:3.37.1")
	implementation("org.postgresql:postgresql:42.5.4")

	testImplementation("org.springframework.boot:spring-boot-starter-test")
	testImplementation("org.springframework.boot:spring-boot-starter-webflux")

    testImplementation("com.ninja-squad:springmockk:4.0.2")

    testImplementation("io.mockk:mockk:1.13.4")

	if (isMac && isArm) {
		runtimeOnly("io.netty:netty-resolver-dns-native-macos:4.1.82.Final:osx-aarch_64")
	}
	testImplementation(kotlin("test"))

	ktlint("com.pinterest:ktlint:0.48.2")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "17"
	}
}

tasks.withType<Test> {
	useJUnitPlatform()
	environment(
		mapOf("POSTGRES_URI" to "jdbc:postgresql://localhost:5432/db?user=dbuser&password=changeit")
	)
}

task<Copy>("extractUberJar") {
	dependsOn("assemble")
	// opens the JAR containing everything...
	from(zipTree("$buildDir/libs/${rootProject.name}-$version.jar"))
	// ... into the 'build/dependency' folder
	into("build/dependency")
}

task<Exec>("dbUp") {
	commandLine("docker-compose", "up", "-d", "--build", "--force-recreate", "db")
}

task<Exec>("dbWait") {
	commandLine("docker", "exec", "db", "/app/bin/wait-for-postgres.sh", "localhost")
	dependsOn("dbUp")
}

task<Exec>("dbDown") {
	commandLine("docker-compose", "down")
}

task<Exec>("composeUp") {
	commandLine("docker-compose", "up", "--build", "--force-recreate")
	dependsOn("extractUberJar")
}

// from https://pinterest.github.io/ktlint/install/integrations/#custom-gradle-integration-with-kotlin-dsl
val outputDir = "${project.buildDir}/reports/ktlint/"
val inputFiles = project.fileTree(mapOf("dir" to "src", "include" to "**/*.kt"))

val ktlintCheck by tasks.creating(JavaExec::class) {
	inputs.files(inputFiles)
	outputs.dir(outputDir)

	description = "Check Kotlin code style."
	classpath = ktlint
	mainClass.set("com.pinterest.ktlint.Main")
	// see https://pinterest.github.io/ktlint/install/cli/#command-line-usage for more information
	args = listOf("src/**/*.kt")
}

tasks.named("check") {
	dependsOn(ktlintCheck)
}
