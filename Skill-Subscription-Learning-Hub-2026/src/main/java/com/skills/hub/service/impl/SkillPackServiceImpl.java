package com.skills.hub.service.impl;

import com.skills.hub.model.SkillPack;
import com.skills.hub.repository.SkillPackRepository;
import com.skills.hub.service.SkillPackService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkillPackServiceImpl implements SkillPackService {

    private final SkillPackRepository packRepo;

    public SkillPackServiceImpl(SkillPackRepository packRepo) {
        this.packRepo = packRepo;
    }

    @Override
    public SkillPack addSkillPack(SkillPack pack) {

        // STEP 1: validate input
        // STEP 2: save to DB
        // STEP 3: return saved object

        if (pack.getTitle() == null || pack.getTitle().trim().isEmpty()) {
            return null;
        }
        if (pack.getDescription() == null || pack.getDescription().trim().isEmpty()) {
            return null;
        }
        if (pack.getPrice() == null || pack.getPrice() < 0) {
            return null;
        }
        return packRepo.save(pack);
    }

    @Override
    public List<SkillPack> getAllPacks() {

        // STEP 1: fetch all packs from DB
        // STEP 2: return list

        return packRepo.findAll();
    }

    @Override
    public SkillPack updateSkillPack(SkillPack pack) {

        // STEP 1: find existing pack by ID
        // STEP 2: if not found → return null
        // STEP 3: update fields
        // STEP 4: save updated pack
        // STEP 5: return updated pack

        if (!packRepo.existsById(pack.getId())) {
            return null;
        }
        return packRepo.save(pack);
    }

    @Override
    public void deleteSkillPack(Long id) {

        // STEP 1: delete pack by ID

        packRepo.deleteById(id);
    }

	public SkillPackRepository getPackRepo() {
		return packRepo;
	}
}