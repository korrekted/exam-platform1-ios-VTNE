//
//  TabView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 17.01.2021.
//

import UIKit

final class TabView: UIView {
    enum Tab {
        case study, stats, review
    }
    
    lazy var studyItem = makeItem(image: "Course.Tab.Study", title: "Course.Tab.Study")
    lazy var statsItem = makeItem(image: "Course.Tab.Stats", title: "Course.Tab.Stats")
    lazy var reviewItem = makeItem(image: "Course.Tab.Review", title: "Course.Tab.Review")
    
    var selectedTab = Tab.study {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension TabView {
    func update() {
        studyItem.state = selectedTab == .study ? .selected : .deselected
        statsItem.state = selectedTab == .stats ? .selected : .deselected
        reviewItem.state = selectedTab == .review ? .selected : .deselected
    }
}

// MARK: Make constraints
private extension TabView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            studyItem.leadingAnchor.constraint(equalTo: leadingAnchor),
            studyItem.bottomAnchor.constraint(equalTo: bottomAnchor),
            studyItem.topAnchor.constraint(equalTo: topAnchor),
            studyItem.widthAnchor.constraint(equalTo: statsItem.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statsItem.leadingAnchor.constraint(equalTo: studyItem.trailingAnchor),
            statsItem.bottomAnchor.constraint(equalTo: bottomAnchor),
            statsItem.topAnchor.constraint(equalTo: topAnchor),
            statsItem.widthAnchor.constraint(equalTo: reviewItem.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            reviewItem.leadingAnchor.constraint(equalTo: statsItem.trailingAnchor),
            reviewItem.bottomAnchor.constraint(equalTo: bottomAnchor),
            reviewItem.topAnchor.constraint(equalTo: topAnchor),
            reviewItem.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension TabView {
    func makeItem(image: String, title: String) -> TabItemView {
        let attrs = TextAttributes()
            .font(Fonts.SFProRounded.regular(size: 10.scale))
            .textColor(Appearance.mainColor)
            .letterSpacing(-0.24.scale)
            .lineHeight(11.93.scale)
            .textAlignment(.center)
        
        let view = TabItemView()
        view.backgroundColor = UIColor.clear
        view.imageView.image = UIImage(named: image)
        view.label.attributedText = title.localized.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
