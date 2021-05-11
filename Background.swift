import Scenes
import Igis
import Foundation
  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    var testImage : Image
    var testImage2 : Image
    var velocityX : Int
    var velocityY : Int
    var imagePosition = Point()
    

    
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(testImage, testImage2)
    }

    init() {
        // Using a meaningful name can be helpful for debugging
        //test
        velocityX = 0
        velocityY = 0
        
        guard let testImageURL = URL(string:"https://sophookles.com/wp-content/uploads/2020/02/looping-forest-day.png") else {
            fatalError("unexpected URL")
        }
        guard let testImage2URL = URL(string:"https://sophookles.com/wp-content/uploads/2020/02/looping-forest-day.png") else {
            fatalError("unexpected URL")
        }
        testImage = Image(sourceURL:testImageURL)
        testImage2 = Image(sourceURL:testImage2URL)
        
      //figure out how to get canvasSize
        super.init(name:"Background")
        
    }

    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

    
   
    override func calculate(canvasSize:Size) {

        imagePosition += Point(x:velocityX, y:velocityY)

        let imageRect = Rect(topLeft:imagePosition,size:canvasSize)
        testImage.renderMode = .destinationRect(imageRect)

        let imageRect2 = Rect(topLeft:Point(x:imagePosition.x + canvasSize.width, y:imagePosition.y), size:canvasSize)
        testImage2.renderMode = .destinationRect(imageRect2)

        if imageRect2.topLeft.x < 0 {
            imagePosition = Point(x:0, y:0)
        }
        
    }

    func clearCanvas(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize {
            let canvasRect = Rect(topLeft:Point(), size:canvasSize)
            let canvasClearRectangle = Rectangle(rect:canvasRect, fillMode:.clear)
            canvas.render(canvasClearRectangle)
        }
    }
        
    override func render(canvas:Canvas) {
        clearCanvas(canvas:canvas)

            if testImage.isReady {
                canvas.render(testImage)
            }
            if testImage2.isReady {
                canvas.render(testImage2)
            }
            
            //GRAVITY HAPPENS ABOVE 4/5 OF THE HEIGHT OF THE CANVAS
    }

}
