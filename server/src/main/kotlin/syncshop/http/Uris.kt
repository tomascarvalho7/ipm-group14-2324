package syncshop.http

import org.springframework.web.util.UriTemplate

/**
 * All the different Uris needed
 */
object Uris {
    const val BASE_PATH = "/api/"

    fun home(): String = BASE_PATH

    object User {
        const val USERS = "/user"
        const val USER_LISTS = "/lists"
        const val CREATE_USER = ""
    }

    object Shop {
        const val LISTS = "/lists"
        const val LIST = "/lists/{listId}"
        const val ITEMS = "lists/{listId}/items/"
        const val ITEM = "lists/{listId}/items/{itemId}"

        fun newHousehold(householdName: String): String =
            UriTemplate(BASE_PATH + NEW_HOUSEHOLD).expand(householdName).toASCIIString()
    }
}