/*
  Warnings:

  - You are about to drop the column `email` on the `users` table. All the data in the column will be lost.
  - Added the required column `avatarUrl` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `githubId` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `login` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "memories" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user_id" TEXT NOT NULL,
    "coverUrl" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "memories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "githubId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL
);
INSERT INTO "new_users" ("id", "name", "password_hash") SELECT "id", "name", "password_hash" FROM "users";
DROP TABLE "users";
ALTER TABLE "new_users" RENAME TO "users";
CREATE UNIQUE INDEX "users_githubId_key" ON "users"("githubId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
