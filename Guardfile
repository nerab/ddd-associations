guard 'bundler' do
  watch('Gemfile')
end

guard 'minitest' do
  watch(%r|^test/test_(.*)\.rb|)
  watch(%r{^lib/(.*/)?([^/]+)\.rb$}){|m| "test/#{m[1]}test_#{m[2]}.rb"}
  watch(%r|^test/helper\.rb|){'test'}
end
