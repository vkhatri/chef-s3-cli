if defined?(ChefSpec)
  ChefSpec.define_matcher(:s3_install)
  ChefSpec.define_matcher(:s3_cp)

  def install_s3_install(install)
    ChefSpec::Matchers::ResourceMatcher.new(:s3_install, :install, install)
  end

  def uninstall_s3_install(uninstall)
    ChefSpec::Matchers::ResourceMatcher.new(:s3_install, :uninstall, uninstall)
  end

  def cp_s3_cp(cop)
    ChefSpec::Matchers::ResourceMatcher.new(:s3_cp, :cp, cop)
  end
end
