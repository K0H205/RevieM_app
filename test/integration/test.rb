test "index as admin including pagination and delete links" do
get login_path
    assert_template '/login'
end