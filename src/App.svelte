<script>
	import Contract from './Contract.svelte'

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

	export let name;
</script>

<main>
	{#if window.ethereum}
		<div>Connection enabled {connection}</div>
	{/if}
	{#if window.ethereum && !connection}
		<button on:click={connectWallet}>Connect wallet</button>
	{:else}
		<h1>Hello</h1>
		<Contract/>
	{/if}
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
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