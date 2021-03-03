import Scenes
import Igis


class Ball: RenderableEntity {
    private let ellipse = Ellipse(center:Point(x:0, y:0), radiusX:30, radiusY:30, fillMode:.fillAndStroke)
    private let strokeStyle = StrokeStyle(color:Color(.orange))
    private let fillStyle = FillStyle(color:Color(.red))
    private let lineWidth = LineWidth(width:5)

    var velocityX : Int
    var velocityY : Int
    

    init() {
        // Using a meaningful name can be helpful for debugging

        velocityX = 0
        velocityY = 0
        super.init(name:"Ball")

    }

    override func boundingRect() -> Rect {

        let left = ellipse.center.x - ellipse.radiusX
        let top = ellipse.center.y - ellipse.radiusY
        let width = ellipse.radiusX * 2
        let height = ellipse.radiusY * 2

        return Rect(topLeft:Point(x:left, y:top), size:Size(width:width, height:height))
    }
    
    override func setup(canvasSize: Size, canvas: Canvas) {
        // Position the ellipse at the center of the canvas
        ellipse.center = canvasSize.center
    }

    public override func calculate(canvasSize: Size) {
        ellipse.center += Point(x: velocityX, y: velocityY)



        //////   GRAVITY ///////
        let onGround = (ellipse.center.y + ellipse.radiusY) == canvasSize.height * 4/5
        if onGround == false {
            velocityY = 5
        }
        else {
            velocityY = 0
        }
    }

    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

    
    override func render(canvas:Canvas) {
        canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
    }


    
}
