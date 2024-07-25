-- CreateTable
CREATE TABLE "SuperAdminLogin" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "SuperAdminLogin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdminLogin" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "AdminLogin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invite" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "Invite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrganizationList" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "OrganizationList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserPolicy" (
    "id" SERIAL NOT NULL,
    "policyName" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "UserPolicy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserGroup" (
    "id" SERIAL NOT NULL,
    "groupName" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "UserGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResourceList" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "superAdminId" INTEGER NOT NULL,

    CONSTRAINT "ResourceList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SuperadminToUserInvite" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "superAdminId" INTEGER NOT NULL,

    CONSTRAINT "SuperadminToUserInvite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdminToUserInvite" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "adminId" INTEGER NOT NULL,

    CONSTRAINT "AdminToUserInvite_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SuperAdminLogin_email_key" ON "SuperAdminLogin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "AdminLogin_email_key" ON "AdminLogin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Invite_email_key" ON "Invite"("email");

-- CreateIndex
CREATE UNIQUE INDEX "SuperadminToUserInvite_email_key" ON "SuperadminToUserInvite"("email");

-- CreateIndex
CREATE UNIQUE INDEX "AdminToUserInvite_email_key" ON "AdminToUserInvite"("email");

-- AddForeignKey
ALTER TABLE "AdminLogin" ADD CONSTRAINT "AdminLogin_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "OrganizationList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invite" ADD CONSTRAINT "Invite_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "OrganizationList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPolicy" ADD CONSTRAINT "UserPolicy_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "OrganizationList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserGroup" ADD CONSTRAINT "UserGroup_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "OrganizationList"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceList" ADD CONSTRAINT "ResourceList_superAdminId_fkey" FOREIGN KEY ("superAdminId") REFERENCES "SuperAdminLogin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SuperadminToUserInvite" ADD CONSTRAINT "SuperadminToUserInvite_superAdminId_fkey" FOREIGN KEY ("superAdminId") REFERENCES "SuperAdminLogin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdminToUserInvite" ADD CONSTRAINT "AdminToUserInvite_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "AdminLogin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
