class ApplicationController < ActionController::Base
	protect_from_forgery

	private

  # redirecionando  para as compras
  def after_sign_out_path_for(resource_or_scope)
  	root_path
  end

  def after_sign_in_path_for(resource)
  	compras_path
  end
end
