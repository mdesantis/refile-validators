require 'active_model/validator'
require 'active_support/core_ext/module/delegation'
require 'mime/types'
require 'mini_magick'

module Refile
  module Validators
    class ContentTypeConsistence < ActiveModel::EachValidator
      require 'refile/validators/version'
      require 'refile/validators'

      attr_reader :record, :attribute, :attachment

      delegate :content_type, to: :attacher, prefix: true, allow_nil: true
      delegate :to_io, to: :attachment, prefix: true, allow_nil: true

      def validate_each(record, attribute, attachment)
        @record, @attribute, @attachment = record, attribute, attachment

        add_error :inconsistent_content_type if invalid?
      end

      def add_error(error_type)
        record.errors.add attribute, error_type
      end

      def attacher_method
        "#{attribute}_attacher"
      end

      def attacher
        record.send attacher_method
      end

      def attachment_path
        return nil unless attachment_to_io = attachment_to_io()

        return attachment_to_io.path if attachment_to_io.respond_to?(:path)

        attachment.try(:download).try(:path)
      end

      def valid?
        attacher_content_type = attacher_content_type()
        attachment_path = attachment_path()

        return false unless attacher_content_type && attachment_path

        begin
          info = MiniMagick::Image::Info.new attachment_path
          attacher_content_type == info['mime_type']
        rescue MiniMagick::Error
          false
        end
      end

      def invalid?
        !valid?
      end
    end
  end
end
