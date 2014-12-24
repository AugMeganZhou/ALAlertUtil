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

- (void)showToast:(NSString *)message {
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
    
    [window makeToast:message duration:3 position:@"bottom"];
}

- (void)alterWithTitle:(NSString *)title andMessage:(NSString *)message {
  [[alterView initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:LocalizedString(@"Commen.OK"), nil] show];
}

- (void)alterWithTitle:(NSString *)title andMessage:(NSString *)message andDelegate:(id)delegate andTage:(int)tag {
    alterView.tag = tag;
    [[alterView initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
}

- (void)alterWithTitle:(NSString *)title andMessage:(NSString *)message leftButtonText:(NSString *)leftText rightButtonText:(NSString *)rightText andDelegate:(id)delegate andTage:(int)tag {
    alterView.tag = tag;
    [[alterView initWithTitle:title message:message delegate:delegate cancelButtonTitle:leftText otherButtonTitles:rightText, nil] show];
}

@end
