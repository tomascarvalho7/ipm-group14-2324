package syncshop.http.controllers

import org.slf4j.LoggerFactory
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException
import syncshop.http.models.output.Problem
import syncshop.utils.ExternalError

@ControllerAdvice
class GlobalDefaultExceptionHandler {

    companion object {
        private val logger = LoggerFactory.getLogger(GlobalDefaultExceptionHandler::class.java)
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException::class)
    private fun handleTypeMismatchException(ex: MethodArgumentTypeMismatchException): ResponseEntity<*> =
        Problem.argumentTypeMismatch(ex.name, ex.value)

    @ExceptionHandler(ExternalError::class)
    private fun handleExternalError(ex: ExternalError): ResponseEntity<*> =
        Problem.error("Failed to reach external services")

    @ExceptionHandler(Exception::class)
    private fun handleServiceError(ex: Exception): ResponseEntity<*> {
        logger.warn("Error in service: ${ex.message}")
        logger.warn("Stack trace: ${ex.stackTraceToString()}")
        return Problem.error("Something went wrong")
    }
}