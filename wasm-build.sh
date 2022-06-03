cd backend
cargo build --target wasm32-unknown-unknown
wasm-bindgen target/wasm32-unknown-unknown/backend.wasm --out-dir build