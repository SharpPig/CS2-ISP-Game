import Scenes
import Igis
import Foundation
  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    var testImage : Image
 
    var velocityX : Int
    var velocityY : Int

    var imageRect : Rect
    
    init() {
        // Using a meaningful name can be helpful for debugging

        imageRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:1500, height:800))
        
        velocityX = 0
        velocityY = 0
        
        guard let testImageURL = URL(string:"https://sophookles.com/wp-content/uploads/2020/02/looping-forest-day.png") else {
            fatalError("unexpected URL")
        }
        testImage = Image(sourceURL:testImageURL)


        super.init(name:"Background")
        
    }

    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

    
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(testImage)
    }

    override func calculate(canvasSize:Size) {
        imageRect.topLeft += Point(x:velocityX, y:velocityY)
    }

    func clearCanvas(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize {
            let canvasRect = Rect(topLeft:Point(), size:canvasSize)
            let canvasClearRectangle = Rectangle(rect:canvasRect, fillMode:.clear)
            canvas.render(canvasClearRectangle)
        }
    }
    
    
    override func render(canvas:Canvas) {
        // Construct a rectangle which covers the entire canvas
        // Render the rectangle using the ".clear" fillMode
        clearCanvas(canvas:canvas)
        
        if let canvasSize = canvas.canvasSize {
            
            if testImage.isReady {
                testImage.renderMode = .destinationRect(imageRect)
                canvas.render(testImage)
            }
           

            //GRAVITY HAPPENS ABOVE 4/5 OF THE HEIGHT OF THE CANVAS
        }
    }

}
