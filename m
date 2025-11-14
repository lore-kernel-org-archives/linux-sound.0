Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2430C360
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130958; cv=none; b=aOZuQDAyjgmZrm3z32WBmC9jAyn1JTqdIyGTm1QpZVCRvYlGVQnnIBuPEwtvKk57u6uz5I+1wuZ4r+NGnAGYmJ8XafI3Sk1wOAsONLYcwsM/e0zJAfqpszTuyo9xPc4CW9qgdC88X1KZOTp5L6Gyg0hEiOU5QfROVAZaDMPXnBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130958; c=relaxed/simple;
	bh=CjD4q1ZMbBJWQvc4Bgiana/20OE4djcpHnIJ+VkNDyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXmptTd5BGnL5WhP5B8K3vbA0YvWYmVljcAuT9+I9rS0imRgPuHEPph+NG3UGyEqMEMKwaRwgYC6en0pnkoOHInJmGkv0ryGoynGwbQqJk8LL25IfWrAPeCtPhQkjrm2gFyu23U95enZTQA7hE+puULPnowAQz26fgencotKgu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXdiqQV6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXdiqQV6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so3594135a12.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763130955; x=1763735755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=;
        b=TXdiqQV6NcYruV7Dt4b7flyKgNuimcwFZaXs8bSHz46HtgWWwsopO/VRrdAmrtHNEX
         afb4m1KXxYK/LEwb7O0ur0inrWqt6g7uNgwUBfbEc9EH0BW/Lj/LFqGQjYPCilKKiIEz
         9qndtx3Fr+0coV0FMLkONsaKrXUrXOpk2b2rgHwL45o5HfE39VpY9dqVLlckjoqTjjee
         FrL+dBB8/k6lM5gtAaecOOIl35/cv5UCfIQuwZDCLViVZYp2v2S8VUm7fkHwl5u88sWh
         wFMEzrK9lR4HIEaeu/uRSo1lYhkavSITOLx/v9NV4g3/VEKfTMmjEht++nbhzYz6yBh7
         YhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130955; x=1763735755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=;
        b=seA/k5/BPQcjMhvRo0UTmq6OjWkRdu+6FXzy7yGnbRzIJIdFE7Efs4JfFmyvNDIPNw
         ckKj3X6ABpISQJ+9k4uYob/1VZebT+mCb82PNm7V5vfeGnROafBhXhBMjpL9+nuEIreB
         GZOjI9BnId7OJseOrU/fP1//A/RVSYIuaKX8ESSH22Xm5yW52GEOyMZc6MzKTZd/ULyz
         FwE7e6z6Hl0Z/OULOFFun/TdNPR0ztTj7NvtbbdjhZecb22BLTUCVsHciofZMRPe+z1y
         Zm2aSZRPHu6opSszgxgfCSNvofKvd0ex488shqMrK4/JecTx7nRMhqiDQqDsxqpITWP9
         L3EA==
X-Gm-Message-State: AOJu0Yx+gChC8azXnQBum2hGMbAwpADvfYcExl56xoohmhBoUeqO+HvE
	6bv/lufEXYS2qwWiJw/ANggr52v20S2t1wJDY1yXOKYvd+ola0ag/N12
X-Gm-Gg: ASbGncv25LWMRIoH/Cmii7h6ur7NTHwLqBWAeW+3G+UWFEbxv85T646xuMe+Gs5p+Sk
	dlQfUGRurApRDwYGFKwrmXkgwa7BEOy3LRJ6yKbdvhbrh06tziyn9eeULSR55RnRJ9fRVamVJ9g
	EKxQ8ZNGQ9lZvETFuDdk8YI2TC0lspcNeQ8NHjsIgd2tB3NXtPNbAfOJh8lcDySveTrFrhA4bde
	Vxi8H2gZAS9gxQSMe8tAhAC+9DTQe1ML09OlvaCVx2uuYSmqXyAWIL44c05qja3DaAwgkXZU4VG
	dLJjzpXkrNjfxa9PxE8wKPvXRzBSQnQOIMaFbhH3FidviT4vFBdpkCkhwm5v7R856t6QpUdgO2f
	BMgAf0U+Su4g7gEu/LmQn53uPkfoW84R6nOeTRXWpsZmOnpw9RkrXcgYoakWnCVr5zpuNjZ0rhQ
	g3YCOh9kkMc0X2HzAo3QrTVBKCpLGU+EPq/1iXwg==
