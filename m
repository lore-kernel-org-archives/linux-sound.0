Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC11531E8
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 01:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860827; cv=none; b=oBNpBUFXvqDcstfRV3msWEt40ddU0KYFo0zNCq3bYL7OmdH5iENt/CvtJdoZNexbsuSdJLao0d80XpoF3uojdQdlUVhA+51JbzDpnpgQgg5bitDH37cccunGPyKF28omsNFbe36tLMzoq+QtcJ2M0NWJhtxPHY/VwJ2cLuRIE9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860827; c=relaxed/simple;
	bh=XY37nmqNG8LSTMQNHAjHKB8F9rWldL31UzEsoqY6Iwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUEmkXEV5AIGYarMi8BSHyTT3eFf8edwj6UO97/uEd2Jett08JjeAPZa2m43L8JbWSEL4wY2pQOnEbKz+ErCMY6YobqZjmPP8eeSFvkFOAUIzfyEsH2cPh+jx8pRKvJhoUuCZ7NRpl6ifiPGlQspLXUJgZYvM535FRPrsTxN85o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaOikvXA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaOikvXA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e248aa446so328277a12.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 17:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770860825; x=1771465625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nphbaGokx7wmLDe9QYUTCZ1K1iETOQImZtYank7zNo=;
        b=AaOikvXA1NOaI1dryE+xiqpXdoqzg7xPvenD/tGckZ93Mez+cqkBa1GW0joIVc+L6V
         DgRj78mhYzy1S2gMLE5ZeFzfM4XYqGH1mIzyWJMgDpI7SefvOvM/gQiB61siPHzjUAxp
         VRiyzRlvWVUW/Pakp4iXEe5dESsj+abh77StfYCcxW9unLybOROpvR0492FRySDVUwCa
         VopyDUB6WSyOG6PoC7eivzM2cAd1RTB8if32bKtsEeSAovHAT0n3OC1O044hepy2dZDZ
         vleN4DKrzqoLFMse1aSqmat9zj0CD729FylXnjwWHwKPiXzxXkeUoq4EjK6NycKpt2O4
         dOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770860825; x=1771465625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nphbaGokx7wmLDe9QYUTCZ1K1iETOQImZtYank7zNo=;
        b=T6/mnq4fatqt5ZcnTryDrlPvnKmnx1M/nWN9AtpDVd+FBhlveLI2Nqoxx6iwQNIxw8
         gUyl7g59msBPDitcI6b4WxfX6zbhYbmwyC4Zr+7SfEkltn79GX7FRSARSdDt8HUMFrDg
         3r/COjkOYvoMCKoJgNXyQJrgyOK7LOe5nLDSH+h0Fc3fPU6wNEzyiCVibLmOaN92Fzw6
         /1hFKETajdMufCHgcviWVN8iE/w19UasteaLNuYfLpHo150tT9Xhvw+PTMNKzOU/15HE
         727YgOVZcYobvTTBR1Q9wG2pIMiOKPnbGnzpilWDkkgmaoK7yTfowl9uYyZQp2eMTGWE
         /ilw==
X-Forwarded-Encrypted: i=1; AJvYcCVWh9BizB382t5JgTjcxVWAtOtomwBbMXZERvZ/3zMf8vMoYSU3r22BDnz+Plvr8t8TFTg4duztykLbnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqO9iR26bnl6YzzXSMuwO6KEzyX6uN3qZiKi70YCxd9/0HzqDe
	nBzmV5z9HLlffnYzzgWtKtUkBktZNEc3gje6l1HKLVqrLIrWf9RE5WqG
X-Gm-Gg: AZuq6aK1YbDfDS346X05TFPG1x0E4Bn0gXJVyioH5L3Aotw77237Itr1RkFXt7/ewmx
	pY8mMAbCB8XPg5rZCzPqpMJl/qxEhUuuN+0OiZ9QSAC6pFtlUmmKnTVfpkLpn78t+suy43eemrR
	mxExRjZy+d/VabN8dyEJzw35FOOpuphj4YupCAN6KJBqHYyoiXduVaIHm6k0i0N67tq7U/ZfnNp
	hrzezHRvFqqvh/iheXZRVu5YzosbmMenOtbjspPmXPGfv0VF3RA2yBU7cmFGIV/6FlRoLvU/Ydg
	DoD+HAoGGezROqsgL/c4h6y47Xz74Y9rLeTM1U6e6RnsPBePOYqkHbCs92msKN8lOAh8FtOh432
	0Wd9SvW/O+CvVDReX2umgctPmIInEmaR1NZjPjOlU5zmXjGGaWSaxvsWGu4BeMvXJWT7JYEmDzg
	==
