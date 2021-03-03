import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
      override func render(canvas:Canvas) {
          // Construct a rectangle which covers the entire canvas
          // Render the rectangle using the ".clear" fillMode
          if let canvasSize = canvas.canvasSize {



              //MAKE SEPARATE FILES AND STUFF FOR EACH ONE
              let skyRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvasSize.width, height:canvasSize.height * 4/5))
              let skyRectangle = Rectangle(rect:skyRect, fillMode:.fill)
              let sky = FillStyle(color:Color(.blue))
              canvas.render(sky, skyRectangle)

              let grassRect = Rect(topLeft:Point(x:0, y:canvasSize.height * 4/5),size:Size(width:canvasSize.width, height:canvasSize.height * 4/5))
              let grassRectangle = Rectangle(rect:grassRect, fillMode:.fill)
              let grass = FillStyle(color:Color(.green))
              canvas.render(grass, grassRectangle)
          }
      }

}
