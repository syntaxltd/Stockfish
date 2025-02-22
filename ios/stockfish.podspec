#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint stockfish.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'stockfish'
  s.version          = '0.0.1'
  s.summary          = 'The Stockfish Chess Engine for Flutter.'
  s.description      = <<-DESC
The Stockfish Chess Engine for Flutter.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*', 'FlutterStockfish/*', 'Stockfish/src/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  # Additional compiler configuration required for Stockfish
  s.library = 'c++'
  s.script_phase = {
    :execution_position => :before_compile,
    :name => 'Download nnue',
    :script => "[ -e 'nn-3475407dc199.nnue' ] || curl --location --remote-name 'https://tests.stockfishchess.org/api/nn/nn-3475407dc199.nnue'"
  }
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'OTHER_CPLUSPLUSFLAGS' => '$(inherited) -w'
  }
end
