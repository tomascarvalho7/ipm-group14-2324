package syncshop.repository

/**
 * Get data that can't be null
 * @param function the function that will provide the data
 * @return the data that is not null
 */
fun <T> getData(function: () -> T?) = function() ?: throw IllegalArgumentException("Not found")