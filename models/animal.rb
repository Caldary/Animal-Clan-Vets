require_relative('../db/sql_runner')
require_relative('vet')

class Animal

    attr_reader :id
    attr_accessor :name, :date_of_birth, :type, :owner_name, :notes, :vet_id

    def initialize(options)
        @id = options['id'].to_i if options [:id]
        @name = options['name']
        @date_of_birth = options['date_of_birth']
        @type = options['type']
        @owner_name = options['owner_name']
        @notes = options['notes']
        @vet_id = options['vet_id'].to_i
    end

    def save()
        sql = "INSERT INTO animals
        (name, date_of_birth, type, owner_name, notes, vet_id)
        VALUES
        ($1, $2, $3, $4, $5, $6)
        RETURNING *"
        values = [@name, @date_of_birth, @type, @owner_name, @notes, @vet_id]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    def update()
        sql = "UPDATE animals SET
        (name, date_of_birth, type, owner_name, notes, vet_id)
        =
        ($1, $2, $3, $4, $5, $6)
        WHERE id = $7"
        values = [@name, @date_of_birth, @type, @owner_name, @notes, @vet_id, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM animals
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def vet()
        sql = "SELECT * FROM vets WHERE id = $1"
        values = [@vet_id]
        result = SqlRunner.run(sql, values)
        animal = Animal.map_items(result)
        return animal
    end

    def self.delete_all()
        sql = "DELETE FROM animals"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM animals"
        animals = SqlRunner.run(sql)
        results = animals.map { |animal| Animal.new(animal)}
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