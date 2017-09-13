module ControllerHelpers

  def example
    self.class
  end

  def description
    example.metadata[:parent_example_group][:description_args].first
  end

  def method
    example.metadata[:method]
  end

  def action
    example.metadata[:action]
  end

  def perform_request(extra_params = {})
    message = <<-STR
      the method or action has not been provided for #{description} example
    STR
    raise message unless method && action

    params_tmp = {}
    params_tmp.merge!(default_params) if respond_to?(:default_params)
    params_tmp.merge!(extra_params)
    send(method, action, params: params_tmp)
  end

end

RSpec.configure do |config|

  # Métodos helper para los controladores
  config.include ControllerHelpers, type: :controller

  config.before(:each, type: :controller, role: :api) do
    request.env['CONTENT_TYPE'] = 'application/json'
    request.env['ACCEPT']       = 'application/json'
  end

end
