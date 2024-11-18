-- CreateTable
CREATE TABLE `ProductDetails` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productId` INTEGER NOT NULL,
    `screen` VARCHAR(191) NULL,
    `camera` VARCHAR(191) NULL,
    `features` VARCHAR(191) NULL,
    `os` VARCHAR(191) NULL,
    `memoryStorage` VARCHAR(191) NULL,
    `designWeight` VARCHAR(191) NULL,
    `battery` VARCHAR(191) NULL,
    `connectivity` VARCHAR(191) NULL,
    `utilities` VARCHAR(191) NULL,

    UNIQUE INDEX `ProductDetails_productId_key`(`productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ProductDetails` ADD CONSTRAINT `ProductDetails_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
