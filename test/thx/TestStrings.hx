/**
 * ...
 * @author Franco Ponticelli
 */

package thx;

import utest.Assert;

using thx.Strings;

class TestStrings {
  public function new(){}

  public function testContains() {
    Assert.isTrue("test".contains(""));
    Assert.isTrue("test".contains("t"));
    Assert.isTrue("test".contains("te"));
    Assert.isTrue("test".contains("tes"));
    Assert.isTrue("test".contains("test"));
    Assert.isTrue("one two three".contains("one"));
    Assert.isTrue("one two three".contains("two"));
    Assert.isTrue("one two three".contains("three"));
    Assert.isFalse("test".contains("test "));
    Assert.isFalse("test".contains(" test"));
    Assert.isFalse("test".contains("tes "));
  }

  public function testContainsAny() {
    Assert.isTrue("test".containsAny(["t", "x", "y"]));
    Assert.isTrue("test".containsAny(["e", "x", "y"]));
    Assert.isTrue("test".containsAny(["s", "x", "y"]));
    Assert.isTrue("test".containsAny(["x", "t", "y"]));
    Assert.isTrue("test".containsAny(["x", "e", "y"]));
    Assert.isTrue("test".containsAny(["x", "s", "y"]));
    Assert.isTrue("test".containsAny(["x", "y", "t"]));
    Assert.isTrue("test".containsAny(["x", "y", "e"]));
    Assert.isTrue("test".containsAny(["x", "y", "s"]));
    Assert.isTrue("one two three".containsAny(["zero", "one", "two"]));
    Assert.isTrue("one two three".containsAny(["one", "two", "three"]));
    Assert.isTrue("one two three".containsAny(["one two", "x", "three"]));
  }

  public function testUcwordsws() {
    var tests = [
      { expected : "Test", test : "test" },
      { expected : "Test Test", test : "test test" },
      { expected : " Test Test  Test ", test : " test test  test " },
      { expected : "Test\nTest", test : "test\ntest" },
      { expected : "Test\tTest", test : "test\ttest" },
    ];
    for (item in tests)
      Assert.equals(item.expected, item.test.capitalizeWords(true));
  }

  public function testUcwords() {
    var tests = [
      { expected : "Test", test : "test" },
      { expected : "Test Test", test : "test test" },
      { expected : " Test-Test:Test_Test : Test ", test : " test-test:test_test : test " },
      { expected : "Test\nTest", test : "test\ntest" },
      { expected : "Test\tTest", test : "test\ttest" },
    ];
    for (item in tests)
      Assert.equals(item.expected, item.test.capitalizeWords());
  }

  public function testAlphaNum() {
    var tests = [
      { expected : true, test : "a" },
      { expected : true, test : "1a" },
      { expected : false, test : " a" },
      { expected : false, test : " " },
      { expected : false, test : "" },
    ];
    for (item in tests)
      Assert.equals(item.expected, item.test.isAlphaNum());
  }

  public function testHumanize() {
    Assert.equals("hello world", Strings.humanize("helloWorld"));
    Assert.equals("my long string", Strings.humanize("my_long_string"));
    Assert.equals("ignore many", Strings.humanize("ignoreMANY"));
  }
/*
  public function testWrapColumn() {
    var text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

    Assert.equals(
"Lorem ipsum dolor
sit amet,
consectetur
adipisicing elit,
sed do eiusmod
tempor incididunt ut
labore et dolore
magna aliqua. Ut
enim ad minim
veniam, quis nostrud
exercitation ullamco
laboris nisi ut
aliquip ex ea
commodo consequat.",
text.wrapColumns(20));

    Assert.equals(
"    Lorem ipsum
    dolor sit amet,
    consectetur
    adipisicing
    elit, sed do
    eiusmod tempor
    incididunt ut
    labore et dolore
    magna aliqua. Ut
    enim ad minim
    veniam, quis
    nostrud
    exercitation
    ullamco laboris
    nisi ut aliquip
    ex ea commodo
    consequat.",
text.wrapColumns(20, "    "));

  }
*/
  public function testWrapColumnPreserveNewLines() {
    var text = "Lorem ipsum dolor sit amet,\n\nconsectetur adipisicing elit";
    Assert.equals(
      "Lorem ipsum dolor\nsit amet,\n\nconsectetur\nadipisicing elit",
      text.wrapColumns(18));
  }
/*
  public function testWrapColumnLong() {
    var text = "aaaaaaaaaa aaaa aaa aa";
    Assert.equals(
"aaaaaaaaaa
aaaa
aaa aa", text.wrapColumns(6));
  }
*/
  public function testRepeat() {
    Assert.equals('XyXyXy', 'Xy'.repeat(3));
  }

  public function testUpTo() {
    Assert.equals('abcdef', 'abcdef'.upTo('x'));
    Assert.equals('ab', 'abcdef'.upTo('cd'));
  }

  public function testFrom() {
    Assert.equals('', 'abcdef'.from('x'));
    Assert.equals('cdef', 'abcdef'.from('cd'));
  }

  public function testAfter() {
    Assert.equals('', 'abcdef'.after('x'));
    Assert.equals('ef', 'abcdef'.after('cd'));
  }

  public function testStripTags() {
    Assert.equals('a code; x', 'a<br/> <script src="aaa">code;</script> x'.stripTags());
  }

  public function testLtrim() {
    Assert.equals('abcde', 'abcde'.trimCharsLeft('x'));
    Assert.equals('de', 'abcde'.trimCharsLeft('cba'));
    Assert.equals('abcde', 'abcde'.trimCharsLeft('b'));

    Assert.equals('', '/'.trimCharsLeft('/'));
  }

  public function testRtrim() {
    Assert.equals('abcde', 'abcde'.trimCharsRight('x'));
    Assert.equals('ab', 'abcde'.trimCharsRight('ced'));
    Assert.equals('abcde', 'abcde'.trimCharsRight('d'));

    Assert.equals('', '/'.trimCharsRight('/'));
  }

  public function testTrim() {
    Assert.equals('abcde', 'abcde'.trimChars('x'));
    Assert.equals('cd', 'abcde'.trimChars('abe'));
    Assert.equals('abcde', 'abcde'.trimChars('bd'));

    Assert.equals('', '/'.trimChars('/'));
  }
}
