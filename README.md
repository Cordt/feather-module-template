# Feather CMS module template (🪶)

[Feather CMS](https://github.com/FeatherCMS/feather) module template for the Swift template system.


## Dependencies

Install the [Swift template](https://github.com/BinaryBirds/swift-template) tool.

```
git clone https://github.com/BinaryBirds/swift-template.git
cd swift-template
make install
```

Now you are ready to get the Feather CMS module template.


## Install template

You can use the `swift template install` command to setup the template.

```shell
# local
swift template install https://github.com/FeatherCMS/feather-module-template

# global
swift template install https://github.com/FeatherCMS/feather-module-template -g
```

Global Swift templates are located in your `~/.swift-template` folder.


## Usage

You can generate a new module with the following command:

```shell
swift template generate <name> -u feather-module [-o <location>]
```

That's it. Enjoy your newly created Feather CMS module template.


## License

[WTFPL](LICENSE) - Do what the fuck you want to.

