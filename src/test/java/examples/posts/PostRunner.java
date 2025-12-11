package examples.posts;

import com.intuit.karate.junit5.Karate;

public class PostRunner {

    @Karate.Test
    Karate testGetPosts(){
        return Karate.run("post").relativeTo(getClass());
    }
}
