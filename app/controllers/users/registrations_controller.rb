# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  include RackSession
  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource_name, resource)
    if resource.valid?
      render json: resource, status: :ok
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end
end
