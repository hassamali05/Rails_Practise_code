class ArticlesController < ApplicationController

	before_action :commonAll, only: [:show,:update,:destroy,:edit]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		
		#render plain: params[:article].inspect
		#render plain: User.last.id.inspect
		@article = Article.new(params_control)
		@article.user = User.last
		if(@article.save)		
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(params_control)
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private 
	def params_control
		params.require(:article).permit(:name,:authors,:description)
	end

	def commonAll
		@article = Article.find(params[:id])
	end

end