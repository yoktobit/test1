package example

import "github.com/yoktobit/yoktocue/gen"
import "github.com/yoktobit/yoktocue/schema"

AppRoutes: gen.#RouterGenerator & {
	@gen(router)
	Name: "GoGenerator"
	Debug: true
	Routes: {
		"/echo/:text": {
			Name: "Echo"
			Method: "get"
		}
	}
}

AppFrontend: gen.#FrontendGenerator & {
	@gen(frontend)
	Name: "Frontendgenerator"
	Frontend: {
		AppTitle: "Test1"
		ModuleName: "test1"
		FirstPage: "Willkommen"
		Pages: {
			Willkommen: {
				Steps: {
					PersonenDaten: {
						let M=Datamodel.Models.Hello.Fields
						Fields: [
							M.Titel,
							M.Vorname,
							M.Nachname,
							M.AnzahlKinder,
							M.Abschlussnote,
							StaticHtmlField
						]
					}
				}
			}
		}
	}
}

Datamodel: schema.#Datamodel & {
	Name: "MyModel"
	Models: {
		Person: {
			Fields: {
				Titel: {
					Label: "Titel"
					Type: "string"
				}
				Vorname: {
					Label: "Vornamen"
					Type: "string"
				}
				Nachname: {
					Label: "Nachname"
					Type: "string"
				}
				AnzahlKinder: {
					Label: "Anzahl Kinder"
					Type: "int"
				}
				Abschlussnote: {
					Label: "Abschlussnote"
					Type: "decimal"
				}
			}
			Relations: {}
		}
	}
}

StaticHtmlField: schema.#HtmlField & schema.#SupportedFrontendField & {
	Name: "StaticHtmlField"
	Label: "StaticHtmlField"
	Content: """
		<h1>
		Überschrift
		</h1>
		<p>
		Ein Absatz dies ist.
		</p>
		"""
}