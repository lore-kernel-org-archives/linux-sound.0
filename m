Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4B2D97A4
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810637; cv=none; b=U/oYlayTHbobYUjdouxmznUJe4azEvRnFo+w4nxUOMBfRoudUSLqky7ryI0+/27zSEGBHPyHdkHivcAm7GZ1Yjj1bvUOIkKR0TBHALrUQkdvefkB7psdjJZMCsVIZk9MbIJzhV0fT/Q62yo2yZqTPoT4YUHAuSaEA6UAQbYkctM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810637; c=relaxed/simple;
	bh=SwXDL+9r1YmHS/0ou/9bJXrs+9tdpM6+KYJFch3er+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmIHZ6QDGel5MCwebt/E+uG1tUCwc99gUPD8tafXDNECfck2ODcAEa+hjpicW662TUHUro+urdU5qJbrJEsHqZfw5WBuj81GVJ66JljM+zEheDnkb6LNrPT+ZTkbEKzFPFX6ZCwzcL9sjT/3ZynNAoyWV9FnmoUbCxxK4tUSsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifDoR+PU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifDoR+PU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8249cb73792so639242b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770810635; x=1771415435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNfwZ5lL5yXy0wg5uoXPLdwNkfu6oCHEWkiaZfZFwMk=;
        b=ifDoR+PUWFyt8Y2tj74KbkvzS0DKYRYMnGd7ShbKe+I+GAHxUZpURQFtu0Pe2rreaA
         G75PXWOvZGHoOYO7UfiaX3VgXAnhOpUKCTD4I6VtVunhGSIgFF+AxRrLkyyERQNY7pDz
         ik97zFHE8rqeM3ESxb4StsTj88APpKk19hYTQbrXQ/sksA2lGQangaNpBVONdLpDZf2w
         u7uqk2PjAbAlu7BdqEUXtzy/d4tAriuEZAlX6oeQDwDNYFbCDQLf2EZuJO0kYxUKYkcS
         2lHIdbaeLOXFVFr5NI+mhrV+bGwZltUzJVO9tC9FPd6XH4PXaWLE4C9Md0k7C+YCKsJC
         MoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810635; x=1771415435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNfwZ5lL5yXy0wg5uoXPLdwNkfu6oCHEWkiaZfZFwMk=;
        b=V0ofx0TMyqx8YcNSDr98Nb53UKVJUT2Db+ZTormvBf3I2PfuK9ss0T85sUHMAlL8wH
         vqoeYh9+WpHNtAy9McN8OWioUS7vhJxpPvxJ8I7hX7rvz63dZE7jCThrsJ1MzQbjmtPY
         WLQq7TuSy5WSArljaWjdDQx4O8LPIonKGN63HXIEdxQ1m9fn2FwiR8SAYBfZvPPLPtVr
         eO+Ci786hhIjSQRY6CUsFeQPxJE3+YDCNVXxhZ+N8G9vnbimNU0SO1qHl2HLpvBfUaqT
         rQcTNrGPxAtVfrIgA52oY4RFbtMHUp3EI2tS5/aSqnhn/7a7cYj7noz4h+RjdhEw2rbu
         FeeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8GnAmjV4jTuGmd/blyQMiGUIha4IMYkX7n428FP3cAEInDclO3claxuxyp4zZGVXibJ2P5U3DNDyyoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPwKroSwHf7/Fd5WihQuL1XaqKAjA/9ES3lTdRdQgB6D1rKJ1M
	v0nTeoBhXVwXq/2KAFXmRgqvglXZPg7aQ5hUccqDJRXYsBQhZiO1PnZl
X-Gm-Gg: AZuq6aITUuP5vZwgx7SGfQBvXDyJUkLZVRqMU3ahNfMcA+DRa0/GqM48ISKv9LrmtIa
	36gd66VNOz3JPhQBNwwtZWzBvep+R+iU+SVA5MUvPAOV7BHkpDiCs6XK+yDIq6NHeEOwWxXC+i3
	0kt4DqhDHo3Zf4ZHQadogisJ/ukhh+VaOB8cNXAXpLTw7RFnH96l5D9qa9/3BpcyyitlMtRL9dz
	UKIEH/9wdzPpMCdR9A433DrYWMdy7YRvPPfl50OE1Sl1U7iodHXQkGQZRPOwUc4SnI7s3+QV3EB
	jRM8/MpH9yVwPF/ss8FcGo0tjuPxwjkcqAQJ+Gjs3maHy/2Xw7V+efga67MtViN5wTwjpvCsDtI
	onySeI8dwv3H1rvGf6TZ3inhL3wsri6Gz8Uw5zXmJ7F2qebdgQpZjtXh9Swpme1wS8JC0XfpHPg
	==
X-Received: by 2002:a05:6a00:a111:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8249b016338mr2023540b3a.28.1770810635082;
        Wed, 11 Feb 2026 03:50:35 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd627sm2510975b3a.25.2026.02.11.03.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:50:34 -0800 (PST)
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
Subject: [PATCH v2] ASoC: amd: add DMIC support for RPL platform
Date: Wed, 11 Feb 2026 19:50:08 +0800
Message-ID: <20260211115008.100239-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <3487b803-9c65-4371-b83e-c7a24ad45e2b@amd.com>
References: <3487b803-9c65-4371-b83e-c7a24ad45e2b@amd.com>
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

 sound/soc/amd/rpl/Makefile                    |   5 -
 sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
 sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
 .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
 sound/soc/amd/yc/acp6x-mach.c                 |   7 +
 sound/soc/amd/yc/pci-acp6x.c                  |   6 +
 6 files changed, 13 insertions(+), 298 deletions(-)
 delete mode 100644 sound/soc/amd/rpl/Makefile
 delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h

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

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.51.2

