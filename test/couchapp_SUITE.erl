-module(couchapp_SUITE).
-compile(export_all).

compare_test(_Config) ->
    A = {[  {<<"_id">>,<<"_design/name_of_view">>},
            {<<"language">>,<<"javascript">>},
            {<<"views">>,
                {[{<<"foo">>,
                    {[  {<<"reduce">>, <<"function (keys, values, rereduce) {\n  return \"reduced value\";\n}\n">>},
                        {<<"map">>, <<"function(doc) {\n  emit(doc._id, \"value\");\n}\n">>}]}}]}}]},
    B = {[  {<<"_id">>,<<"_design/name_of_view">>},
            {<<"language">>,<<"javascript">>},
            {<<"views">>,
                {[{<<"foo">>,
                    {[  {<<"reduce">>, <<"function (keys, values, rereduce) {\n  return \"reduced value\";\n}\n">>},
                        {<<"map">>, <<"function(doc) {\n  emit(doc._id, \"value\");\n}\n">>}]}}]}}]},
    false = couchapp:compare(A, B).


% -----------------------------------------------------------------
% -- common_test callbacks
all() ->
    [compare_test].

init_per_suite(Config) ->
    Config.

end_per_suite(_Config) ->
    ok.
