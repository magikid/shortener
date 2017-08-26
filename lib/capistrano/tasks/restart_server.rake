namespace :shortener do
  desc "Restart production server"
  task :restart_production do
    on roles(:all) do |host|
      within "#{current_path}/bin" do
        execute(:bundle, :exec, :rails, :restart)
        info "Host #{host} (#{host.roles.to_a.join(', ')}): restarted"
      end
    end
  end
end