X-Received: by 2002:a17:902:da2d:b0:2a9:320b:d7b9 with SMTP id d9443c01a7336-2ab39b19c98mr8296705ad.29.1770860825100;
        Wed, 11 Feb 2026 17:47:05 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997b3cdsm35473335ad.70.2026.02.11.17.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:47:04 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: vijendar.mukunda@amd.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v3] ASoC: amd: add DMIC support for RPL platform
Date: Thu, 12 Feb 2026 09:46:58 +0800
Message-ID: <20260212014658.8367-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <a68b5c3f-3938-4402-80fa-08da74b87405@gmail.com>
References: <a68b5c3f-3938-4402-80fa-08da74b87405@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMIC support for the AMD RPL platform. The drivers are derived on
the YC platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
v2:
  - Reverse ACP CONFIG PIN from 10 to 14 for rpl
  - Remove the rpl folder
v3:
  - Remove rpl configuration from Kconfig and Makefile

 sound/soc/amd/Kconfig                         |  10 -
 sound/soc/amd/Makefile                        |   1 -
 sound/soc/amd/rpl/Makefile                    |   5 -
 sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
 sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
 .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
 sound/soc/amd/yc/acp6x-mach.c                 |   7 +
 sound/soc/amd/yc/pci-acp6x.c                  |   6 +
 8 files changed, 13 insertions(+), 309 deletions(-)
 delete mode 100644 sound/soc/amd/rpl/Makefile
 delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index fd35a03aadcb..a6eecbe12e84 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -124,16 +124,6 @@ config SND_AMD_ACP_CONFIG
 
 source "sound/soc/amd/acp/Kconfig"
 
-config SND_SOC_AMD_RPL_ACP6x
-        tristate "AMD Audio Coprocessor-v6.2 RPL support"
-        depends on X86 && PCI
-        help
-          This option enables Audio Coprocessor i.e. ACP v6.2 support on
-          AMD RPL platform. By enabling this flag build will be
-          triggered for ACP PCI driver.
-          Say m if you have such a device.
-          If unsure select "N".
-
 config SND_SOC_AMD_ACP63_TOPLEVEL
 	tristate "support for AMD platforms with ACP version >= 6.3"
 	default SND_AMD_ACP_CONFIG
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 4f89d962cce2..23b25ff0d800 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -17,5 +17,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
 obj-$(CONFIG_SND_AMD_ACP_CONFIG) += acp/
 obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
-obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
 obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
