let
  config = { server = { port = 8080; }; };
in
{
  port = config.server.port or 80;
  hasDebug = config.server ? debug;
  fallbackChain = config.client.theme or "default";
}
