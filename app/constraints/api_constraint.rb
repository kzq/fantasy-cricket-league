class ApiConstraint 
  attr_reader :version
  
  def initialize(options)
    @version = options.fetch( :version)  
  end
  
  def matches?
    request.headers.fetch(:accept).include?("version=#{version}")
  end
end