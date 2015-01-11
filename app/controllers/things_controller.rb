class ThingsController < ApplicationController

def index
	@things = Thing.all

	respond_to do |f|
		f.json { render json: @things }
		f.xml { render xml: @things }
	end
end

def show
	@thing = Thing.find(params[:id])
end

def create
	@thing = Thing.new(thing_params)

	if @thing.save
		render json: @thing, status: created, location: @thing
	else
		render json: @thing.errors, status: :unprocessable_entity
	end
end

def destroy

end

def update

end

private

def thing_params
	params.require(:thing).permit(:name, :content)
end

end