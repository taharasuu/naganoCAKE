Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get 'about' => 'public/homes#about', as: 'about'
  get 'customers/my_page' => 'public/customers#show', as: 'my_page'
   delete 'cart_items' =>'public/cart_items#destroy_all'
  get 'admin' => 'admin/homes#top'

  namespace :public do
    resources :items, only: [:show, :index] do
    end
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdrow' => 'customers#withdrow'
    resources :customers, only: [:show, :edit, :update] do
    end
    resources :cart_items, only: [:create, :index, :update, :destroy] do
    end
    get 'orders/confirm' => 'orders#confirm'
    post 'orders/check' => 'orders#check'
    resources :orders, only: [:new, :create, :index, :show] do
    end
    resources :addresses, only: [:index, :edit,  :create, :update, :destroy] do
    end
    resources :homes, only: [:top, :about] do
    end

  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    end
    resources :genres, only: [:index, :create, :edit, :update] do
    end
    resources :customers, only: [:index, :show, :edit, :update] do
    end
    resources :orders, only: [:show, :update] do
    end
    resources :order_details, only: [:update] do
    end
  end
end
