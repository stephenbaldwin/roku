module Roku
  module Exception
    class Base < StandardError; end
    class NotConfigured < Base; end
    class NotBuilt < Base; end
  end
end
