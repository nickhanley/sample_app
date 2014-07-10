module ModelService
  #
  #
  class Micropost

    def initialize
    end

    def process(micropost)
      dto_to_model(micropost)
    end

    def find_by_id(id)
      Micropost.find(id)
    end

    private

    # Return a micropost model from the data in a DTO
    #
    def dto_to_model(micropost)
      post = Micropost.new
      post.id = micropost.id
      post.user_id = micropost.user_id
      post.content = micropost.content
      post
    end
  end

end
