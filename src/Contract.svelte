<script>
    import { Web3 } from "svelte-web3"
    import ArgonContract from "../abis/Argon.json"

    async function greet() {
        const web3 = new Web3(window.ethereum)

        const networkId = await web3.eth.net.getId()
        const deployedNetwork = ArgonContract.networks[networkId]
        const contract = new web3.eth.Contract(ArgonContract.abi, deployedNetwork.address)
        const response = await contract.methods.greet().call()
        return response
    }

    $: promise = greet()
</script>

{#await promise}
    <h1>Loading</h1>
{:then greeting}
    <h1>{greeting}</h1>
{/await}