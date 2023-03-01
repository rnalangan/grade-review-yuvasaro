import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test
    public void testFilter() {
        List<String> list = new ArrayList<String>();
        list.add("CSE 15L");
        list.add("CSE 12");
        list.add("MATH 20D");

        List<String> expectedList = new ArrayList<String>();
        expectedList.add("CSE 15L");
        expectedList.add("CSE 12");

        assertEquals(expectedList, ListExamples.filter(
            list, new StringChecker() {
                public boolean checkString(String s) {
                    return s.contains("CSE");
                }
            })
        );
    }
}
