
@RestController
@RequestMapping(Uris.Shop.LISTS)
class ShoppigListController(private val service: ShoppingListService) {
    
    @GetMapping("/")
    fun shoppingLists(): ResponseEntity<*> =
        service.shoppingLists(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toShoppingListOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }
        )
    
    @PostMapping("/")
    fun createShoppingList(): ResponseEntity<*> =
        service.createShoppingList(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toShoppingListOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }
        )

    @GetMapping(LISTS.LIST)
    fun getList(@PathVariable listId: String): ResponseEntity<*> =
        service.shoppingList(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toShoppingListOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }
        )
    
    @DeleteMapping(LISTS.LIST)
    fun deleteList(@PathVariable listId: String): ResponseEntity<*> =
        service.deleteShoppingList(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toShoppingListOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }

    @PostMapping(LISTS.ITEMS)
    fun addItem(@PathVariable listId: String): ResponseEntity<*> =
        service.createShoppingList(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toShoppingListOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }
        )

    @DeleteMapping(LISTS.ITEM)
    fun removeItem (@PathVariable listId: String, @PathVariable itemId: String): ResponseEntity<*> =
        service.createShoppingList(userId).fold(
            ifRight = { value ->
                ResponseEntity
                    .status(200)
                    .contentType(MediaType.APPLICATION_JSON)
                    .body(value.toShoppingListOutputModel())
            },
            ifLeft = { value ->
                when (value) {
                    UserError.NotFound -> Problem.userNotFound
                }
            }
        )
}