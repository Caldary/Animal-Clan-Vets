require_relative('../db/sql_runner')

class Vet

    attr_reader :id
    attr_accessor :name, :age, :qualifications, :registered_animals

    def initialize(options)
        @id = options['id'].to_i if options[:id]
        @name = options['name']
        @age = options['age'].to_i
        @qualifications = options['qualifications']
        @registered_animals = options['registered_animals'].to_i
    end

    def save()
        sql = "INSERT INTO vets
        (name, age, qualifications, registered_animals)
        VALUES
        ($1, $2, $3, $4)
        RETURNING *"
        values = [@name, @age, @qualifications, @registered_animals]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end
    
end

