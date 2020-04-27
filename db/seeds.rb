require('pry')
require_relative('../models/animal')
require_relative('../models/vet')


Animal.delete_all()
Vet.delete_all()

vet1 = Vet.new({'name' => 'Sara Smith', 'age' => 35, 'qualifications' => 'Doctor of Veterinary Medicine', 'registered_animals' => 0})
vet2 = Vet.new({'name' => 'Tim Spence', 'age' => 31, 'qualifications' => 'Doctor of Veterinary Medicine', 'registered_animals' => 0})
vet3 = Vet.new({'name' => 'Steven Strange', 'age' => 43, 'qualifications' => 'Doctor of Veterinary Medicine', 'registered_animals' => 0})
vet4 = Vet.new({'name' => 'Hanibal Lector', 'age' => 60, 'qualifications' => 'Doctor of Veterinary Medicine', 'registered_animals' => 0})
vet1.save()
vet2.save()
vet3.save()
vet4.save()

animal1 = Animal.new({'name' => 'Eric', 'date_of_birth' => '2016', 'type' => 'dog', 'owner_name' => 'Paulo', 'notes' => 'Goodest boy', 'vet_id' => vet1.id})
animal2 = Animal.new({'name' => 'Tom', 'date_of_birth' => '2013', 'type' => 'cat', 'owner_name' => 'MGM', 'notes' => 'Evil cat', 'vet_id' => vet2.id})
animal3 = Animal.new({'name' => 'Jerry', 'date_of_birth' => '2015', 'type' => 'mouse', 'owner_name' => 'Warner Bros', 'notes' => 'Naughty mouse', 'vet_id' => vet3.id})
animal4 = Animal.new({'name' => 'Donald', 'date_of_birth' => '2019', 'type' => 'duck', 'owner_name' => 'Disney', 'notes' => 'He can talk', 'vet_id' => vet4.id})
animal5 = Animal.new({'name' => 'Liger', 'date_of_birth' => '2019', 'type' => 'tiger', 'owner_name' => 'Joe Exotic', 'notes' => 'tiger saw man', 'vet_id' => vet1.id})
animal1.save()
animal2.save()
animal3.save()
animal4.save()
animal5.save()







binding.pry
nil