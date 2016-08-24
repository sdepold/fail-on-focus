# fail-on-focus

The `fail-on-focus` binary searches for focussed tests in the provided files. It currently supports the mocha style `.only` statement as well as busterjs' focus rocket. In case of a focussed test it will print the offending lines and exit with an error code.

## Installation

```
npm install fail-on-focus
```

## Usage

```
fail-on-focus test/**/*.js
```

## License

MIT License