deleted file mode 100644
index a3825c5be4e7..000000000000
--- a/sound/soc/amd/rpl/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+
-# RPL platform Support
-snd-rpl-pci-acp6x-y	:= rpl-pci-acp6x.o
-
-obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += snd-rpl-pci-acp6x.o
diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pci-acp6x.c
deleted file mode 100644
index e3afe9172bdf..000000000000
--- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
+++ /dev/null
@@ -1,227 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * AMD RPL ACP PCI Driver
- *
- * Copyright 2022 Advanced Micro Devices, Inc.
- */
-
-#include <linux/pci.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-
-#include "rpl_acp6x.h"
-
-struct rpl_dev_data {
-	void __iomem *acp6x_base;
-};
-
-static int rpl_power_on(void __iomem *acp_base)
-{
-	u32 val;
-	int timeout;
-
-	val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
-
-	if (!val)
-		return val;
-
-	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
-		rpl_acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
-	timeout = 0;
-	while (++timeout < 500) {
-		val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
-		if (!val)
-			return 0;
-		udelay(1);
-	}
-	return -ETIMEDOUT;
-}
-
-static int rpl_reset(void __iomem *acp_base)
-{
-	u32 val;
-	int timeout;
-
-	rpl_acp_writel(1, acp_base + ACP_SOFT_RESET);
-	timeout = 0;
-	while (++timeout < 500) {
-		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
-		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
-			break;
-		cpu_relax();
-	}
-	rpl_acp_writel(0, acp_base + ACP_SOFT_RESET);
-	timeout = 0;
-	while (++timeout < 500) {
-		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
-		if (!val)
-			return 0;
-		cpu_relax();
-	}
-	return -ETIMEDOUT;
-}
-
-static int rpl_init(void __iomem *acp_base)
-{
-	int ret;
-
-	/* power on */
-	ret = rpl_power_on(acp_base);
-	if (ret) {
-		pr_err("ACP power on failed\n");
-		return ret;
-	}
-	rpl_acp_writel(0x01, acp_base + ACP_CONTROL);
-	/* Reset */
-	ret = rpl_reset(acp_base);
-	if (ret) {
-		pr_err("ACP reset failed\n");
-		return ret;
-	}
-	rpl_acp_writel(0x03, acp_base + ACP_CLKMUX_SEL);
-	return 0;
-}
-
-static int rpl_deinit(void __iomem *acp_base)
-{
-	int ret;
-
-	/* Reset */
-	ret = rpl_reset(acp_base);
-	if (ret) {
-		pr_err("ACP reset failed\n");
-		return ret;
-	}
-	rpl_acp_writel(0x00, acp_base + ACP_CLKMUX_SEL);
-	rpl_acp_writel(0x00, acp_base + ACP_CONTROL);
-	return 0;
-}
-
-static int snd_rpl_probe(struct pci_dev *pci,
-			 const struct pci_device_id *pci_id)
-{
-	struct rpl_dev_data *adata;
-	u32 addr;
-	int ret;
-
-	/* RPL device check */
-	switch (pci->revision) {
-	case 0x62:
-		break;
-	default:
-		dev_dbg(&pci->dev, "acp6x pci device not found\n");
-		return -ENODEV;
-	}
-	if (pci_enable_device(pci)) {
-		dev_err(&pci->dev, "pci_enable_device failed\n");
-		return -ENODEV;
-	}
-
-	ret = pci_request_regions(pci, "AMD ACP6x audio");
-	if (ret < 0) {
-		dev_err(&pci->dev, "pci_request_regions failed\n");
-		goto disable_pci;
-	}
-
-	adata = devm_kzalloc(&pci->dev, sizeof(struct rpl_dev_data),
-			     GFP_KERNEL);
-	if (!adata) {
-		ret = -ENOMEM;
-		goto release_regions;
-	}
-
-	addr = pci_resource_start(pci, 0);
-	adata->acp6x_base = devm_ioremap(&pci->dev, addr,
-					 pci_resource_len(pci, 0));
-	if (!adata->acp6x_base) {
-		ret = -ENOMEM;
-		goto release_regions;
-	}
-	pci_set_master(pci);
-	pci_set_drvdata(pci, adata);
-	ret = rpl_init(adata->acp6x_base);
-	if (ret)
-		goto release_regions;
-	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
-	pm_runtime_use_autosuspend(&pci->dev);
-	pm_runtime_put_noidle(&pci->dev);
-	pm_runtime_allow(&pci->dev);
-
-	return 0;
-release_regions:
-	pci_release_regions(pci);
-disable_pci:
-	pci_disable_device(pci);
-
-	return ret;
-}
-
-static int snd_rpl_suspend(struct device *dev)
-{
-	struct rpl_dev_data *adata;
-	int ret;
-
-	adata = dev_get_drvdata(dev);
-	ret = rpl_deinit(adata->acp6x_base);
-	if (ret)
-		dev_err(dev, "ACP de-init failed\n");
-	return ret;
-}
-
-static int snd_rpl_resume(struct device *dev)
-{
-	struct rpl_dev_data *adata;
-	int ret;
-
-	adata = dev_get_drvdata(dev);
-	ret = rpl_init(adata->acp6x_base);
-	if (ret)
-		dev_err(dev, "ACP init failed\n");
-	return ret;
-}
-
-static const struct dev_pm_ops rpl_pm = {
-	RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
-	SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
-};
-
-static void snd_rpl_remove(struct pci_dev *pci)
-{
-	struct rpl_dev_data *adata;
-	int ret;
-
-	adata = pci_get_drvdata(pci);
-	ret = rpl_deinit(adata->acp6x_base);
-	if (ret)
-		dev_err(&pci->dev, "ACP de-init failed\n");
-	pm_runtime_forbid(&pci->dev);
-	pm_runtime_get_noresume(&pci->dev);
-	pci_release_regions(pci);
-	pci_disable_device(pci);
-}
-
-static const struct pci_device_id snd_rpl_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
-	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
-	.class_mask = 0xffffff },
-	{ 0, },
-};
-MODULE_DEVICE_TABLE(pci, snd_rpl_ids);
-
-static struct pci_driver rpl_acp6x_driver  = {
-	.name = KBUILD_MODNAME,
-	.id_table = snd_rpl_ids,
-	.probe = snd_rpl_probe,
-	.remove = snd_rpl_remove,
-	.driver = {
-		.pm = pm_ptr(&rpl_pm),
-	}
-};
-
-module_pci_driver(rpl_acp6x_driver);
-
-MODULE_DESCRIPTION("AMD ACP RPL PCI driver");
-MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/rpl/rpl_acp6x.h b/sound/soc/amd/rpl/rpl_acp6x.h
deleted file mode 100644
index f5816a33632e..000000000000
--- a/sound/soc/amd/rpl/rpl_acp6x.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * AMD ACP Driver
- *
- * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
- */
-
-#include "rpl_acp6x_chip_offset_byte.h"
-
-#define ACP_DEVICE_ID 0x15E2
-#define ACP6x_PHY_BASE_ADDRESS 0x1240000
-
-#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK   0x00010001
-#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
-#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0
-#define ACP_PGFSM_STATUS_MASK           3
-#define ACP_POWERED_ON                  0
-#define ACP_POWER_ON_IN_PROGRESS        1
-#define ACP_POWERED_OFF                 2
-#define ACP_POWER_OFF_IN_PROGRESS       3
-
-#define DELAY_US        5
-#define ACP_COUNTER     20000
-
-/* time in ms for runtime suspend delay */
-#define ACP_SUSPEND_DELAY_MS    2000
-
-static inline u32 rpl_acp_readl(void __iomem *base_addr)
-{
-	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
-}
-
-static inline void rpl_acp_writel(u32 val, void __iomem *base_addr)
-{
-	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
-}
diff --git a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h b/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
deleted file mode 100644
index 456498f5396d..000000000000
--- a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * AMD ACP 6.2 Register Documentation
- *
- * Copyright 2022 Advanced Micro Devices, Inc.
- */
-
-#ifndef _rpl_acp6x_OFFSET_HEADER
-#define _rpl_acp6x_OFFSET_HEADER
-
-/* Registers from ACP_CLKRST block */
-#define ACP_SOFT_RESET                                0x1241000
-#define ACP_CONTROL                                   0x1241004
-#define ACP_STATUS                                    0x1241008
-#define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
-#define ACP_PGFSM_CONTROL                             0x124101C
-#define ACP_PGFSM_STATUS                              0x1241020
-#define ACP_CLKMUX_SEL                                0x1241024
-
-/* Registers from ACP_AON block */
-#define ACP_PME_EN                                    0x1241400
-#define ACP_DEVICE_STATE                              0x1241404
-#define AZ_DEVICE_STATE                               0x1241408
-#define ACP_PIN_CONFIG                                0x1241440
-#define ACP_PAD_PULLUP_CTRL                           0x1241444
-#define ACP_PAD_PULLDOWN_CTRL                         0x1241448
-#define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x124144C
-#define ACP_PAD_SCHMEN_CTRL                           0x1241450
-
-#endif
diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 0294177acc66..de49c812124a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 1140ed1cbb3d..296b74252a8a 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -163,6 +163,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	switch (pci->revision) {
 	case 0x60:
 	case 0x6f:
+	case 0x62: /* RPL */
 		break;
 	default:
 		dev_dbg(&pci->dev, "acp6x pci device not found\n");
@@ -205,6 +206,11 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	case ACP_CONFIG_2:
 	case ACP_CONFIG_3:
 	case ACP_CONFIG_9:
+	case ACP_CONFIG_10: /* Reserved for RPL */
+	case ACP_CONFIG_11: /* Reserved for RPL */
+	case ACP_CONFIG_12: /* Reserved for RPL */
+	case ACP_CONFIG_13: /* Reserved for RPL */
+	case ACP_CONFIG_14: /* Reserved for RPL */
 	case ACP_CONFIG_15:
 		dev_info(&pci->dev, "Audio Mode %d\n", val);
 		break;
-- 
2.51.2

