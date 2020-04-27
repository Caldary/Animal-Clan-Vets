require('pry')
require_relative('../models/animal')
require_relative('../models/vet')


Animal.delete_all()
Vet.delete_all()

vet1 = Vet.new({'name' => 'Sara Smith', 'age' => 35, 'qualifications' => 'Doctor of Veterinary Medicine', 'registered_animals' => 0})
vet1.save()

animal1 = Animal.new({'name' => 'Eric', 'date_of_birth' => '2016', 'type' => 'dog', 'owner_name' => 'Paulo', 'notes' => 'Goodest boy', 'vet_id' => vet1.id})
animal1.save()







binding.pry
nil