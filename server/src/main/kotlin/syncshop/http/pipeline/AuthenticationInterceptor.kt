package syncshop.http.pipeline

import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import org.springframework.web.method.HandlerMethod
import org.springframework.web.servlet.HandlerInterceptor
import syncshop.domain.User

/**
 * Intercepts the request and verifies if it's authenticated
 */
@Component
class AuthenticationInterceptor(
    private val authorizationHeaderProcessor: AuthorizationHeaderProcessor
) : HandlerInterceptor {

    /**
     * Process user authentication in request
     * @param request
     * @param response
     * @param handler handler used in the request
     * @return true if the authentication is valid or if it's not needed any for the type of request
     */
    override fun preHandle(request: HttpServletRequest, response: HttpServletResponse, handler: Any): Boolean {
        if (handler is HandlerMethod &&
            handler.methodParameters
                .any { it.parameterType == User::class.java }
        ) {
            // enforce authentication
            val user = authorizationHeaderProcessor
                .process(request.getHeader(NAME_AUTHORIZATION_HEADER))

            return if (user == null) {
                response.status = 401
                response.addHeader(NAME_WWW_AUTHENTICATE_HEADER, AuthorizationHeaderProcessor.SCHEME)
                false
            } else {
                UserArgumentResolver.addUserTo(user, request)
                true
            }
        }
        return true
    }

    companion object {
        private val logger = LoggerFactory.getLogger(AuthenticationInterceptor::class.java)
        private const val NAME_AUTHORIZATION_HEADER = "Authorization"
        private const val NAME_WWW_AUTHENTICATE_HEADER = "WWW-Authenticate"
    }
}