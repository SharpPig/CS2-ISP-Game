import Scenes
import Igis


class testRect: RenderableEntity {
    var testRect = Rect(topLeft:Point(x:100, y:300), size:Size(width:50, height:70))
   
    private let strokeStyle = StrokeStyle(color:Color(.orange))
    private let fillStyle = FillStyle(color:Color(.red))
    private let lineWidth = LineWidth(width:5)

    public var velocityX : Int
    public var velocityY : Int
    

    init() {
        // Using a meaningful name can be helpful for debugging

        velocityX = 0
        velocityY = 0
        super.init(name:"testRect")

    }

    func boundary() -> Point {
        return testRect.topLeft

    }


    override func boundingRect() -> Rect {

        let topLeft = testRect.topLeft
        let size = testRect.size
        return Rect(topLeft:topLeft, size:size)
        
    }

    
    override func setup(canvasSize: Size, canvas: Canvas) {
        // Position the ellipse at the center of the canvas
        testRect.topLeft = canvasSize.center
    }

    public override func calculate(canvasSize: Size) {
        testRect.topLeft += Point(x: velocityX, y: velocityY)



        //////   GRAVITY ///////
        let onGround = (testRect.topLeft.y + testRect.height) > (canvasSize.height * 4/5 + 50)
        if onGround == false    {
            velocityY += 1
            
        }
        
       
        else {

            testRect.topLeft.y = (canvasSize.height * 4/5 + 50) - testRect.height
            velocityY = 0

          
        }
      
    }
    
    public func isOnGround() -> Bool {
        if (testRect.topLeft.y + testRect.height) < 650 { //650 is a temporary value that won't work for all screens, find a way for the func to find the canvasSize
            return false
        }
        else {
            return true
        }
            
    }

    
    public func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

    
    override func render(canvas:Canvas) {
        let testRectangle = Rectangle(rect:testRect)
        canvas.render(strokeStyle, fillStyle, lineWidth, testRectangle)
    }


    
}
