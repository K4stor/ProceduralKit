import CoreImage

class MetalFilter: CIFilter {
    
    private let kernel: CIKernel?
    
    var inputImage: CIImage?
    
    override init() {
        let url = Bundle.main.url(forResource: "default", withExtension: "metallib")!
        let data = try! Data(contentsOf: url)
        kernel = try? CIKernel(functionName: "myKernel", fromMetalLibraryData: data)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func outputImage() -> CIImage? {
        guard let inputImage = inputImage else {return nil}
        return kernel?.apply(extent: inputImage.extent, roiCallback: { (_, rect) -> CGRect in
            return rect
        }, arguments: [inputImage])
    }
}
