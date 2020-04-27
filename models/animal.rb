require_relative('../db/sql_runner')

class Animal

    attr_reader :id
    attr_accessor :name, :date_of_birth, :type, :owner_name, :notes

    def initialize(options)
        @id = options['id'].to_i if options [:id]
        @name = options['name']
        @date_of_birth = options['date_of_birth']
        @type = options['type']
        @owner_name = options['owner_name']
        @notes = options['notes']
    end

    def save()
        sql = "INSERT INTO animals
        (name, date_of_birth, type, owner_name, notes)
        VALUES
        ($1, $2, $3, $4, $5)
        RETURNING *"
        values = [@name, @date_of_birth, @type, @owner_name, @notes]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    def update()
        sql = "UPDATE animals SET
        (name, date_of_birth, type, owner_name, notes)
        =
        ($1, $2, $3, $4, $5)
        WHERE id = $6"
        values = [@name, @date_of_birth, @type, @owner_name, @notes, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM animals
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM animals"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM animals"
        animals = SqlRunner.run(sql)
        results = map_items(animals)
        return results
    end

    def self.find(id)
        sql = "SELECT * FROM animals
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        animal = Vet.new(result)
        return animal
    end
    
    def self.map_items(animals)
        return animals.map { |animal| Vet.new(animal)}
    end

   

end