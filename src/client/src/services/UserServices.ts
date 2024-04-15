import Requests from "@/services/requests/Requests";

class UserServices {
    private requests: Requests;
    private readonly url: string;
    constructor(requests: Requests, user_url: string) {
        this.requests = requests;
        this.url = user_url;
    }
    async login(username: string, password: string): Promise<Response | undefined> {
        return this.requests.post(this.url + '/login', true, { username: username, password: password });
    }
    async logout(): Promise<void> {

    }
    async register(username: string, password: string, email: string): Promise<Response | undefined> {
        return this.requests.post(this.url + '/register', false, { username: username, password: password, email: email });
    }
}

export default UserServices;