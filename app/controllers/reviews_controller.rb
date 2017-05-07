class ReviewsController < ApplicationController
 before_action :ensure_logged_in, only: [:create, :destroy]
    def show
      @review = Review.find(params[:id])
    end

    def create
    @product = Product.find(params[:product_id])
      @review = @product.reviews.build(review_params)
      @review.user = current_user
          if @review.save
            redirect_to products_url, notice: 'Review created successfully'
          else
            render 'products/show'
          end
        end

        def destroy
          @review = Review.find(params[:id])
          @review.destroy
        end

        def edit
          # edit_product_review GET    /products/:product_id/reviews/:id/edit(.:format) reviews#edit
          @review = Review.find(params[:id])
          @product = Product.find(params[:product_id])

        end
        def update
          @review = Review.find(params[:id])
          @product = Product.find(params[:product_id])

          @review.update_attributes(review_params)
          redirect_to product_url(@product)
        end

        private
        def review_params
          params.require(:review).permit(:comment, :product_id)
        end

        def load_product
          @product = Product.find(params[:product_id])
        end
      end
