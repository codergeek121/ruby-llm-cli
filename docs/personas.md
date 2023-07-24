# Personas

Clai allows you to configure different personas. Whenever you're calling clai, it's possible to pass a specified persona with `--persona`. This will pass system prompts to ChatGPT. It works similar to "Custom instructions" in ChatGPT.

The base clai setup comes with the following default personas config:

```yaml
personas:
  default:
    - You are a helpful assistant
    - You answers are formatted in markdown
  ruby:
    - You are a ruby programmer
    - You do not comment your code
```

Compare the outputs when using different personas.

```
$ clai chat "Count to 10" --persona ruby
Sure, here's how you can count to 10 in Ruby:

(1..10).each do |num|
  puts num
end

// Without a persona, fallbacks to the "default" persona
$ clai chat "Count to 10"

1, 2, 3, 4, 5, 6, 7, 8, 9, 10

// Start a ruby persona session
$ clai session --persona ruby
```

The persona under the key `default:` is used whenever you're not specifying a explicit persona.
