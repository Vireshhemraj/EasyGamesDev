Vue.component('v-select', VueSelect.VueSelect);
new Vue({
    el: '#clients',

    data: {
        errorMessage: '',
        dllClientList: [],
        selectedClient: { id: - 1, label: 'All Clients Transactions' },
        clientList: '',
        clientInfoByClientId: [],
        saveTransactionInfo: { "amount": null, "transactionType": null, "comment": null },
        transactionList: '',
        amountErrorMessage: '',
        transactionTypeErrorMessage: '',
        saveTransactionErrorMessage: '',
        updateTransactionInfoById: '',
        updateTransactionErrorMessage: ''
    },

    created() {
        this.getClientList();
        this.getTransactionList();
    },

    methods: {
        getClientList() {
            let _this = this;
            window.axios.get("api/Client/GetAllClients")
                .then(function (response) {
                    _this.clientList = response.data;
                    if (_this.selectedClient.id > -1) _this.getClientByClientID();
                    _this.getClientListForDDL();
                }).catch(function (error) {
                    this.errorMessage = error;
                });
        },

        getClientListForDDL() {
            this.dllClientList.push({ id: -1, label: 'All Clients Transactions' });
            for (let i = 0; i < this.clientList.length; i++) {
                this.dllClientList.push({
                    id: this.clientList[i].clientID,
                    label: this.clientList[i].name + ' ' + this.clientList[i].surname + ' (' + this.clientList[i].clientBalance + ')'
                });
            }
        },

        showAddTransactionModal() {
            this.saveTransactionErrorMessage = "";
            $("#transactionModal").modal('show');
        },

        closeTransactionModal() {
            this.saveTransactionInfo = { "amount": null, "transactionType": null, "comment": null }
            $("#transactionModal").modal('hide');
        },

        isValidSaveTransaction() {
            let isValid = true;
            if (this.saveTransactionInfo.amount === null || this.saveTransactionInfo.amount === '') {
                this.amountErrorMessage = "Amount is required.";
                isValid = false;
            }
            if (this.saveTransactionInfo.transactionType === null || this.saveTransactionInfo.transactionType === '') {
                this.transactionTypeErrorMessage = "Transaction Type is required.";
                isValid = false;
            }
            return isValid;
        },

        saveTransactionModal() {
            let _this = this;
            if (!this.isValidSaveTransaction()) return;
            window.axios.post("api/Transaction/AddTransaction",
                { clientID: this.clientInfoByClientId.clientID, amount: this.saveTransactionInfo.amount, transactionTypeID: this.saveTransactionInfo.transactionType, comment: this.saveTransactionInfo.comment })
                .then(function (response) {
                    _this.getClientList();
                    _this.getTransactionList();
                    setTimeout(function () {
                        if (_this.selectedClient.id > -1) {
                            let selectedClient = _this.clientList.find(s => s.clientID === _this.selectedClient.id);
                            console.log(selectedClient)
                            _this.selectedClient = {
                                id: selectedClient.clientID, label: selectedClient.name + ' ' + selectedClient.surname + ' (' + selectedClient.clientBalance + ')'
                            };
                        }
                    }, 500);                   
                    _this.closeTransactionModal();
                }).catch(function (error) {
                    console.log(error)
                    _this.saveTransactionErrorMessage = "Failed, Please try again.";
                });
        },

        getTransactionList() {
            let _this = this;
            let url = "";
            if (this.selectedClient.id > -1) {
                url = "api/Transaction/GetAllTransactions?clientID=" + this.selectedClient.id;
            } else {
                url = "api/Transaction/GetAllTransactions";
            }
            window.axios.get(url).then(function (response) {
                _this.transactionList = response.data;
            }).catch(function (error) {
                this.errorMessage = error;
            });
        },

        showUpdateTransactionModal(transactionID) {
            let transactionInfo = this.transactionList.find(s => s.transactionID === transactionID);
            let clientInfo = this.clientList.find(s => s.clientID === transactionInfo.clientID);
            this.updateTransactionInfoById = {
                name: transactionInfo.name, surname: transactionInfo.surname, transactionTypeName: transactionInfo.transactionTypeName,
                amount: transactionInfo.amount, clientBalance: clientInfo.clientBalance, comment: transactionInfo.comment, transactionID: transactionInfo.transactionID
            };
            $("#transactionUpdateModal").modal('show');
        },

        saveUpdateTransactionModal() {
            let _this = this;
            window.axios.post("api/Transaction/UpdateTransaction", { transactionID: this.updateTransactionInfoById.transactionID, comment: this.updateTransactionInfoById.comment === "" ? null : this.updateTransactionInfoById.comment })
                .then(function (response) {
                    _this.getTransactionList();
                    _this.closeUpdateTransactionModal();
                }).catch(function (error) {
                    _this.updateTransactionErrorMessage = "Failed, Please try again.";
                });
        },

        closeUpdateTransactionModal() {
            this.updateTransactionInfoById = [];
            $("#transactionUpdateModal").modal('hide');
        },

        getClientByClientID() {
            let client = this.clientList.find(s => s.clientID == this.selectedClient.id);
            if (client !== undefined) {
                this.clientInfoByClientId = client;
            } else {
                this.clientInfoByClientId = [];
            }
        }
    },

    watch: {
        selectedClient() {
            this.getTransactionList();
            this.getClientByClientID();
        },

        saveTransactionInfo: {
            handler(val) {
                this.amountErrorMessage = "";
                this.transactionTypeErrorMessage = "";
            },
            deep: true
        }
    }
});