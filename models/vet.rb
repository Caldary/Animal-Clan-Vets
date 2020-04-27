require_relative('../db/sql_runner')
require_relative('animal')

class Vet

    attr_reader :id
    attr_accessor :name, :age, :qualifications

    def initialize(options)
        @id = options['id'].to_i if options[:id]
        @name = options['name']
        @age = options['age'].to_i
        @qualifications = options['qualifications']
    end

    def save()
        sql = "INSERT INTO vets
        (name, age, qualifications)
        VALUES
        ($1, $2, $3)
        RETURNING *"
        values = [@name, @age, @qualifications]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    def update()
        sql = "UPDATE vets SET
        (name, age, qualifications)
        =
        ($1, $2, $3)
        WHERE id = $4"
        values = [@name, @age, @qualifications, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM vets
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM vets"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM vets"
        vets = SqlRunner.run(sql)
        results = map_items(vets)
        return results
    end

    def self.find(id)
        sql = "SELECT * FROM vets
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        vet = Vet.new(result)
        return vet
    end
    
    def self.map_items(vets)
        return vets.map { |vet| Vet.new(vet)}
    end
end

