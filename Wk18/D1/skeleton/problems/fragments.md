Practice your query syntax using GraphiQL to get a feel for how schemas are set up in GraphQL. For problems that accept variables make sure to test each answer you come up with with multiple `id`s to make sure they work.

1. Write a query that will return the name, founder, ghost, and animal of Gryffindor (id: 1) and Ravenclaw (id: 4). Remember to alias - then DRY up your query with a fragment!
  fragment findStuff on House {
        name,
        founder,
        ghost,
        animal
  }
  

query StuffForTwoHouses($firstid: Int, $secondId: Int) {
  firstHouse: house(id: $firstid) {
     ...findStuff
  },
  secondHouse: house(id: $secondId) {
    ...findStuff
  }
}

}

query NameForTwoWizards($firstid: Int, $secondId: Int) {
  firstWizard: wizard(id: $firstid) {
    name
  },
  secondWizard: wizard(id: $secondId) {
    name
  }
}

2. Write a query that will return the core, length, owner name, and the name of the owner's house for both the wand with the `id` of 7 and the wand with the `id` of 10. Then use a fragment to DRY it up!
  fragment findStuff on Wand{
        core,
        length,
        wizard{
          house{
            name
          }
        }
  }

    query twoWands($firstid: Int, $secondId: Int)
{
  firstHouse: wand(id:$firstid){
    ...findStuff
  }
   secondHouse: wand(id:$secondId){
    ...findStuff
  }
}

3. Create a query that will accept an `id` variable and will return the patronus form associated with that `id`.
    query patronusForm($id: Int)
    {
        patro: patronus(id:$id){
            form
        }
    }
4. Write a query with the operation name of `FetchWizardandWand` that will accept two variables, one for a wizard to be fetched(`$wizardId`) and one for a wand to be fetched(`$wandId`). For the wizard return their name and house name. For the wand return the core, length, and the wizard's patronus form.
   query FetchWizardandWand($wizardId: Int, $wandId:Int){
      wiz: wizard(id: $wizardId){
        name,
        house{
          name
        }
      }

      wand: wand(id: $wandId){
        core,
        length,
        wizard{
          patronus{
            form
          }
        }
      }
    }
5. Now let's use variables, aliases and fragments! Write a query that will accept the `id` of two patronus. For each patronus return the form of that patronus, along with the name of the wizard that patronus belongs to.
    
    query twoPatronuses($patronus1: Int, $patronus2: Int){
        patro1: patronus(id: $patronus1){
            ... findPatroStuff
        }
        patro2: patronus(id: $patronus2){
            ... findPatroStuff
        }
    }

    fragment findPatroStuff on Patronus {
            form
            wizards{
                name
            }
    }

6. Write a query that accepts two variables for the `id`s of two houses. For each house return the names of all the wizards of that house along with the core of their wands and their patronus forms. Use a fragment!
     fragment stuff on House{
      wizards{
        name,
        wands{
          core
        },
        patronus{
          form
        }
      }
    }
    query twoHouse($one: Int, $two: Int){
      houseOne: house(id: $one){
        ...stuff
      }
      
      houseTwo: house(id: $two){
        ...stuff
      }
    }
7. Write a query that accepts three variables for the `id` for three separate wizards. For the first wizard return their name, house name and patronus form. For the second wizard return their name, their house name, and their wand core. For the third wizard return their name, their house name, their patronus form, and their wand core. Though you are returning different information for each wizard you are still returning the name and house name of each wizard meaning you could use a fragment to DRY this up!

    query threeWiz($one: Int, $two: Int, $three: Int){
      wizOne: wizard(id: $one){
        ...stuff,
        patronus{
            form
        }
      }
      
      wizTwo: wizard(id: $two){
        ...stuff,
        wands{
            core
        }
      }

      wizThree: wizard(id: $three){
        ...stuff,
        patronus{
            form
        }
        wands{
            core
        }
      }
    }

    fragment stuff on Wizard{
        name,
        house{
            name
        }
    }

8. Write a query that will accept three variables for a query that can be broken down into three parts. The first variable will be the `id` for a house where you will return the name, founder, and patronus forms of all the wizards in that house. The second variable will be to fetch the length of a particular wand. The third variable will query to find the name, and the patronus form for the wizard with the specified id.
    query threeDifQuer($hOne: Int, $wTwo: Int, $wThree: Int){
      house: house(id: $hOne){
        name,
        founder,
        wizards{
          patronus{
            form
          }
        }
      }
      wand: wand(id: $wTwo){
        length
      }
      wiz: wizard(id: $wThree){
        name,
        patronus{
          form
        }
      }
    }