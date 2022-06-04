<script>
    import { Web3 } from "svelte-web3"
    import ArgonContract from "../abis/Argon.json"

    var accounts
    var contract
    var web3

    export let connected

    async function initWeb3() {
        web3 = new Web3(window.ethereum)

        if (connected) { 
            accounts = await web3.eth.getAccounts()
            console.log(accounts)
            if (accounts.length > 0) {
                const networkId = await web3.eth.net.getId()
                const deployedNetwork = ArgonContract.networks[networkId]
                contract = new web3.eth.Contract(ArgonContract.abi, deployedNetwork.address)
            }
            const bal = await increment()
            return "Hello " + bal + " eth"
        }
        return "Not connected"
    }

    async function increment() {
        const response = web3.utils.fromWei(await web3.eth.getBalance(accounts[0]))
        return response
    }

    $: promise = initWeb3()
</script>

{#await promise}
    <h1>Loading</h1>
{:then greeting}
    <p>{accounts[0]}</p>
    <h1>{greeting}</h1>
{/await}
