// class Person {
//   String name;
//   int birthYear;
  
//   int get age => (DateTime.now().year - birthYear);
//   set age(int val) => birthYear = (DateTime.now().year - val);

//   Person(this.name, this.birthYear);
  
//   factory Person.checkWork(String name, int birthYear, String profession, int experience){
//     if (profession  != 'Unemployed'){
//       return Worker(name, birthYear, profession, experience);
//     } else{
//       assert(experience == 0, '!!!!Unemployed can`t have experience!!!!');
//       return Unemployed(name, birthYear, profession);
//     }
//   }
  
//   void showInfa(){
//     print('$name is $age years old');
//   }
// }

// class Worker extends Person {
//   String profession;
//   int experience;
  
//   Worker(String name, int birthYear, this.profession, this.experience) : super(name, birthYear);
  
//   @override
//    void showInfa(){
//     print('$name is $age years old and he is $profession');
//   }
// }

// class Unemployed extends Person {
//   String myWork;

//   Unemployed(String name, int birthYear, this.myWork) : super(name, birthYear);
  
//   @override
//    void showInfa(){
//     print('$name is $age years old and he has never worked yet');
//   }
  
  
// }

// Function checkExpirinced (int wellExp){
//   return (int exp) => exp >= wellExp ? 'This worker have a lot of experince' : 'This worker is not experienced enough';
// }

// void main() {
//   List workers = [Worker('Stepan', 1990, 'Programmer', 3), Worker('Mykola', 2005, 'Accounter', 12), Worker('Viktor', 1991, 'Programmer', 7)];
  
//   print('All workers:');
//   for (int i = 0;  i < workers.length; i++){
//     workers[i].showInfa();
//   }
  
//   List programmers = workers.where((p) => p.profession == 'Programmer').toList();
  
//   print('Programmers:');
//   for (var prog in programmers){
//     prog.showInfa();
//   }
  
//   print('Experience:');
//   var exp5 = checkExpirinced (5);
//   for(var worker in workers){
//     print('${worker.name} has been working for ${worker.experience} years. ${exp5(worker.experience)}');
//   }
  
//   print(programmers[0].birthYear);
//   programmers[0].age = 25;
//   print(programmers[0].birthYear);
  
//   List facts = [Person.checkWork('Ignat', 1983, 'Sportsman', 20), Person.checkWork('Nazar', 1965, 'Unemployed', 0)];
//   for(var f in facts){
//     f.showInfa();
//   }
  
//   var checkAssert = Person.checkWork('Roman', 1995, 'Unemployed', 10);
// }





