import Foundation
import Cocoa

// Define Filter type as a function that takes an image as its parameter and returns a new image
typealias Filter = CIImage -> CIImage

/*: Building Filters
Returns a function that takes an argument image of type CIImage and returns a new image (filter.outputImage)
*/

func blur(radius: Double) -> Filter {
  return { image in
    let parameters = [
      kCIInputRadiusKey: radius,
      kCIInputImageKey: image
    ]
    let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters)

    return (filter?.outputImage)!
  }
}

/*:
Color Overlay
*/

func colorGenerator(color: NSColor) -> Filter {
  return { _ in
    let parameters = [kCIInputColorKey: color]
    let filter = CIFilter(name: "CIConstantColorGenerator", withInputParameters: parameters)

    return (filter?.outputImage)!
  }
}

func compositeSourceOver(overlay: CIImage) -> Filter {
  return { image in
    let parameters = [
      kCIInputBackgroundImageKey: image,
      kCIInputImageKey: overlay
    ]
    let filter = CIFilter(name: "CISourceOverCompositing", withInputParameters: parameters)
    let cropRect = image.extent

    return (filter?.outputImage?.imageByCroppingToRect(cropRect))!
  }
}

func colorOverlay(color: NSColor) -> Filter {
  return { image in
    let overlay = colorGenerator(color)(image)
    return compositeSourceOver(overlay)(image)
  }
}