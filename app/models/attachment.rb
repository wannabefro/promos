require 'file_size_validator'

class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  validate :within_file_size_limit?
  
  mount_uploader :attachment, AttachmentUploader

  def within_file_size_limit?
    if attachable_type == 0
      @promotion = Promotion.find(attachable_id)
      @current_file_size = @promotion.attachments.map{|a| a.attachment.file.size}.inject(:+) || 0
      if @current_file_size > Promotion::TOTAL_ATTACHMENT_FILE_SIZE.megabytes.to_i
        errors.add(:attachment, "You cannot upload files greater than #{Promotion::TOTAL_ATTACHMENT_FILE_SIZE.to_i}MB")
      end
    end
  end
end
