#UBER imitate animated transitions
#Screenshot
![](https://github.com/geng199200/AnimatedTransitions/blob/master/examples_image/123.gif) 
##Setup
Have your viewcontroller conform to UIViewControllerTransitioningDelegate. Set the transitionMode, the startingPoint, the bubbleColor and the duration.
    - (TransitionModel *)transitionModel {
    if (_transitionModel == nil) {
        _transitionModel = [[TransitionModel alloc]init];
    }
    return _transitionModel;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.transitionModel.transitionMode = Present;
    self.transitionModel.startingPoint = self.modelBtn.center;
    self.transitionModel.bubbleColor = self.modelBtn.backgroundColor;
    self.transitionModel.duration = 0.5;
    return self.transitionModel;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transitionModel.transitionMode = Dismiss;
    self.transitionModel.startingPoint = self.modelBtn.center;
    self.transitionModel.bubbleColor = self.modelBtn.backgroundColor;
    self.transitionModel.duration = 0.5;
    return self.transitionModel;
}





