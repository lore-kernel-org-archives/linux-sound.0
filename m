Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006A21254B
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 00:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770943395; cv=none; b=gfdKGjLbtH4IZnrl+HsIE5FU1PpFrIRSkPommXy+a9/rg9hnoS9nFFExHLX7t9n7Q9XMIslwyPMiedDxNKMdzv2f1zFCWVlFaHD0mnHM+T4QKN1YD/AfjmNBJREagHQq79pjArD+xfLLOV/ogkj3qeF1KL7sWYxEPwaB1a5pND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770943395; c=relaxed/simple;
	bh=Grm7vlf6RQceqExtGTxxpWioQmU+kkTizKOoVLFHwzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQ7vWSOyXXDWJjgk0xYDl7ItgsWtiHLgZ46BAkQgnBUtw0+hJ9mTb3KgPnplE4IXfKaMja05VzMF2sCy3wcUaITB+WvdGCmfMg8cVLjMJPscaV9Pq9NnhhwQrSg0QOuETzxR3t/PXzhDXuLtvbC7ifmVyJiqJZDfSndz/wT4pNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyGWtKx3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyGWtKx3"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824a829f9bbso249379b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 16:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770943393; x=1771548193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4+SY/jOs4NZzW456dpFyxP/ymAMo96jsmXjl89V8YI=;
        b=SyGWtKx3FGz6Re2NoR7jN+vdx2jno5WUFkNEzq3HKkUllNf7Ls7zQuleVE6QImWi1T
         btLppqfTkbg7KDauk5LJ4iz051LTVkgA+65oBwTgnHsp3vW9ipLbJiIRfIF+9MY8Xyxk
         MXv11mNhqDH+7FvbSDVY13p4FAUzhJWbQVJtrsVwCXmJsEkzP18KkantnezeyT32QsLM
         oA4xvWNQnb+l5u0U5gmu0PmA8UxXXfwHgi017I1Ajl1rVx5g/sZLShWAq+KKOmNLlcdH
         d1KszTY/sMU+FwXaxgPDNcUwe6VptZP+N8Kka01ygqZhkgHYeVJWahoYCfeIuI5sz8GU
         VIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770943393; x=1771548193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4+SY/jOs4NZzW456dpFyxP/ymAMo96jsmXjl89V8YI=;
        b=n4INfPrFycJU71Z/oyUhfqhMjste1bG82vMo4AfaCD3CC07SATqcA0RMQw3WVzEHx8
         FZxfA0QNNQ/TjjeoktiWQlCZcVnatA5rA+ybSeTtutzDp0QndrqpOJmadY+ObnjdY1Wj
         GqHsss7ljqpvpIr82i2GAyUDFPRFzyp3fijMH4xansT7UsYZ554Dzv0hrQAf6dxaCvUU
         vZmi1DvGXMoY7bKM3/ljs/8KKZKSbpCKYDoWxhODP33F2cLgkjJxCz650F/asv0Vda8s
         MGZSefAg8UMGjeNDxefDq3T4y9umuVz+JIH/ZULIsYTYMn3lKOosywzggjKqXOPvbEFu
         rF6w==
X-Forwarded-Encrypted: i=1; AJvYcCVNzAWiiywexmXUBqRfDEUEOSbGVGYvcyuJ9gJ6yJ+p44UsBjBJt1qfkXx1abo8Kb1heegGyM6AB+1adQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNG9rMuCDPTH4szdo/v9jf0SiGc4mWfE4Wd0RBIOL26o8ba6tK
	7XKE9nGayAw3wYczwzDRYpqD/Xg5FsPetQ3dUP9Uxb+EsW/Qthnu3sFk
X-Gm-Gg: AZuq6aI3At0F7HuY/Goe+tVvF/mSLhjeM7Fdn6a2DwN/qwGcVM1AHDv3hE1z+vsRn1O
	JkXMaA6nELiDaAms9pZBjywttHTR84WJRUXJfTgH6PGxbYQ1mWbOtK3MYWvp0YfmV5mP44MA9iI
	Z4jVubIaN1V35fjiPCPebGtc2NPcWZXDWDOczcG4UjPT4xw+xQlkSj/fGvL5fIRF9skVB/3JHT1
	avzl4N0inLXIX0MF9/QhTCxlU05F/ZMieTaB/js7HSE7GM4Xlzo6kfJy+xlcig/WGo5+UNHfE46
	GB7aDUpzGuq4ujW+1nxonbSWwN/W7oMITNQqGeyhGPSu6m15MnQ2/Yipvl8CbBqCg0CAMOuyi7j
	0LvVEjAu1o/OPvm7vhwWSspWUeSjjkRqymkhy5iT8BZwOQQ03LfoNSCsw3sM1F2jyLah5q4AOzw
	==
X-Received: by 2002:a05:6a00:1249:b0:81f:9986:9205 with SMTP id d2e1a72fcca58-824c961c682mr235524b3a.57.1770943392956;
        Thu, 12 Feb 2026 16:43:12 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69ba2sm515751b3a.38.2026.02.12.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:43:12 -0800 (PST)
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
Subject: [PATCH v5 2/3] ASoC: Drop RPL driver
Date: Fri, 13 Feb 2026 08:42:45 +0800
Message-ID: <20260213004246.16615-3-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260213004246.16615-1-qby140326@gmail.com>
References: <20260213004246.16615-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPL driver is no longer needed because its functionality has been
superseded by the YC driver

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 sound/soc/amd/Kconfig                         |  10 -
 sound/soc/amd/Makefile                        |   1 -
 sound/soc/amd/rpl/Makefile                    |   5 -
 sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
 sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
 .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
 6 files changed, 309 deletions(-)
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
-- 
2.51.2

