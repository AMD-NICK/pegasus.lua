package.path = package.path .. ';../?.lua'
local Request = require 'lib/request'


describe('require', function()
    describe('instance', function()
        function verifyMethod(fn)
            local headers = { 'GET /index.html HTTP/1.1', 'A:B', 'C:D', nil , 'X=Y', '' }
            local err = {nil, nil, nil, nil, nil, 'error'}
            local param = {
            receive = function()
                return headers[1], err[1]
            end
            }

            local request = Request:new(param)
            local method = request[fn]

            assert.equal(type(method), 'function')
        end

        it('should exists constructor to request class', function()
            local headers = { 'GET /index.html HTTP/1.1', 'A:B', 'C:D', nil , 'X=Y', '' }
            local err = {nil, nil, nil, nil, nil, 'error'}
            local param = {
                receive = function()
                    return headers[1], err[1]
                end
            }

            local request = Request:new(param)

            assert.equal(type(request), 'table')
        end)

        it('should exists path method', function()
            verifyMethod('path')
        end)
    end)
end)

-- local Request = require 'lib/request'

-- i =0
-- local headers = {'GET /Makefile?a=b&c=d HTTP/1.1', 'A:B', 'C:D', nil , 'X=Y', ''}
-- local err = {nil, nil, nil, nil, nil,'érro'}

-- local r = Request:new({receive=function () i=i + 1;return  headers[i], err[i]; end})

-- print(r:path())
-- print(r:params().a)
-- print(r:headers().A)
-- print(r:method())
-- print(r:body())
-- print(r:form().X)