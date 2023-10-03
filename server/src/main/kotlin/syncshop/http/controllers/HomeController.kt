package syncshop.http.controllers

import org.springframework.http.CacheControl
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import syncshop.http.Uris
import syncshop.http.models.output.HomeOutputModel
import java.util.concurrent.TimeUnit

@RestController
@RequestMapping(Uris.BASE_PATH)
class HomeController {
    @GetMapping
    fun home(): ResponseEntity<*> =
        ResponseEntity
            .status(200)
            .contentType(MediaType.APPLICATION_JSON)
            .cacheControl(CacheControl.maxAge(7, TimeUnit.DAYS).mustRevalidate())
            .body(HomeOutputModel())
}