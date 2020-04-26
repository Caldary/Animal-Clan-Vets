require('pry')
require_relative('models/animal')
require_relative('models/vet')

vet1 = Vet.new({'name' => 'Sara Smith', 'age' => 35, 'qualifications' => 'Doctor of Veterinary Medicine', 'registered_animals' => 0})
vet1.save()









binding.pry
nil
