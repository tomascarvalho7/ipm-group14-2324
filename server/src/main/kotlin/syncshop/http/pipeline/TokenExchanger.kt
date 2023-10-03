package syncshop.http.pipeline

import org.springframework.stereotype.Component
import syncshop.domain.User
import syncshop.repository.Repository

@Component
class TokenExchanger(val repository: Repository) {
    fun exchangeToken(token: String): User? {
        // exchange token for user in database
        TODO()
    }
}