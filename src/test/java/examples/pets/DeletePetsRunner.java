package examples.pets;

import com.intuit.karate.junit5.Karate;

public class DeletePetsRunner {

    @Karate.Test
    Karate testDeletePets(){
        return Karate.run("deletePets").relativeTo(getClass());
    }
}
