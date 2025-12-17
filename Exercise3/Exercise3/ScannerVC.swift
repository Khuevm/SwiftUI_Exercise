//
//  ScannerVC.swift
//  Exercise3
//
//  Created by Khue on 17/12/25.
//

import UIKit
import AVFoundation

enum ScannerError: String {
    case cannotSetupCamera = "Cannot set up camera"
    case cannotFindBarcode = "Cannot get barcode"
}

protocol ScannerDelegate: AnyObject {
    func didFindBarcode(barcode: String)
    func didError(error: ScannerError)
}

class ScannerVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    weak var delegate: ScannerDelegate?
    
    private let session = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    func setUpCameraSession(){
        let metadataOutput = AVCaptureMetadataOutput()
        
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) && session.canAddOutput(metadataOutput)
        else {
            delegate?.didError(error: .cannotSetupCamera)
            return
        }
        
        session.addInput(input)
        session.addOutput(metadataOutput)
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.ean8, .ean13]
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
            let barcode = object.stringValue
        else {
            delegate?.didError(error: .cannotFindBarcode)
            return
        }
        
        delegate?.didFindBarcode(barcode: barcode)
    }
}
