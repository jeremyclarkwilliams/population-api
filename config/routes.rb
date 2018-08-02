PopulationApi::Application.routes.draw do

    root to: 'population#get_csv'

    get 'population/index'
    get 'population/get_csv'
    get 'population/get_pop'

    get 'zips/index'
    get 'zips/import' => 'zips#my_import'

    get 'cbsas/index'
    get 'cbsas/import' => 'cbsas#my_import'

    resources :zips do
        collection {post :import}
    end

    resources :cbsas do
        collection {post :import}
    end

    # Api definition
    # namespace :api, defaults: { format: :json },
    #                 path: '/api/'  do
    #     resources :zip
    # end

end
