class CodeGenerator
  include ActiveModel::Validations

  validates :quantity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  
  def initialize(kind, quantity, promotion)
    @kind = kind
    @quantity = quantity.to_i
    @promotion = promotion
    raise self.errors if !self.valid?
  end

  def generate
    case @kind
    when 'unique'
      generate_unique_codes
    when 'single'
      generate_single_code
    else
      raise 'Not a valid kind of code'
    end
  end

  def read_attribute_for_validation(name)
    self.instance_variable_get("@#{name.to_s}")
  end

  private

  def generate_unique_codes
    @quantity.times do
      Code.create!(promotion: @promotion, status: 'active')
    end
  end

  def generate_single_code
    Code.create!(promotion: @promotion, status: 'active', quantity: @quantity)
  end
end
