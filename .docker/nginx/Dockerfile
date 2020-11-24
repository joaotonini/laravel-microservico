FROM nginx:1.15.0-alpine
#baixan a imagem do nginx
# aqui queremos remover o arquivo padrão do nginx que é aquele "olá mundo" e vamos criar
# um novo personalizado com algumas modificações.
RUN rm /etc/nginx/conf.d/default.conf
#na linha de cima vai removr o arquivo padrão
COPY ./nginx.conf /etc/nginx/conf.d
#uma nova configuração sera feita no arquivo nginx.conf
