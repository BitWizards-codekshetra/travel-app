enum Endpoints {
  base('http://10.0.2.2:48722/api'),
  openAiApi('/openai');

  const Endpoints(this.url);
  final String url;
}
