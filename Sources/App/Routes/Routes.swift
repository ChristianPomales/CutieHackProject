import Vapor
import JSON

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
      
        get("cutiehack") { request in
          guard let classification = request.data["Classification"]?.string else {
            throw Abort(.badRequest)
          }
          
          if (classification == "happy") {
            return "😂"
          } else {
            return "Hello, \(classification)!"
          }
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
