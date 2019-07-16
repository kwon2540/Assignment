//
//  ViewController.swift
//  TextToSpeech
//
//  Created by JUNHYEOK KWON on 2019/07/16.
//  Copyright © 2019 JUNHYEOK KWON. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var uiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiView.layer.cornerRadius = 10
        textView.delegate = self
        button.isEnabled = false
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forceKeyboardHide)))
    }
    
    @objc private func forceKeyboardHide() {
        textView.resignFirstResponder()
    }


    @IBAction private func speakerButton(_ sender: Any) {
        guard let textViewText = textView.text else { return }
        let synthesizer = AVSpeechSynthesizer()
        let text = AVSpeechUtterance(string: textViewText)
        text.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        text.rate = 0.4
        synthesizer.speak(text)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.button.isEnabled = textView.text.isEmpty ? false : true
        }
    }
}
