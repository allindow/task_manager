class Task
  attr_reader :title, :description, :id

  def initialize(data)
    @id = data["id"]
    @title = data["title"]
    @description = data["description"]
  end

  def title_check
    title == "" ? "Mystery Task" : title
  end

end
