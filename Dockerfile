FROM ruby:3.3

# Instalando dependências essenciais do Linux para o Postgres
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Alinhando com o seu docker-compose.yml
WORKDIR /app

# Garantindo que o Bundler esteja atualizado
RUN gem install bundler

# Lógica de Cache: copiamos as gems primeiro
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copiamos o resto do código do StockMaster
COPY . .

# Expomos a porta padrão do Rails
EXPOSE 3000

# Comando para ligar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]