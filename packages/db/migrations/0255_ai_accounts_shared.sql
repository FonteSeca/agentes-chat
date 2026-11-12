ALTER TABLE "machines" ADD COLUMN "ai_accounts_shared" boolean DEFAULT false NOT NULL;
-- Keep the old access rule during rollout: server hosts and unpaired workspace computers were shared.
UPDATE "machines" SET "ai_accounts_shared" = true WHERE "kind" = 'host' OR "paired_by_user_id" IS NULL;
