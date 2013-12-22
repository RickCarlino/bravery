class Subject
  include Bravery

  attr_accessor :value

  def initialize
    @value = 'Not Yet Set.'
  end

  define_start_state :first do
    @value= '1'
  end

  define_state :second do
    @value = '2'
    goto_state :third
  end

  define_state :third do
    @value = '3'
  end
end
