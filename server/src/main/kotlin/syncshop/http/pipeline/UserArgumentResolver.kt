package syncshop.http.pipeline

import jakarta.servlet.http.HttpServletRequest
import org.springframework.core.MethodParameter
import org.springframework.stereotype.Component
import org.springframework.web.bind.support.WebDataBinderFactory
import org.springframework.web.context.request.NativeWebRequest
import org.springframework.web.method.support.HandlerMethodArgumentResolver
import org.springframework.web.method.support.ModelAndViewContainer
import syncshop.domain.User

@Component
class UserArgumentResolver : HandlerMethodArgumentResolver {

    /**
     * Checks if a method parameter type is the same type as ExchangedUser
     * @param parameter method parameter
     * @returns true if method parameter type is the same type as ExchangedUser
     */
    override fun supportsParameter(parameter: MethodParameter) =
        parameter.parameterType == User::class.java

    /**
     * Gets user from request or throws IllegalStateException otherwise
     * @param parameter
     * @param mavContainer
     * @param webRequest
     * @param binderFactory
     */
    override fun resolveArgument(
        parameter: MethodParameter,
        mavContainer: ModelAndViewContainer?,
        webRequest: NativeWebRequest,
        binderFactory: WebDataBinderFactory?
    ): Any? {
        val request = webRequest.getNativeRequest(HttpServletRequest::class.java)
            ?: throw IllegalStateException("getNativeRequest failed")
        return getUserFrom(request) ?: throw IllegalStateException("No user detected in request")
    }

    companion object {
        private const val KEY = "UserArgumentResolver"

        /**
         * Associates UserArgumentResolver with a user
         * @param user user
         * @param request
         */
        fun addUserTo(user: User, request: HttpServletRequest) {
            return request.setAttribute(KEY, user)
        }

        /**
         * Gets user present in UserArgumentResolver
         * @param request
         * @returns user or null if it's not present in UserArgumentResolver
         */
        fun getUserFrom(request: HttpServletRequest): User? {
            return request.getAttribute(KEY)?.let {
                it as? User
            }
        }
    }
}