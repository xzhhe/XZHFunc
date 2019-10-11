Pod::Spec.new do |s|
  s.name             = 'XZHFuncPlace'
  s.version          = '1.0.0'
  s.summary          = 'A short description of XZHFuncPlace.'
  s.description      = <<-DESC
                        🚗 🚕 🚙 this is a very simple LLVM Pass 🚗 🚕 🚙
                       DESC

  s.homepage         = 'https://github.com/xzhhe/XZHFuncPlace'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiongzenghui' => 'zxcvb1234001@163.com' }
  s.source           = { :git => 'https://github.com/xzhhe/XZHFuncPlace.git' }
  s.requires_arc = true

  ############################################ 核心部分 ################################################

  # 1. 源文件
  s.source_files  = "src/*"
  
  # 2. 需要保留的文件路径
  # https://guides.cocoapods.org/syntax/podspec.html#preserve_paths
  s.preserve_paths = "clang/bin/clang", "clang/lib/MyPlacementPass.dylib", "clang/lib/clang/8.0.1/include/*"

  # 3. 修改 xcode 工程配置文件
  s.xcconfig = {
    "OTHER_CFLAGS" => "-Xclang -load -Xclang ${PODS_ROOT}/XZHFuncPlace/clang/lib/MyPlacementPass.dylib", 
    "COMPILER_INDEX_STORE_ENABLE" => "No",
    "CC" => "${PODS_ROOT}/XZHFuncPlace/clang/bin/clang"
  }
end
