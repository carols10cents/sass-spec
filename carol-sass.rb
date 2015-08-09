if __FILE__ == $0
  spec_type = ARGV[0]
  up_to_number = ARGV[1].to_i
  available_specs = Dir.entries(File.join('spec', spec_type))

  (0..up_to_number).each do |n|
    current_spec = available_specs.detect { |s| s.match(/\A#{ n < 10 ? "0" : "" }#{n}_/) }
    if current_spec
      spec_dir = File.join('spec', spec_type, current_spec)
      result = `ruby sass-spec.rb -c '~/rust/sassers/target/debug/sassers' #{spec_dir}`
      puts result
    end
  end
end
