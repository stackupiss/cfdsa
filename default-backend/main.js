const morgan = require('morgan')
const express = require('express')

const PORT = parseInt(process.env.PORT || process.env.APP_PORT) || 3000

const return404 = (req, resp) => {
	resp.status(404)
	resp.format({
		'text/html': () => {
			resp.type('text/html').sendFile(__dirname + '/public/index.html')
		},
		'application/json': () => {
			resp.type('application/json').json({ error: `Not found: ${req.originalUrl}` })
		},
		default: () => {
			resp.type('text/plain').send(`Not found: ${req.originalUrl}`)
		}
	})
}

const app = express();

app.disable('x-powered-by')

app.use(morgan('combined'))

app.get('/healthz', (req, resp) => {
	resp.status(200)
		.type('application/json')
		.json({ timestamp: (new Date()).getTime() })
})

app.get([ '/', '/index.html' ], return404)

app.use(express.static(__dirname + '/public'))

app.use(return404)

app.listen(PORT, () => {
	console.info(`Application started on port ${PORT} at ${new Date()}`)
})

