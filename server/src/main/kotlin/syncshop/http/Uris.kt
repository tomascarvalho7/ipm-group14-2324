package syncshop.http

import org.springframework.web.util.UriTemplate

/**
 * All the different Uris needed
 */
object Uris {
    const val BASE_PATH = "/api/"

    fun home(): String = BASE_PATH

    object User {
        const val CREATE_USER = ""
    }

    object Shop {
        const val NEW_HOUSEHOLD = "household/{householdName}"
        const val NEW_ITEM = ""

        fun newHousehold(householdName: String): String =
            UriTemplate(BASE_PATH + NEW_HOUSEHOLD).expand(householdName).toASCIIString()
    }
}