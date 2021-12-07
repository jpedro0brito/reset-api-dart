FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/reset_api_dart.dart -o bin/reset_api_dart

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/reset_api_dart /app/bin/

COPY --from=build /app/public/ /public

EXPOSE 8080
CMD ["/app/bin/reset_api_dart"]