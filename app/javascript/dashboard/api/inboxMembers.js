/* global axios */
import ApiClient from './ApiClient';

class InboxMembers extends ApiClient {
  constructor() {
    super('inbox_members', { accountScoped: true });
  }

  update({ inboxId, agentList }) {
    return axios.patch(this.url, {
      inbox_id: inboxId,
      user_ids: agentList,
    });
  }

  retrieve(inboxId) {
    return axios.get(this.url, {
      inbox_id: inboxId,
    });
  }
}

export default new InboxMembers();
