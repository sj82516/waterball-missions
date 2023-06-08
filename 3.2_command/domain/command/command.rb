
class Command
  def execute
    raise NotImplementedError
  end

  def undo
    raise NotImplementedError
  end
end
