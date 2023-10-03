package syncshop.service

import org.springframework.stereotype.Component
import syncshop.domain.User
import syncshop.repository.Repository
import syncshop.service.utils.doService
import syncshop.utils.Either
import java.util.*

sealed class UserError {
    object NotFound : UserError()
}
typealias UserResult = Either<UserError, User>

@Component
class UserService(private val repository: Repository) {

    /**
     * Gets the user by the id
     * @param id the user id
     * @return the result
     */
    fun user(id: UUID): UserResult =
        doService(repository) {
            TODO()
        }
}