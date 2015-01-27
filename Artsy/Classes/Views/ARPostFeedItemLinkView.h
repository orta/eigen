@class ARPostFeedItem;

@interface ARPostFeedItemLinkView : UIButton

- (instancetype)initWithPostFeedItem:(ARPostFeedItem *)postFeedItem withSeparator:(BOOL)withSeparator;

@property(nonatomic, strong, readonly) NSString *targetPath;

@end
