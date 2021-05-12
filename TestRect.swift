import Scenes
import Foundation
import Igis


class TestRect: RenderableEntity {

    let background = Background()
    
    var testRect = Rect(topLeft:Point(x:100, y:300), size:Size(width:50, height:70))
   
    private let strokeStyle = StrokeStyle(color:Color(.orange))
    private let fillStyle = FillStyle(color:Color(.red))
    private let lineWidth = LineWidth(width:5)

    public var velocityX : Int
    public var velocityY : Int


    var spriteNumber = 0

    var sprite1Pic : Image
    var sprite2Pic : Image
    var sprite3Pic : Image
    var sprite4Pic : Image
    var sprite5Pic : Image
    var jumpSpritePic : Image
    var currentSpriteImage = Image(sourceURL:URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/e4ce5fb996a9a25.png")!) 
    
    public var isInAir = true
    

    override func setup(canvasSize: Size, canvas: Canvas) {

        testRect.topLeft = canvasSize.center
        canvas.setup(sprite1Pic, sprite2Pic, sprite3Pic, sprite4Pic, sprite5Pic, jumpSpritePic)
    }



    init() {
        // Using a meaningful name can be helpful for debugging        
        velocityX = 0
        velocityY = 0

        guard let sprite1PicURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/8745ac9368a7de9.png") else {
            fatalError("unexpected sprite1 URL")
        }
        guard let sprite2PicURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/5c4ce4196a17398.png") else {
            fatalError("unexpected sprite2 URL")
        }
        guard let sprite3PicURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/3ad1f398a68ac10.png") else {
            fatalError("unexpected sprite3 URL")
        }
        guard let sprite4PicURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/a60b6eba3f7583c.png") else {
            fatalError("unexpected sprite4 URL")
        }
        guard let sprite5PicURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/856e99e8944efbe.png") else {
            fatalError("unexpected sprite5 URL")
        }
        guard let jumpSpritePicURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/4b1f262ba6fb905.png") else {
            fatalError("unexpected jumpSprite URL")
        }
        sprite1Pic = Image(sourceURL:sprite1PicURL)
        sprite2Pic = Image(sourceURL:sprite2PicURL)
        sprite3Pic = Image(sourceURL:sprite3PicURL)
        sprite4Pic = Image(sourceURL:sprite4PicURL)
        sprite5Pic = Image(sourceURL:sprite5PicURL)
        jumpSpritePic = Image(sourceURL:jumpSpritePicURL)
        super.init(name:"testRect")

    }


    override func boundingRect() -> Rect {

        let topLeft = testRect.topLeft
        let size = testRect.size
        return Rect(topLeft:topLeft, size:size)
        
    }

    

    public override func calculate(canvasSize: Size) {
        testRect.topLeft += Point(x: velocityX, y: velocityY)


        if !isInAir {
            spriteNumber += 1
            let spriteIdentifyingNumber = spriteNumber%10

            switch spriteIdentifyingNumber {
            case 1 & 2:
                currentSpriteImage = sprite1Pic
            case 3 % 4:
                currentSpriteImage = sprite2Pic
            case 5 % 6:
                currentSpriteImage = sprite3Pic
            case 7 & 8:
                currentSpriteImage = sprite4Pic
            case 9 & 10:
                currentSpriteImage = sprite5Pic
            default:
                break
            }
        }

        else {
            currentSpriteImage = jumpSpritePic
        }
        
        sprite1Pic.renderMode = .destinationRect(testRect)
        sprite2Pic.renderMode = .destinationRect(testRect)
        sprite3Pic.renderMode = .destinationRect(testRect)
        sprite4Pic.renderMode = .destinationRect(testRect)
        sprite5Pic.renderMode = .destinationRect(testRect)
        jumpSpritePic.renderMode = .destinationRect(testRect)
        
             //////   GRAVITY ///////
        let onGround = (testRect.topLeft.y + testRect.height) > (canvasSize.height * 4/5 + 50) || (testRect.topLeft.y + testRect.height) == (canvasSize.height * 4/5 + 50)
            if onGround == false   {
                velocityY += 1   
                isInAir = true
            }
            else {
                testRect.topLeft.y = (canvasSize.height * 4/5 + 50) - testRect.height 
                velocityY = 0
                isInAir = false
            }
        
        
    }
    
    public func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

    
    override func render(canvas:Canvas) {
       
        if sprite1Pic.isReady && sprite2Pic.isReady && sprite3Pic.isReady && sprite4Pic.isReady && sprite5Pic.isReady {
            canvas.render(currentSpriteImage)
        }
        
    }


    
}
