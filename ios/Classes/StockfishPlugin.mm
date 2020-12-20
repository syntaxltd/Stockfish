#import "StockfishPlugin.h"
#import "ffi.h"

@implementation StockfishPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  if (registrar == NULL) {
    // avoid dead code stripping
    stockfish_init();
  }
}

@end
