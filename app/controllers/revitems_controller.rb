class RevitemsController < ApplicationController
    def index
        @revitem = Revitem.all
    end

    def show
        @revitem = Revitem.all
    end
    def new
        @revitem = Revitem.new
    end
end
