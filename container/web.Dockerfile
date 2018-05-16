FROM nginx

ARG cUID
RUN usermod --non-unique --uid $cUID nginx