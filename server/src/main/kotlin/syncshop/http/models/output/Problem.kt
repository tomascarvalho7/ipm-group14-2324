package syncshop.http.models.output

import org.springframework.http.ResponseEntity

data class Problem(
    val status: Int,
    val title: String,
    val detail: String
) {
    companion object {
        private const val MEDIA_TYPE = "application/problem+json"

        private fun response(problem: Problem) = ResponseEntity
            .status(problem.status)
            .header("Content-Type", MEDIA_TYPE)
            .body<Any>(problem)

        fun argumentTypeMismatch(name: String, value: Any?) = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "$value is not a valid $name"
            )
        )

        val userNotFound = response(
            Problem(
                status = 404,
                title = "Not found",
                detail = "User not found"
            )
        )

        val me = response(
            Problem(
                status = 500,
                title = "Internal server error",
                detail = "Error fulfilling request"
            )
        )

        val userPictureNotFound = response(
            Problem(
                status = 404,
                title = "Not found",
                detail = "User not found"
            )
        )

        val editUserEmptyUsername = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Empty username"
            )
        )

        val editUserUsernameAlreadyInUse = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Username already in use"
            )
        )

        val editUserEmptyName = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Empty name"
            )
        )

        val editUserEmptyBio = response(
            Problem(
                400,
                "Bad request",
                "Empty bio"
            )
        )

        val editUserBioTooLong = response(
            Problem(
                400,
                "Bad request",
                "Bio too long"
            )
        )

        val editUserPictureInvalidPicture = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Invalid picture"
            )
        )

        val userTailsInvalidLimit = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Invalid limit"
            )
        )

        val userTailsInvalidSkip = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Invalid skip"
            )
        )

        val userTailsUserNotFound = response(
            Problem(
                status = 404,
                title = "Not found",
                detail = "User not found"
            )
        )

        val tailNotFound = response(
            Problem(
                status = 404,
                title = "Not found",
                detail = "Tail not found"
            )
        )

        val tailCollaboratorsTailNotFound = response(
            Problem(
                status = 404,
                title = "Not found",
                detail = "Tail not found"
            )
        )

        val tailCollaboratorsInvalidLimit = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Invalid limit"
            )
        )

        val tailCollaboratorsInvalidSkip = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Invalid skip"
            )
        )

        val createTailEmptyTitle = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Empty title"
            )
        )

        val createTailTitleTooLong = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Title too long"
            )
        )

        val createTailEmptyDescription = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Empty description"
            )
        )

        val createTailDescriptionTooLong = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Description too long"
            )
        )

        val createTailTextTooLong = response(
            Problem(
                status = 400,
                title = "Bad request",
                detail = "Text too long"
            )
        )

        fun error(description: String) = response(
            Problem(
                500,
                "Internal server error",
                description
            )
        )
    }
}