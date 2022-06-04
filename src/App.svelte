<script>
	import Contract from './Contract.svelte'
	import Navbar from './Navbar.svelte'

	async function connect() {
		if (window.ethereum) {
			window.web3 = new Web3(ethereum)
			await window.ethereum.enable()

			connection = window.ethereum.isConnected()
		}
	}
	function connectWallet() {
		promise = connect()
	}

	$: promise = connect()
	$: connection = window.ethereum ? window.ethereum.isConnected() : false;

	export let wasm;

	async function wasmGreet() {
		await wasm.greet_user()
	}
</script>

<main>
	<Navbar/>
	{#if window.ethereum && !connection}
		<button on:click={connectWallet}>Connect wallet</button>
	{:else}
		<Contract connected={connection}/>
	{/if}
	<h1 on:click={wasmGreet}>WEB ASSEMBLY</h1>
</main>

<style>
	main {
		text-align: center;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		/*text-transform: uppercase; */
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>