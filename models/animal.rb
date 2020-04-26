require_relative('../db/sql_runner')

class Animal

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @date_of_birth = options['date_of_birth']
        @type = options['type']
        @owner_name = options['owner_name']
        @notes = options['notes']
    end

   

end