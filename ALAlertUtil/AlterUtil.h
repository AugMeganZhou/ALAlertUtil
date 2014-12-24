//
//  AlterUtil.h
//
//  Created by Megan on 12/22/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>


#define ECShowToast(message) [[AlterUtil shareInstance] showToast:message]
#define ECAlterWarningMesageSimple(title, message) [[AlterUtil shareInstance] alterWithTitle:title andMessage:message]
#define ECAlterWarningMessage(title, message, delegate, tag) [[AlterUtil shareInstance] alterWithTitle:title andMessage:message andDelegate:delegate andTage:tag];

#define ECAlterWarningMessageStandard(title, message, leftText, rightText, delegate, tag) [[AlterUtil shareInstance] alterWithTitle:title andMessage:message leftButtonText:leftText rightButtonText:rightText andDelegate:delegate andTage:tag];

@interface AlterUtil : NSObject

+ (id)shareInstance;

- (void)showToast:(NSString *)message;

- (void)alterWithTitle:(NSString *)title
            andMessage:(NSString *)message;

- (void)alterWithTitle:(NSString *)title
            andMessage:(NSString *)message
           andDelegate:(id)delegate
               andTage:(int )tag;

- (void)alterWithTitle:(NSString *)title
            andMessage:(NSString *)message
        leftButtonText:(NSString *)leftText
       rightButtonText:(NSString *)rightText
           andDelegate:(id)delegate andTage:(int )tag;

@end
