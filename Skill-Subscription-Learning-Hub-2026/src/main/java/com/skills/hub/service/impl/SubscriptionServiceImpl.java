package com.skills.hub.service.impl;

import com.skills.hub.model.SkillPack;
import com.skills.hub.model.Subscription;
import com.skills.hub.model.User;
import com.skills.hub.repository.SkillPackRepository;
import com.skills.hub.repository.SubscriptionRepository;
import com.skills.hub.repository.UserRepository;
import com.skills.hub.service.SubscriptionService;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

    private final SubscriptionRepository subRepo;
    private final UserRepository userRepo;
    private final SkillPackRepository packRepo;

    public SubscriptionServiceImpl(SubscriptionRepository subRepo,
                                   UserRepository userRepo,
                                   SkillPackRepository packRepo) {
        this.subRepo = subRepo;
        this.userRepo = userRepo;
        this.packRepo = packRepo;
    }

    @Override
    public Subscription subscribe(Long userId, Long packId) {

        // =========================
        // to-do
        // =========================
        // STEP 1: fetch user by id (via repo/service)
        // STEP 2: fetch skill pack by id
        // STEP 3: create new Subscription object
        // STEP 4: set user + skill pack
        // STEP 5: set start date = today
        // STEP 6: set end date = today + 30 days
        // STEP 7: set status = ACTIVE
        // STEP 8: save subscription
        // STEP 9: return subscription

        if (userId == null || packId == null) {
            return null;
        }
        User user = userRepo.findById(userId).orElse(null);
        SkillPack pack = packRepo.findById(packId).orElse(null);
        if (user == null || pack == null) {
            return null;
        }
        List<Subscription> existing = subRepo.findByUser(user);
        for (Subscription s : existing) {
            if (s.getSkillPack().getId().equals(packId)) {
                return null;
            }
        }
        Subscription sub = new Subscription();
        sub.setUser(user);
        sub.setSkillPack(pack);
        sub.setStartDate(LocalDate.now());
        sub.setEndDate(LocalDate.now().plusDays(30));
        sub.setStatus("ACTIVE");
        return subRepo.save(sub);
    }

    @Override
    public List<Subscription> getUserSubscriptions(Long userId) {

        // STEP 1: fetch user subscriptions from DB
        // STEP 2: return list

        User user = userRepo.findById(userId).orElse(null);
        if (user == null) {
            return List.of();
        }
        return subRepo.findByUser(user);
    }

	public SubscriptionRepository getSubRepo() {
		return subRepo;
	}
}