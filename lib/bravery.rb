module Bravery
  module ClassMethods

    def define_state(state_name, &callback)
      states << state_name
      define_method state_name, callback
    end

    def define_start_state(state_name, &callback)
      state_name = state_name.to_sym
      @start_state = state_name
      define_state(state_name, &callback)
    end

    def states
      @states ||= []
    end

    def start_state
      @start_state
    end
  end

  module InstanceMethods

    def states
      self.class.states
    end

    def goto_state(state_name)
      state_name = state_name.to_sym
      set_state  state_name
      self.send state_name
    end

    def state
      if @state
        @state
      else
        @state || self.class.start_state
      end
    end

    def set_state(state_name)
      @state = state_name.to_sym
    end
  end
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