X-Google-Smtp-Source: AGHT+IEkXh8aOaEa9VYbV+mSh0EevYMCtp8lTPm/U4emLvWPOqyGjxIaHiTsSpt8P+ehxwrwdlpbfQ==
X-Received: by 2002:a17:907:6d1b:b0:b72:ad95:c1c2 with SMTP id a640c23a62f3a-b7367828c43mr340632166b.11.1763130954832;
        Fri, 14 Nov 2025 06:35:54 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80afbsm391264766b.11.2025.11.14.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:35:54 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: SOF: imx9: use SCMI API for LM management
Date: Fri, 14 Nov 2025 06:35:03 -0800
Message-ID: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
API. The SIPs were intended to act as placeholders until the support for
said protocol was upstreamed.

The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
replaced by a LMM protocol command with the same effect (i.e. setting the
boot address) since using the CPU protocol would require additional
permissions (which TF-A already had). Apart from this, the SIPs are
replaced by their equivalent Linux LMM commands.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v2:

* add dependency on CONFIG_IMX_SCMI_LMM_DRV.
* link to v1: https://lore.kernel.org/lkml/20251112144124.680-1-laurentiumihalcea111@gmail.com/

 sound/soc/sof/imx/Kconfig |  1 +
 sound/soc/sof/imx/imx9.c  | 36 ++++++++----------------------------
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 327e2df94a58..09d88ce5b9e6 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_SOF_IMX8
 config SND_SOC_SOF_IMX9
 	tristate "SOF support for i.MX9"
 	depends on IMX_DSP
+	depends on IMX_SCMI_LMM_DRV
 	select SND_SOC_SOF_IMX_COMMON
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
index 853155d5990a..e56e8a1c8022 100644
--- a/sound/soc/sof/imx/imx9.c
+++ b/sound/soc/sof/imx/imx9.c
@@ -3,19 +3,11 @@
  * Copyright 2025 NXP
  */
 
-#include <linux/arm-smccc.h>
+#include <linux/firmware/imx/sm.h>
 
 #include "imx-common.h"
 
-#define IMX_SIP_SRC 0xC2000005
-#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
-
-#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
-
-#define IMX_SIP_LMM 0xC200000F
-#define IMX_SIP_LMM_BOOT 0x0
-#define IMX_SIP_LMM_SHUTDOWN 0x1
-
+#define IMX95_M7_CPU_ID 0x1
 #define IMX95_M7_LM_ID 0x1
 
 static struct snd_soc_dai_driver imx95_dai[] = {
@@ -38,7 +30,6 @@ static int imx95_ops_init(struct snd_sof_dev *sdev)
 
 static int imx95_chip_probe(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
 	struct platform_device *pdev;
 	struct resource *res;
 
@@ -49,31 +40,20 @@ static int imx95_chip_probe(struct snd_sof_dev *sdev)
 		return dev_err_probe(sdev->dev, -ENODEV,
 				     "failed to fetch SRAM region\n");
 
-	/* set core boot reset address */
-	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
-		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_reset_vector_set(IMX95_M7_LM_ID, IMX95_M7_CPU_ID,
+					     0, res->start);
 }
 
 static int imx95_core_kick(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID, SCMI_IMX_LMM_BOOT, 0);
 }
 
 static int imx95_core_shutdown(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID,
+				      SCMI_IMX_LMM_SHUTDOWN,
+				      SCMI_IMX_LMM_OP_FORCEFUL);
 }
 
 static const struct imx_chip_ops imx95_chip_ops = {
-- 
2.43.0

