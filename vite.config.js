import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  base: '/', // Ensure relative paths
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
  }
});
