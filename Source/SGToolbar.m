//
//  SGTabTopView.m
//  SGTabs
//
//  Created by simon on 07.06.12.
//
//
//  Copyright (c) 2012 Simon Grätzer
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "SGTabsTopView.h"

@implementation SGTabsTopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat shadowRadius = 3.0;
    
    // We don't want to see the shadow anywhere but above the top edge.
    // But the shadow only looks good when we _fill_ a path so we just
    // use a rect whose left/right/bottom aren't visible.
    
    CGFloat bigValue = 1e6;
    
    CGRect r = CGRectMake(-bigValue, shadowRadius - 0.5,
                          self.frame.size.width + bigValue, bigValue);
    
    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeZero, shadowRadius);
    CGContextSetFillColorWithColor(context, [[UIColor alloc] initWithWhite:0.9 alpha:1].CGColor);
    CGContextFillRect(context, r);
    CGContextRestoreGState(context);
}

@end
