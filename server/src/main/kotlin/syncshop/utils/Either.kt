package syncshop.utils

sealed class Either<out L, out R> {
    data class Left<out L>(val value: L) : Either<L, Nothing>()
    data class Right<out R>(val value: R) : Either<Nothing, R>()

    fun <T> fold(ifLeft: (L) -> T, ifRight: (R) -> T): T =
        when (this) {
            is Left -> ifLeft(value)
            is Right -> ifRight(value)
        }
}