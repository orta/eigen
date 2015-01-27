#import "ARPostFeedItemLinkView.h"
#import "ARPostFeedItem.h"
#import "ARAspectRatioImageView.h"
#import <ORStackView/ORSplitStackView.h>

@implementation ARPostFeedItemLinkView

- (instancetype)initWithPostFeedItem:(ARPostFeedItem *)postFeedItem withSeparator:(BOOL)withSeparator
{
    self = [super init];
    if (!self) { return nil; };

    [self addTarget:nil action:@selector(tappedPostFeedItemLinkView:) forControlEvents:UIControlEventTouchUpInside];

    ARSeparatorView *separatorView = [[ARSeparatorView alloc] init];
    [self addSubview:separatorView];

    ARAspectRatioImageView *imageView = [[ARAspectRatioImageView alloc] init];
    [self addSubview:imageView];

    ORSplitStackView *stack = [[ORSplitStackView alloc] initWithLeftPredicate:@"120" rightPredicate:nil];
    [self addSubview:stack];
    [self alignToView:stack];

    stack.userInteractionEnabled = NO;

    UILabel *postTitleLabel = [ARThemedFactory labelForFeedItemHeaders];
    postTitleLabel.font = [postTitleLabel.font fontWithSize:20];
    [postTitleLabel setText:[postFeedItem title] withLineHeight:1.5];
    postTitleLabel.preferredMaxLayoutWidth = 180;
    postTitleLabel.numberOfLines = 0;
    [stack.rightStack addSubview:postTitleLabel withTopMargin:@"20" sideMargin:@"20"];
    [stack.leftStack addSubview:imageView withTopMargin:@"20" sideMargin:@"20"];
    [stack.leftStack setBottomMarginHeight:20];
    [stack.rightStack setBottomMarginHeight:20];

    [separatorView alignTop:nil leading:@"10" bottom:@"0" trailing:@"-10" toView:self];

    if (postFeedItem.profile.profileName) {
        UILabel *postAuthorLabel = [ARThemedFactory labelForLinkItemSubtitles];
        postAuthorLabel.text = [postFeedItem.profile.profileName uppercaseString];
        [stack.rightStack addSubview:postAuthorLabel withTopMargin:@"5" sideMargin:@"20"];
    }

    _targetPath = NSStringWithFormat(@"/post/%@", postFeedItem.postID);

    // Layout the view to calculate bounds and frame for the image view before adding the image.
    NSURL *imageUrl = [NSURL URLWithString:postFeedItem.imageURL];
    [imageView ar_setImageWithURL:imageUrl completed:(SDWebImageCompletionBlock)^{
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }];

    return self;
}

@end
