//
//  PopAnimator.swift
//  SW Info
//
//  Created by Donny Davis on 5/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let crawlView = presenting ? toView : transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        let initialFrame = presenting ? originFrame : crawlView.frame
        let finalFrame = presenting ? crawlView.frame : originFrame
        
        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
        
        if presenting {
            crawlView.transform = scaleTransform
            crawlView.center = CGPoint(x: CGRectGetMidX(initialFrame), y: CGRectGetMidY(initialFrame))
            crawlView.clipsToBounds = true
        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(crawlView)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [], animations: {
            crawlView.transform = self.presenting ? CGAffineTransformIdentity : scaleTransform
            crawlView.center = CGPoint(x: CGRectGetMidX(finalFrame), y: CGRectGetMidY(finalFrame))
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
