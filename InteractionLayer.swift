import Igis
import Scenes
import Foundation

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {
    let TestRect = testRect()
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          insert(entity: TestRect, at: .front)
          
      }
      override func preSetup(canvasSize: Size, canvas: Canvas) {
          dispatcher.registerKeyDownHandler(handler: self)
      }

//set up func for presetup
      
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
      }

    

      
      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {


//don't flat out change velocity, use move logic from W1521

          
          switch key {

          case "w" :
              if TestRect.isOnGround() {
              TestRect.velocityY = -20 //switch to have it respond to spacebar
              }
          default:break

         
          }
      }
}
