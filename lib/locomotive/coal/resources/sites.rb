module Locomotive::Coal
  module Resources

    class Sites < Struct.new(:uri, :credentials)

      include Locomotive::Coal::Request

      def all
        get('sites').map do |attributes|
          Resource.new(attributes)
        end
      end

      def by_subdomain(subdomain)
        all.find { |site| site.subdomain == subdomain.to_s }
      end

      def create(attributes = {})
        data = post('sites', { site: attributes })
        Resource.new(data)
      end

      def update(id, attributes = {})
        data = update("sites/#{id}", { site: attributes })
        Resource.new(data)
      end

      def destroy(id)
        data = delete("sites/#{id}")
        Resource.new(data)
      end

    end

  end
end
