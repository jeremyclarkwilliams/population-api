PopulationApi::Application.routes.draw do

    # Api definition
    namespace :api, defaults: { format: :json },
                    path: '/api/'  do
      # We are going to list our resources here
    end

end
