package syncshop.service.utils

import org.slf4j.LoggerFactory
import syncshop.data.Transaction
import syncshop.repository.Repository
import syncshop.utils.TransactionHolder

private val logger = LoggerFactory.getLogger("syncup.service.utils")

/**
 * Executes a function within a [Transaction] and commits
 * @param repository the repository module to be used
 * @param function the code to be executed
 * @return the value returned by function
 */
fun <T> doService(repository: Repository, function: () -> T): T {
    val transaction = TransactionHolder.getOrSetTransaction { repository.newTransaction() }
    try {
        val res = function()
        transaction.commit()
        return res
    } catch (error: Exception) {
        transaction.rollback()
        throw error
    } finally {
        transaction.close()
        TransactionHolder.clear()
    }
}