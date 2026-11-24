# frozen_string_literal: true

require 'carrierwave/mongoid'

module CustomFields
  module Extensions
    # A localized file field keeps one file per locale in the same column.
    # Carrierwave only knows the current locale, so after uploading a file in
    # one locale it would delete the files of the other locales. Keep every
    # file still referenced by any locale.
    module LocalizedMounter
      def remove_previous
        name = serialization_column.to_s
        if record.class.fields[name]&.localized?
          in_use = (record.attributes[name] || {}).values
          @removed_uploaders.reject! { |uploader| in_use.include?(uploader.identifier) }
        end
        super
      end
    end
  end
end

CarrierWave::Mounter.prepend(CustomFields::Extensions::LocalizedMounter)
