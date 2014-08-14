class CodeGenerator

  def initialize(kind, quantity, promotion)
    @kind = kind
    @quantity = quantity.to_i
    @promotion = promotion
  end

  def generate
    case @kind
    when 'unique'
      generate_unique_codes
    when 'single'
      generate_single_code
    end
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
