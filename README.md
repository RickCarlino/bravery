# Bravery

## A statemachine micro library for ruby.

... does anyone know where I can find one of those 'under construction' GIFs from the 90's?

## Example

```ruby

class Car
  include Bravery

  # Setting the default state.
  define_start_state :neutral do
    # Define the behavior when entering the state in this block.
    if self.key_in? && self.brake_applied?
      #Transition to a specified state. The block defined for the specified
      # state is immediately invoked.
      goto_state :idling
    else
      # Unlike goto_state, set_state does not call the state's block.
      # self.state will return :parked, but no further action occurs.
      set_state :parked 
    end
  end

  define_state :idling do
    'chug chug chug'
  end

  define_state :parked do
    '....'
  end
end

# New instances will have a default start state (if you specify one with
# define_start_state() )
herby = Car.new
herby.state
# => :neutral

# Instances have dynamic methods corresponding to a states name. 
# You probably never want to do this because it will override state tracking,
# but it's there if you ever need it.
herby.idling
# => 'chug chug chug'
```

## Testing

This has been tested on ruby versions:

* 1.9.3
* 2.0.0 


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/rickcarlino/bravery/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

