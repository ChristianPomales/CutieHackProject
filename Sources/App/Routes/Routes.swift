import Vapor
import JSON
import Foundation

extension Droplet {
  
    func setupRoutes() throws {
      
      var coreMLClassification = ""
      
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
      
      get("test") { request in
        return Response(status: .ok, headers: ["Content-Type": "text/html"], body: "<html><meta charset='utf-8'>😓</html>")
      }
      
        get("cutiehack") { request in
          let drop = self
          
          switch coreMLClassification {
            case "Happy":
              return try drop.view.make("happy.leaf")
            case "Sad":
              return try drop.view.make("sad.leaf")
            case "Fear":
              return try drop.view.make("fear.leaf")
            case "Neutral":
              return try drop.view.make("neutral.leaf")
            case "Disgust":
              return try drop.view.make("disgust.leaf")
            case "Angry":
              return try drop.view.make("angry.leaf")
            case "Surprise":
              return try drop.view.make("surprise.leaf")
            default:
              return try drop.view.make("default.leaf")
          }
          
        }
      
      post("cutiehack") { request in
        guard let classification = request.data["Classification"]?.string else {
          throw Abort(.badRequest)
        }
        
        coreMLClassification = classification
        
        return ""
        
      }
  }
}
