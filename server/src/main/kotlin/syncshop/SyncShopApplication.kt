package syncshop

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.PropertyNamingStrategies
import okhttp3.OkHttpClient
import org.jdbi.v3.core.Jdbi
import org.jdbi.v3.core.kotlin.KotlinPlugin
import org.postgresql.ds.PGSimpleDataSource
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder
import org.springframework.web.method.support.HandlerMethodArgumentResolver
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import syncshop.http.pipeline.AuthenticationInterceptor
import syncshop.http.pipeline.UserArgumentResolver

@SpringBootApplication
class SyncShopApplication : WebMvcConfigurer {

    @Bean
    fun jdbi(): Jdbi {
        val dataSource = PGSimpleDataSource()
        val jdbcDatabaseURL = System.getenv("POSTGRES_URI")
            ?: "jdbc:postgresql://localhost:5432/db?user=dbuser&password=changeit"
        dataSource.setURL(jdbcDatabaseURL)
        return Jdbi.create(dataSource).installPlugin(KotlinPlugin())
    }

    @Bean
    fun okHttpClient() = OkHttpClient()

    @Bean
    fun objectMapper(): ObjectMapper {
        val builder = Jackson2ObjectMapperBuilder()
        builder.propertyNamingStrategy(PropertyNamingStrategies.KEBAB_CASE)
        return builder.build()
    }
}

@Configuration
class PipelineConfigurer(
    val authenticationInterceptor: AuthenticationInterceptor,
    val userArgumentResolver: UserArgumentResolver,
) : WebMvcConfigurer {
    override fun addInterceptors(registry: InterceptorRegistry) {
        registry.addInterceptor(authenticationInterceptor)
    }

    override fun addArgumentResolvers(resolvers: MutableList<HandlerMethodArgumentResolver>) {
        resolvers.add(userArgumentResolver)
    }
}

fun main(args: Array<String>) {
    runApplication<SyncShopApplication>(*args)
}