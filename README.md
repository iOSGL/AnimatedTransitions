#UBER imitate animated transitions
#Screenshot
![](https://github.com/geng199200/AnimatedTransitions/blob/master/examples_image/123.gif) 
##Setup
Have your viewcontroller conform to UIViewControllerTransitioningDelegate. Set the transitionMode, the startingPoint, the bubbleColor and the duration.
```- (TransitionModel *)transitionModel {
    if (_transitionModel == nil) {
        _transitionModel = [[TransitionModel alloc]init];
    }
    return _transitionModel;
}



