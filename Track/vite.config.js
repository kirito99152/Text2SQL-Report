import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
    base: '/',
    plugins: [react()],
    server: {
        port: 3000,
        proxy: {
            '/api': 'http://160.191.50.208:11002/'
        }
    }
})
