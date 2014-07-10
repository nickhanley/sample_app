module DTOService
  #
  #
  class Micropost
    def initialize
    end

    def process(micropost)
      model_to_dto(micropost)
    end

    private

    # return a dto from the supplied Micropost Model data
    #
    def model_to_dto(micropost)
      dto = DTO::Micropost.new
      dto.id = micropost.id
      dto.user_id = micropost.user_id
      dto.content = micropost.content
      dto
    end
  end

end
