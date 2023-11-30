<template>
    <div class="modal-wrapper h-full w-full">
        <div class="modal">
            <!-- <woot-button @click="openQuickConnectPopup">
                Quick Connect
            </woot-button> -->
            <!-- <woot-modal :show="showQuickConnectPopup" :on-close="closeQuickConnectPopup"> -->
            <h4>Quick Connect with <b class="">OTP</b></h4>
            <p class="text-center"><b>Enter the WhatsApp number</b></p>
            <input class="inp" v-model="phoneNumber" type="text" placeholder="Enter phone number">
            <woot-button @click="generateCode(currentUser.access_token, currentAccountId)">
                {{ buttonText }}
            </woot-button>
            <p>Your code: {{ code }}</p>
            <ol>
                <li>
                    <p>Open WhatsApp of the number entered above</p>
                </li>
                <li>
                    <p>Tap Menu ⋮ and click on ‘Linked devices’️</p>
                </li>
                <li>
                    <p>Click on ‘Link a device’</p>
                </li>
                <li>
                    <p>Click on ‘Link with phone number instead’</p>
                </li>
                <li>
                    <p>Enter the code generated above</p>
                </li>
            </ol>
            <!-- </woot-modal> -->
        </div>
        <div>or</div>
        <div class="modal">
            <h4>Quick Connect with <b class="">QR</b></h4>
            <div class="img-container">
                <img class="w-full h-full" :src="dynamicQR" />
            </div>
            <ol>
                <li>
                    <p>Open the WhatsApp number that you would like to connect with BOW CRM</p>
                </li>
                <li>
                    <p>Tap Menu ⋮ and click on ‘Linked devices’️</p>
                </li>
                <li>
                    <p>Click on ‘Link a device’</p>
                </li>
                <li>
                    <p>Generate and scan the QR displayed on the screen</p>
                </li>
            </ol>
        </div>
    </div>
</template>
  
<script>
import axios from 'axios';
import wootButton from 'dashboard/components/buttons/Button.vue';
import { addBusinessDays } from 'date-fns';
import io from 'socket.io-client';
import { mapGetters } from 'vuex';

export default {
    components: {
        wootButton,
    },
    data() {
        return {
            showQuickConnectPopup: true,
            phoneNumber: '',
            code: '',
            socket: null,
            dynamicQR: 'test',
            buttonText: 'Generate Code',
        };
    },
    computed: {
        ...mapGetters({
            currentUser: 'getCurrentUser',
            getAccount: 'accounts/getAccount',
            currentAccountId: 'getCurrentAccountId',
        }),
    },
    methods: {
        openQuickConnectPopup() {
            this.showQuickConnectPopup = true;
            bus.$emit('newToastMessage', currentUser);
        },
        closeQuickConnectPopup() {
            this.showQuickConnectPopup = false;
        },
        async generateCode(token, AccountId) {
            const data = {
                instanceName: this.phoneNumber,
                token: "",
                qrcode: false,
            };

            try {
                const response = await axios.post('http://3.111.40.119:8080/instance/create', data, {
                    headers: {
                        'apikey': 'B6D711FCDE4D4FD5936544120E713976'
                    }
                });

                let apikey = response.data.hash.apikey;
                let instance_name = response.data.instance.instanceName;

                let attempts = 0;

                setTimeout(async () => {
                    const connect_response = await axios.get(`http://3.111.40.119:8080/instance/connect/${instance_name}?number=${this.phoneNumber}`, {
                        headers: { 'apikey': apikey }
                    });

                    this.code = connect_response.data.pairingCode;

                    if (this.code === null) {
                        this.code = "The pairing code was null";
                    }

                    this.dynamicQR = connect_response.data.base64;

                    attempts++;

                    let intervalId = setInterval(async () => {
                        if (attempts >= 5) {
                            clearInterval(intervalId);

                            this.buttonText = 'Reconnect'
                            return;
                        }

                        const connect_response = await axios.get(`http://3.111.40.119:8080/instance/connect/${instance_name}?number=${this.phoneNumber}`, {
                            headers: { 'apikey': apikey }
                        });

                        this.code = connect_response.data.pairingCode;

                        if (this.code === null) {
                            this.code = "The pairing code was null";
                        }

                        this.dynamicQR = connect_response.data.base64;

                        attempts++;
                    }, 40000);
                }, 2000);

            } catch (error) {
                bus.$emit('newToastMessage', error.response);
                if (error.response.status === 403) {
                    let url_fetch = `http://3.111.40.119:8080/instance/fetchInstances?instanceName=${this.phoneNumber}`;

                    let fetch_data = await axios.get(url_fetch, { 
                        headers: { 'apikey': 'B6D711FCDE4D4FD5936544120E713976' } 
                    });

                    let apikey = fetch_data.data.instance.apikey;
                    let instance_name = fetch_data.data.instance.instanceName;

                    let attempts = 0;

                    setTimeout(async () => {
                        const connect_response = await axios.get(`http://3.111.40.119:8080/instance/connect/${instance_name}?number=${this.phoneNumber}`, {
                            headers: { 'apikey': apikey }
                        });

                        this.code = connect_response.data.pairingCode;

                        if (this.code === null) {
                            this.code = "The pairing code was null";
                        }

                        this.dynamicQR = connect_response.data.base64;

                        attempts++;

                        let intervalId = setInterval(async () => {
                            if (attempts >= 5) {
                                clearInterval(intervalId);

                                this.buttonText = 'Reconnect'
                                return;
                            }

                            const connect_response = await axios.get(`http://3.111.40.119:8080/instance/connect/${instance_name}?number=${this.phoneNumber}`, {
                                headers: { 'apikey': apikey }
                            });

                            this.code = connect_response.data.pairingCode;

                            if (this.code === null) {
                                this.code = "The pairing code was null";
                            }

                            this.dynamicQR = connect_response.data.base64;

                            attempts++;
                        }, 40000);
                    }, 2000);
                }

                console.error(error);
            }

            
        }
    },
    mounted() {
    },
};
</script>

<style lang="scss" scoped>
.modal-wrapper {
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-wrap: wrap;
}

.modal {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 350px;
    border: 1px;
    border-radius: 15px;
    background-color: white;
    padding: 2.5%;

    .inp {
        width: 300px;
    }

    .img-container {
        height: 150px;
        width: 150px;
        margin: 2%;
    }
}</style>