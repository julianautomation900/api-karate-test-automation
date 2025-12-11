package examples.pets;

import com.intuit.karate.junit5.Karate;

public class CreateNewPetRunner {

    @Karate.Test
    Karate testCreatePets(){
        return Karate.run("createNewPets").relativeTo(getClass());
    }
}
