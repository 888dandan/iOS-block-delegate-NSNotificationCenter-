//
//  AViewController.h
//  iOS 逆向传值
//
//  Created by 曹轩 on 2018/4/15.
//  Copyright © 2018年 曹轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  cxMydelegate <NSObject>

-(void)changeSouceType:(NSString*)type;

@end
@interface AViewController : UIViewController

@end
