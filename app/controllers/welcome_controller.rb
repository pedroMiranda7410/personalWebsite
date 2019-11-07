class WelcomeController < ApplicationController

  def index
    if Summary.all == []
      @summary = Summary.new(description:"
      Bem-vindo ao meu site. Eu sou um hobbista em eletrônica, curioso e, atualmente, estudante de engenharia de software na Universidade de Brasília. No passado, graduei 7 semestres dentro do curso de engenharia eletrônica, um dos quais, participei de alguns projetos envolvendo arduino e construção de simulações gráficas, usando C# dentro da engine Unity (Momento em que me apaixonei pela produção de jogos 2D e 3D). Durante a evolução desses projetos, me encantei pela área de desenvolvimento de software e sua ilimitada gama de possibilidades. Desde então, venho buscando novas experiências e aprendizados construtivos tanto sociais quanto profissionais. 
        Procuro participar de novos projetos e trabalhos afim de aperfeiçoar minhas habilidades profissionais e, a partir disso, descobrir em qual das áreas de desenvolvimento de software tenho mais facilidade e produtividade.
      ")
      @summary.save
    end

    if MyObjective.all == []
      @objective = MyObjective.new(description:"
      Desenvolvi esse site utilizando Ruby on Rails por pura aventura de entrar em uma linguagem que nunca havia utilizado, visando sua total diferença quanto às outras existentes. Seguindo esse caminho, meu objetivo está sendo passar por momentos instigantes, como esse que passei, apenas pela beleza de poder errar sozinho, consertar e finalmente aprender.
      Eu tenho um olhar aguçado para desafios e enigmas, não entender como funciona um obstáculo no meu caminho é o mesmo que dar \"tchau\" à minha vida social. Desde que ingressei no curso de engenharia de software venho desenvolvendo minhas habilidades em certas linguagens como JAVA, C# e Ruby voltado para um profundo entendimento do uso de orientação a objetos e aplicações WEB, já que front-end e back-end não eram minhas melhores atuações.
      Todo trabalho postado nesse site será disponibilizado gratuitamente para download à qualquer um que se interessar!
      ")
      @objective.save
    end

    if Community.all == []
      @community = Community.new(description:"
        TEXTO AQUI
      ")
      @community.save
    end

    @first_time = params[:first_time] != nil ? (params[:first_time] == "true" || params[:first_time] == true ? true : false)  : false

    if params[:loged]
      @atualizar_login = true
    else
      @atualizar_login = false
    end
  end

  def software
  
  end

  def comunidade

  end

  def fluxo_sanguineo

  end

  def projeto_icf

  end

end
