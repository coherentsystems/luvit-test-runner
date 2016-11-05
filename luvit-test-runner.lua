--[[lit-meta
  name = "coherent/luvit-test-runner"
  description = "testing runner"
  version = "1.0.0"
  tags = {"test","runner"}
  license = "MIT"
  author = { name = "JB Smith" }
]]

--[[
  Using this module:

  -- local require for module
  local test_runner = require('luvit-test-runner')

  ... setup some prerequisites or add functions that be called for each test ...

  -- add a test
  -- you can just comment out tests you don't want to be added
  test_runner:add_test ('testME_12', function(testname)
    assert(1 == 1, testname.." failed because reason")
  end)

  -- run all tests that have been added
  test_runner:run()
  -- if we get this far we can print our success banner
  print("test-runner: all tests pass")
]]

local tests_to_run = {}
local test_runner = {}

test_runner.add_test = function(self, name, test)
  tests_to_run[#tests_to_run + 1] = {name, function() test(name) end}
end

test_runner.run = function(self)
  table.foreach(tests_to_run, function(i,v) 
    v[2]()
  end)
end

return test_runner
