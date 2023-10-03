package syncshop.data.db

import org.jdbi.v3.core.Jdbi
import org.springframework.stereotype.Component
import syncshop.data.TransactionGetter

@Component
class TransactionGetterDb(private val jdbi: Jdbi) : TransactionGetter {
    override fun getTransaction() = TransactionDb(jdbi.open())
}