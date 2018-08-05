//
//  EngineerDayView.swift
//  Wheel-Of-Fate
//
//  Created by Azis Senoaji Prasetyotomo on 04/08/18.
//  Copyright © 2018 Azis Senoaji Prasetyotomo. All rights reserved.
//

import UIKit

@IBDesignable
class EngineerDayView: UIView {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dayEngineerLabel: UILabel!
    @IBOutlet var nightEngineerLabel: UILabel!

    var view: UIView?
    let nibName: String = "EngineerDayView"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        setupSubView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupXIB()
        setupSubView()
        view?.prepareForInterfaceBuilder()
    }
    
    func setupSubView() {
        dayLabel.font = .systemFont(ofSize: 17, weight: .bold)
        dayEngineerLabel.font = .systemFont(ofSize: 14, weight: .regular)
        nightEngineerLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    func setup(dayText: String, dayEngineer: String, nightEngineer: String) {
        dayLabel.text = dayText
        dayEngineerLabel.text = "Day Shift -> " +  dayEngineer
        nightEngineerLabel.text = "Night Shift -> " + nightEngineer
    }
    
    func setupXIB() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
}
