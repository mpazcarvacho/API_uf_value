class UfsController < ApplicationController
  
  def daily
    
    client = Client.find_by(name: 'juan')
    
    @uf = Ufvalue.find_by(date: params[:date])
    
    if @uf!=nil
      render json: @uf.uf, status: :ok
      #Contador de consultas exitosas para cliente Juan
      client.stats += 1
      client.save
    else
      render json: "Error: UF value not available for requested date. Available dates between range 2020-01-01 to 2020-02-29", status: :ok
    end

  end

  def stats
    @stat = Client.find_by(name:'juan')
    render json: [@stat.name, @stat.stats], status: :ok
  end

end
