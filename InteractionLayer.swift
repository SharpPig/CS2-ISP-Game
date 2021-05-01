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

         
          switch key {
          case "w" :                     //Space bar
              if TestRect.velocityY == 0  {
              TestRect.velocityY = -20 
              }
          default:break

         
          }
      }
}
