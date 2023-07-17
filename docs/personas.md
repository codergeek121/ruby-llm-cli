# Personas

TODO: This feature is still under development!

A clai setup should allow preconfiguring multiple personas. Each command should support a `--persona` option to allow setting some default prompts to the api.

An example could look like this:

```yaml
personas:
  work:
    - Use professional language
    - Keep your answer below 100 words
  bavarian:
    - Use a bavarian accent

# Starting a session with a preselected persona
$ clai session --persona bavarian
Your prompt: <Your prompt><Enter>
Some bavarian answer.
```

The default setup should have useful personas as a default.
