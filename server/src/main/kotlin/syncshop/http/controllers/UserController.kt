package syncshop.http.controllers

import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import syncshop.http.Uris
import syncshop.http.models.output.Problem
import syncshop.http.models.output.toUserOutputModel
import syncshop.service.UserError
import syncshop.service.UserService
import java.util.*

@RestController
@RequestMapping(Uris.BASE_PATH)
class UserController(private val service: UserService) {

    @GetMapping(Uris.User.USER)
    fun user(@PathVariable userId: UUID): ResponseEntity<*> =
        service.user(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toUserOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }
        )
}