package syncshop.data.db

import syncshop.domain.DataList

/**
 * Makes a [DataList] from the list received from the database
 * @param receivedList the list received from the database
 * @param limit the maximum size of the final list
 * @return a [Boolean] if there were more items in the result set
 */
fun <T> makeDataList(receivedList: List<T>, limit: Int): DataList<T> {
    val finalList = mutableListOf<T>()
    var hasMore = false
    var found = 0
    receivedList.forEach {
        found++
        if (found <= limit) {
            finalList.add(it)
        } else {
            hasMore = true
        }
    }
    return DataList(finalList, hasMore)
}