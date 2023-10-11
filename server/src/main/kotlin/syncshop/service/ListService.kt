
sealed class ListError {
    object NotFound : ListError()
}
typealias ListResult = Either<ListError, ShoppingList>