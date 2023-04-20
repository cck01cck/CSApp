package hkmu.comps380f.service;

import hkmu.comps380f.model.TicketUser;
import hkmu.comps380f.repository.TicketUserRepository2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketUserService2 {

    @Autowired
    private TicketUserRepository2 ticketUserRepository2;

    public boolean saveUser(TicketUser user) {
        try {
            ticketUserRepository2.save(user);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}