package examples.pets;

import com.intuit.karate.junit5.Karate;

public class SearchPetsRunner {
    @Karate.Test
    Karate testSearchPets(){
        return Karate.run("searchPets").relativeTo(getClass());
    }
}
