class User < ApplicationRecord
    has_one :comment
    has_one :rating
end
