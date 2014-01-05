def stub_env_for (provider)
  send("env_for_#{provider}")
end

