require 'rails_helper'

RSpec.describe RecipsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/recips').to route_to('recips#index')
    end

    it 'routes to #new' do
      expect(get: '/recips/new').to route_to('recips#new')
    end

    it 'routes to #show' do
      expect(get: '/recips/1').to route_to('recips#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/recips/1/edit').to route_to('recips#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/recips').to route_to('recips#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/recips/1').to route_to('recips#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/recips/1').to route_to('recips#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/recips/1').to route_to('recips#destroy', id: '1')
    end
  end
end
