package syncshop.domain

data class User(
    val id: Int,
    val email: String,
    val name: String,
    val password: String,
    val token: String
)