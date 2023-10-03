package syncshop.utils

import org.slf4j.LoggerFactory
import syncshop.data.Transaction
import kotlin.concurrent.getOrSet

/**
 * A thread-local holder for the current transaction
 */
object TransactionHolder {
    private val logger = LoggerFactory.getLogger(TransactionHolder::class.java)
    private val threadLocalTransaction = ThreadLocal<Transaction>()

    /**
     * Clears the current transaction
     */
    fun clear() {
        logger.info("Removing a transaction")
        threadLocalTransaction.remove()
    }

    /**
     * Gets the current transaction or creates a new one if there is none
     */
    fun getOrSetTransaction(newTransaction: () -> Transaction) =
        threadLocalTransaction.getOrSet {
            logger.info("Creating a transaction")
            val transaction = newTransaction()
            transaction.begin()
            transaction
        }

    /**
     * Gets the current transaction
     */
    fun getTransaction() = threadLocalTransaction.get()
        ?: throw IllegalStateException("No current transaction")
}