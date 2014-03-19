kson = require "../lib/kson"

describe "kson", ->
  it "should convert object with string to String", ->
    obj = 
      test : "string value"
    obj_str = kson.stringify obj
    new_obj = kson.parse obj_str
    expect(new_obj.test).toEqual "string value"

  it "should convert object with regex and back with integrity", ->
    regex_val = /whattodo/
    obj = 
      test : regex_val
    obj_str = kson.stringify obj
    new_obj = kson.parse obj_str
    expect(new_obj.test).toEqual regex_val

  it "should convert object with regex and back with integrity", ->
    regex_val = /whattodo/
    obj = 
      test : regex_val
    obj_str = kson.stringify obj
    obj2 = kson.parse obj_str
    expect(obj2.test).toEqual regex_val

    obj_str2 = kson.stringify obj2
    obj3 = kson.parse obj_str2
    expect(obj3.test).toEqual regex_val    

  it "should convert object with nested regex and back with integrity", ->
    regex_val = /whattodo/
    obj = 
      test : 
        regex_pattern: regex_val

    obj_str = kson.stringify obj
    obj2 = kson.parse obj_str
    expect(obj2.test.regex_pattern).toEqual regex_val

    obj_str2 = kson.stringify obj2
    obj3 = kson.parse obj_str2
    expect(obj3.test.regex_pattern).toEqual regex_val    