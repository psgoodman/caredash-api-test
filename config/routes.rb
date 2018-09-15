Rails.application.routes.draw do
    resources :doctors, only: [
        :index, :show, :create, :update, :destroy
    ] do
        resources :reviews, only: [
            :index, :show, :create, :update, :destroy
    ]
    end
end
