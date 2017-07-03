{ Parsed from Coredata }

{$mode delphi}
{$modeswitch objectivec1}
{$modeswitch cvar}

unit AnonClassDefinitionsCoredata;

interface

type
  Protocol = objcclass external;
  NSAffineTransform = objcclass external;
  NSData = objcclass external;
  NSAppleEventDescriptor = objcclass external;
  NSAppleEventManager = objcclass external;
  NSDictionary = objcclass external;
  NSString = objcclass external;
  NSURL = objcclass external;
  NSAppleScript = objcclass external;
  NSMutableData = objcclass external;
  NSMutableDictionary = objcclass external;
  NSMutableArray = objcclass external;
  NSArchiver = objcclass external;
  NSUnarchiver = objcclass external;
  NSIndexSet = objcclass external;
  NSArray = objcclass external;
  NSAttributedString = objcclass external;
  NSMutableAttributedString = objcclass external;
  NSAutoreleasePool = objcclass external;
  NSError = objcclass external;
  NSBundle = objcclass external;
  NSCache = objcclass external;
  NSDateComponents = objcclass external;
  NSLocale = objcclass external;
  NSTimeZone = objcclass external;
  NSCalendar = objcclass external;
  NSCalendarDate = objcclass external;
  NSCharacterSet = objcclass external;
  NSMutableCharacterSet = objcclass external;
  NSClassDescription = objcclass external;
  NSCoder = objcclass external;
  NSPredicateOperator = objcclass external;
  NSExpression = objcclass external;
  NSComparisonPredicate = objcclass external;
  NSCompoundPredicate = objcclass external;
  NSDistantObject = objcclass external;
  NSException = objcclass external;
  NSPort = objcclass external;
  NSRunLoop = objcclass external;
  NSPortNameServer = objcclass external;
  NSDistantObjectRequest = objcclass external;
  NSConnection = objcclass external;
  NSPurgeableData = objcclass external;
  NSDate = objcclass external;
  NSDateFormatter = objcclass external;
  NSDecimalNumber = objcclass external;
  NSDecimalNumberHandler = objcclass external;
  NSSet = objcclass external;
  NSDistributedLock = objcclass external;
  NSDistributedNotificationCenter = objcclass external;
  NSEnumerator = objcclass external;
  NSAssertionHandler = objcclass external;
  NSPredicate = objcclass external;
  NSFileHandle = objcclass external;
  NSPipe = objcclass external;
  NSDirectoryEnumerator = objcclass external;
  NSNumber = objcclass external;
  NSFileManager = objcclass external;
  NSFormatter = objcclass external;
  NSGarbageCollector = objcclass external;
  NSHashTable = objcclass external;
  NSHost = objcclass external;
  NSHTTPCookieInternal = objcclass external;
  NSHTTPCookie = objcclass external;
  NSHTTPCookieStorageInternal = objcclass external;
  NSHTTPCookieStorage = objcclass external;
  NSIndexPath = objcclass external;
  NSMutableIndexSet = objcclass external;
  NSMethodSignature = objcclass external;
  NSInvocation = objcclass external;
  NSKeyedArchiver = objcclass external;
  NSKeyedUnarchiver = objcclass external;
  NSLock = objcclass external;
  NSConditionLock = objcclass external;
  NSRecursiveLock = objcclass external;
  NSCondition = objcclass external;
  NSMapTable = objcclass external;
  NSMetadataItem = objcclass external;
  NSMetadataQueryAttributeValueTuple = objcclass external;
  NSMetadataQueryResultGroup = objcclass external;
  NSMetadataQuery = objcclass external;
  NSInputStream = objcclass external;
  NSOutputStream = objcclass external;
  NSNetService = objcclass external;
  NSNetServiceBrowser = objcclass external;
  NSOperationQueue = objcclass external;
  NSNotification = objcclass external;
  NSNotificationCenter = objcclass external;
  NSNotificationQueue = objcclass external;
  NSNull = objcclass external;
  NSNumberFormatter = objcclass external;
  NSObject = objcclass external;
  NSScriptObjectSpecifier = objcclass external;
  NSOperation = objcclass external;
  NSBlockOperation = objcclass external;
  NSInvocationOperation = objcclass external;
  NSOrthography = objcclass external;
  NSPointerArray = objcclass external;
  NSPointerFunctions = objcclass external;
  NSPortMessage = objcclass external;
  NSMachPort = objcclass external;
  NSMessagePort = objcclass external;
  NSSocketPort = objcclass external;
  NSPortCoder = objcclass external;
  NSMachBootstrapServer = objcclass external;
  NSMessagePortNameServer = objcclass external;
  NSSocketPortNameServer = objcclass external;
  NSProcessInfo = objcclass external;
  NSPropertyListSerialization = objcclass external;
  NSProtocolChecker = objcclass external;
  NSProxy = objcclass external;
  NSTimer = objcclass external;
  NSScanner = objcclass external;
  NSScriptCommandDescription = objcclass external;
  NSScriptClassDescription = objcclass external;
  NSScriptCoercionHandler = objcclass external;
  NSScriptCommand = objcclass external;
  NSScriptExecutionContext = objcclass external;
  NSScriptWhoseTest = objcclass external;
  NSIndexSpecifier = objcclass external;
  NSMiddleSpecifier = objcclass external;
  NSNameSpecifier = objcclass external;
  NSPositionalSpecifier = objcclass external;
  NSPropertySpecifier = objcclass external;
  NSRandomSpecifier = objcclass external;
  NSRangeSpecifier = objcclass external;
  NSRelativeSpecifier = objcclass external;
  NSUniqueIDSpecifier = objcclass external;
  NSWhoseSpecifier = objcclass external;
  NSCloneCommand = objcclass external;
  NSCloseCommand = objcclass external;
  NSCountCommand = objcclass external;
  NSCreateCommand = objcclass external;
  NSDeleteCommand = objcclass external;
  NSExistsCommand = objcclass external;
  NSGetCommand = objcclass external;
  NSMoveCommand = objcclass external;
  NSQuitCommand = objcclass external;
  NSSetCommand = objcclass external;
  NSMutableSet = objcclass external;
  NSScriptSuiteRegistry = objcclass external;
  NSLogicalTest = objcclass external;
  NSSpecifierTest = objcclass external;
  NSCountedSet = objcclass external;
  NSSortDescriptor = objcclass external;
  NSSpellServer = objcclass external;
  NSStream = objcclass external;
  NSMutableString = objcclass external;
  NSSimpleCString = objcclass external;
  NSConstantString = objcclass external;
  NSTask = objcclass external;
  NSTextCheckingResult = objcclass external;
  NSThread = objcclass external;
  NSUndoManager = objcclass external;
  NSURLAuthenticationChallenge = objcclass external;
  NSURLCredential = objcclass external;
  NSURLProtectionSpace = objcclass external;
  NSURLResponse = objcclass external;
  NSURLAuthenticationChallengeInternal = objcclass external;
  NSCachedURLResponseInternal = objcclass external;
  NSURLRequest = objcclass external;
  NSCachedURLResponse = objcclass external;
  NSURLCacheInternal = objcclass external;
  NSURLCache = objcclass external;
  NSURLConnectionInternal = objcclass external;
  NSURLConnection = objcclass external;
  NSURLCredentialInternal = objcclass external;
  NSURLCredentialStorageInternal = objcclass external;
  NSURLCredentialStorage = objcclass external;
  NSURLDownloadInternal = objcclass external;
  NSURLDownload = objcclass external;
  NSURLHandle = objcclass external;
  NSURLProtectionSpaceInternal = objcclass external;
  NSMutableURLRequest = objcclass external;
  NSURLProtocol = objcclass external;
  NSURLProtocolInternal = objcclass external;
  NSURLRequestInternal = objcclass external;
  NSURLResponseInternal = objcclass external;
  NSHTTPURLResponseInternal = objcclass external;
  NSHTTPURLResponse = objcclass external;
  NSUserDefaults = objcclass external;
  NSValue = objcclass external;
  NSValueTransformer = objcclass external;
  NSXMLDTD = objcclass external;
  NSXMLDocument = objcclass external;
  NSXMLDTDNode = objcclass external;
  NSXMLElement = objcclass external;
  NSXMLNode = objcclass external;
  NSXMLParser = objcclass external;
  NSAtomicStore = objcclass external;
  NSAtomicStoreCacheNode = objcclass external;
  NSEntityDescription = objcclass external;
  NSAttributeDescription = objcclass external;
  NSManagedObjectModel = objcclass external;
  NSManagedObjectContext = objcclass external;
  NSManagedObject = objcclass external;
  NSEntityMapping = objcclass external;
  NSMigrationManager = objcclass external;
  NSEntityMigrationPolicy = objcclass external;
  NSExpressionDescription = objcclass external;
  NSFetchRequest = objcclass external;
  NSFetchedPropertyDescription = objcclass external;
  NSFetchRequestExpression = objcclass external;
  NSManagedObjectID = objcclass external;
  NSPersistentStore = objcclass external;
  NSPersistentStoreCoordinator = objcclass external;
  NSMappingModel = objcclass external;
  NSMigrationContext = objcclass external;
  NSPropertyDescription = objcclass external;
  NSPropertyMapping = objcclass external;
  NSRelationshipDescription = objcclass external;

implementation

end.
