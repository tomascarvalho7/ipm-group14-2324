package syncshop.repository

import org.springframework.stereotype.Component
import syncshop.data.TransactionGetter

@Component
class Repository(
    val userRepository: UserRepository,
    val transactionGetter: TransactionGetter
) {
    /**
     * Gets a transaction
     * @return the transaction
     */
    fun newTransaction() = transactionGetter.getTransaction()
}