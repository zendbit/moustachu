# Nim Moustache

Moustachu is a([N im](https://github.com/Araq/Nim))plementation of [Mustache](https://github.com/mustache/mustache) (get it?). Mustache is "logic-less templating".

## Usage

**In code**

```nim

import nim_moustachu


var tmplate = """Hello {{name}}
You have just won {{value}} dollars!
{{#in_ca}}
Well, {{taxed_value}} dollars, after taxes.
{{/in_ca}}"""

var c : Context = newContext()
c["name"] = "Chris"
c["value"] = 10000
c["taxed_value"] = 10000 - (10000 * 0.4)
c["in_ca"] = true

echo render(tmplate, c)
```

For other mustache examples look at the `specs` directory. For other moustachu-specific examples see the `tests` folder.

For the formal description of the mustache format, please visit [mustache(5)](https://mustache.github.io/mustache.5.html). Ignore the sections on "lambdas" and "set delimeters".

Not mentioned in the formal description (but mentioned in the spec code), the spec also supports using a dot `.` as an "implicit iterator" for arrays containing unnamed items. For example, a sequence of strings or integers would use an implicit iterator:

```nim
import nim_moustachu

var c : Context = newContext()
c["zoo_name"] = "Anytown"
c["animals"] = @["lions", "tigers", "bears"]


var tmplate = """Animals at the {{zoo_name}} Zoo:

{{#animals}}
* {{.}}
{{/animals}}"""

echo render(tmplate, c)
```

The first version will print to stdout and the second will generate a file.

## Compliance

Moustachu supports the specs found in its specs directory:

- comments
- interpolation
- inverted
- partials
- sections

## Installation

The recommended way to install moustachu is through [nimble](https://github.com/nim-lang/nimble):

Install [nimble](https://github.com/nim-lang/nimble). Then do:

    $ nimble install https://github.com/zendbit/nim_moustachu@#head


## Design

- Make the interfaces with the data structures as dynamic-like as possible
- No lambdas, nor set delimiters. At least for now. Let's keep it simple please.
- Test in context. Tests are run on the installed package because that
  is what people get.

## Develop and Test

Get the source code:

    $ git clone https://github.com/zendbit/nim_moustachu.git
    $ cd nim_moustachu
    # make your changes ...
    # test
    $ nimble tests
    # run benchmarks
    $ nimble benchmarks

This will test against the selected specs copied from [mustache/spec](https://github.com/mustache/spec)

## TODO

- Use to see what else to do/fix
