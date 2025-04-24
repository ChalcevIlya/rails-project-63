### Hexlet tests and linter status:

[![Actions Status](https://github.com/ChalcevIlya/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/ChalcevIlya/rails-project-63/actions)

[![CI Status](https://github.com/ChalcevIlya/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/ChalcevIlya/rails-project-63/actions)

## Example of usage

```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```

## Output

```
<form action="#" method="post">
    <input name="name" type="text" value="rob">
    <textarea name="job" cols="20" rows="40">hexlet</textarea>
</form>
```