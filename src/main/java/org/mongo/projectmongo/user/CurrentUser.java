package org.mongo.projectmongo.user;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.Collection;

public class CurrentUser extends User {

    private final org.mongo.projectmongo.user.User user;

    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       org.mongo.projectmongo.user.User user) {
        super(username, password, authorities);
        this.user = user;
    }

    public org.mongo.projectmongo.user.User getUser() {
        return user;
    }
}
