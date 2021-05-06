import Igis
import Scenes
import Foundation
import ScenesControls
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {
    let TestRect = testRect()

    var isPaused = true 

    // let background = Background()
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
        insert(entity: TestRect, at: .front)

        let startButton = Button(name: "starter", labelString: "Start", topLeft: Point(x: 50, y: 50))
        startButton.clickHandler = startButtonClickHandler
        insert(entity: startButton, at: .front)

        let pauseButton = Button(name: "pauser", labelString: "Pause", topLeft: Point(x: 150, y: 50))
        pauseButton.clickHandler = pauseButtonClickHandler
        insert(entity: pauseButton, at: .front)

        
    }


    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
    }
    
    //set up func for presetup
    
    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }

    
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        
        switch key {
        case " " : //Space bar
            if !isPaused && !TestRect.isInAir  {
                TestRect.velocityY = -20 
            }
        default:break
                
                
        }
    }
    

    func background() -> Background {
        guard let mainScene = scene as? MainScene else {
            fatalError("mainScene of type MainScene is required")
        }
        let backgroundLayer = mainScene.backgroundLayer
        let background = backgroundLayer.background
        return background
    } 

    
    func startButtonClickHandler(control: Control, localLocation: Point) {
        background().changeVelocity(velocityX:-4, velocityY:0)
        isPaused = false
    }
    func pauseButtonClickHandler(control:Control, localLocation:Point) {
        background().changeVelocity(velocityX:0, velocityY:0)
        isPaused = true
    }
}
