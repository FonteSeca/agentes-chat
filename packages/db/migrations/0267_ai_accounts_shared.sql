ALTER TABLE "machines" ADD COLUMN "ai_accounts_shared" boolean DEFAULT false NOT NULL;--> statement-breakpoint
-- Every member already adds plans on host computers and on computers nobody connected: those start shared.
UPDATE "machines" SET "ai_accounts_shared" = true WHERE "kind" = 'host' OR "paired_by_user_id" IS NULL;
