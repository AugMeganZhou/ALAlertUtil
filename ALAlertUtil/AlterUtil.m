//
//  AlterUtil.m
//
//  Created by Megan on 12/22/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "AlterUtil.h"
#import "Toast+UIView.h"

static UIAlertView *alterView;

@interface AlterUtil() {
    
}
@end


@implementation AlterUtil

+ (id)shareInstance {
    
    static AlterUtil *instance = nil;
    if(!instance){
        instance = [[AlterUtil alloc]init];
        alterView = [[UIAlertView alloc] init];
    }
    return instance;
}

- (UIWindow*)window {
    UIWindow *window = nil;
    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        window = [[UIApplication sharedApplication].delegate window];
    }
    // For keyboard
    for (UIWindow *seprateWindow in [UIApplication sharedApplication].windows) {
        if (![[seprateWindow class] isEqual:[UIWindow class]]) {
            window = seprateWindow;
            break;
        }
    }
    
    if (window == nil) {
        window = [UIApplication sharedApplication].keyWindow;
    }

    return window;
}

- (void)showToast:(NSString *)message {
    
    [[self window] makeToast:message duration:3 position:@"bottom"];
}

- (void)alterWithTitle:(NSString *)title andMessage:(NSString *)message {
  [[alterView initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}

- (void)alterWithTitle:(NSString *)title andMessage:(NSString *)message andDelegate:(id)delegate andTage:(int)tag {
    
    [self alterWithTitle:title andMessage:message leftButtonText:@"取消" rightButtonText:@"确定" andDelegate:delegate andTage:tag];
    
}

- (void)alterWithTitle:(NSString *)title andMessage:(NSString *)message leftButtonText:(NSString *)leftText rightButtonText:(NSString *)rightText andDelegate:(id)delegate andTage:(int)tag {
    
    __weak __block id<UIAlertViewDelegate> alertDelegate = delegate;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:leftText style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [alertDelegate alertView:nil clickedButtonAtIndex:0];
        }];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:rightText style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alertDelegate alertView:nil clickedButtonAtIndex:1];
        }];
        
        [alertController addAction:cancelButton];
        [alertController addAction:okButton];
        
        [[[self window] rootViewController] presentViewController:alertController animated:YES completion:nil];
        
    } else {
        alterView.tag = tag;
        [[alterView initWithTitle:title message:message delegate:delegate cancelButtonTitle:leftText otherButtonTitles:rightText, nil] show];
    }
    
}

@end
