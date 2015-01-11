module Api
	module V1

class ThingsController < ApplicationController
	#http_basic_authenticate_with name: "admin", password: "secret"
	before_filter :restrict_access
	respond_to :json

	def index
		respond_with Thing.all
	end 

	def show
		respond_with Thing.find(params[:id])
	end

	def create
		respond_with Thing.create(params[:thing])
	end

	def update
		respond_with Thing.update(params[:id], params[:thing])
	end

	def destroy
		respond_with Thing.destroy(params[:id])
	end

	private

	# def restrict_access
	# 	api_key = ApiKey.find_by_access_token(params[:access_token])
	# 	head :unauthorized unless api_key
	# end

	def restrict_access
		authenticate_or_request_with_http_token do |token, option|
			ApiKey.exists?(access_token: token)
		end
	end

end # class




	end # V1
end # Api