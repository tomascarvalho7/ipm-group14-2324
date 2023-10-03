package syncshop.http.pipeline

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import syncshop.domain.User

/**
 * Processes the Header's Authorization using user services
 */
@Component
class AuthorizationHeaderProcessor(val tokenExchanger: TokenExchanger) {
    companion object {
        private val logger = LoggerFactory.getLogger(AuthorizationHeaderProcessor::class.java)
        const val SCHEME = "bearer"

        /**
         * Gets the user token from the Authorization header
         * @param authorization the authorization header
         * @return the token
         */
        private fun getTokenFromAuthorization(authorization: String?): String? {
            if (authorization != null) {
                val authData = authorization.trim().split(' ')
                if (authData[0].lowercase() == "bearer") {
                    return authData[1]
                }
            }
            return null
        }
    }

    /**
     * Gets email from token
     * @param authorizationValue the token used in the request
     * @return user
     */
    fun process(authorizationValue: String?): User? {
        val accessToken = getTokenFromAuthorization(authorizationValue)
            ?: return null

        logger.info("Processing token")

        return tokenExchanger.exchangeToken(accessToken)
    }
}